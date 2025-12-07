--local functions
  local function modify_game_start_scripts()--apparently, the cutscene prevents the player from being teleported.
		local freeplay = remote.interfaces.freeplay
    if freeplay then
			remote.call("freeplay", "set_skip_intro", true) --No intro message
      if freeplay.set_disable_crashsite then
        remote.call("freeplay", "set_disable_crashsite", true) --No crashsite cutscene nor ship.
      end
    end
  end

  local function refresh_data_storage()--This should allow new storages to be added without the creation of a new world
    if storage.players == nil then
      storage.players = {} end
    if storage.supercomputer == nil then
      storage.supercomputer = {} end
    if storage.story == nil then
      storage.story = {} end
    if storage.story.tech_progress == nil then
      storage.story.tech_progress = 0 end
		if storage.story.handlers == nil then
			storage.story.handlers = {} end
		if storage.worms == nil then
			storage.worms = {} end
		if storage.worms.recent_launch_count == nil then
		storage.worms.recent_launch_count = 0 end
		if storage.worms.active_worms == nil then
		storage.worms.active_worms = {} end
  end


--init events
  script.on_init(function(e)--Code shamelessly plagerised from Platformer by Corlin and Xiroc
    modify_game_start_scripts()--Necessary for player to be teleported and imprisoned
    refresh_data_storage()
		set_starting_flags()--sets certain flags based on starting settings
		deal_with_stupid_handlers()

    if settings.global["start-as-SELF"].value then
      gameplay.create_self()--Create starting space platform
      gameplay.give_starting_items()
    end
    gameplay.create_permission_group()
		register_vehicle_requirements()
  end)

  script.on_configuration_changed(function()
    refresh_data_storage()
		register_vehicle_requirements()
  end)

	script.on_load(function()
		deal_with_stupid_handlers()
		register_vehicle_requirements()
	end)

--Upon player joins
  script.on_event(defines.events.on_player_created, function(e)
  	local player = game.players[e.player_index]
  	storage.players[player.index] = {}--initialise player storage
  	if settings.global["start-as-SELF"].value then
    	player.teleport({ x = 0, y = 0 }, storage.platform.surface.name)
    	player.enter_space_platform (storage.platform)
  	end
    local group = game.permissions.get_group("players")
      if group then
      	group.add_player(player)
      end

  		--local anchor = {gui=defines.relative_gui_type.space_platform_hub_gui, position=defines.relative_gui_position.bottom}
    	--local frame = player.gui.relative.add{type="frame", anchor=anchor}
  		--frame.add{type="button", name="deploy_scout_o_tron", caption={"spider-ui.deploy-scout-o-tron"}}
  end)

--on tick events
  script.on_event(
  	defines.events.on_tick,
  	function(event)
  		story.on_story_tick(event)
  		supercomputer.on_supercomputer_tick()
  	end
  )

function deal_with_stupid_handlers()
  if settings.global["start-as-SELF"].value then --these scripts shouldnt run if we dont have self.
		if not storage.story.handlers.no_more_softlock then
  		script.on_nth_tick(256,--be aware this gets unregistered later
  			function()
  				gameplay.softlock_detection()
  			end
  		)
	end
	if not storage.story.handlers.no_more_self_control then
  		script.on_nth_tick(1,
  			function()
  				gameplay.self_control()
  			end
  		)
  	end
	end
end

function set_starting_flags()
	if not settings.global["start-as-SELF"].value then
		storage.story.handlers.no_more_self_control = true
		storage.story.handlers.no_more_softlock = true
	end
end


	script.on_nth_tick(36000,--past 10 min
		function()
			storage.worms.recent_launch_count = 0
		end
	)

	script.on_nth_tick(300,
		function()
			ice_worm.check_active_worms()
		end
	)

--rocket launch
	script.on_event(
		defines.events.on_rocket_launch_ordered,
		function(event)
			ice_worm.rocket_launched(event)
		end
	)

	script.on_event(
		defines.events.on_script_trigger_effect,
		function(event)
			if event.effect_id == "spawn-hatchling" then ice_worm.spawn_hatchling(event) end
		end
	)





--on player action related events

  --i crie everytime i redo several hours of work.
  --stolen from allison
  filters = {
  	{
  		filter = "name",
  		name = "supercomputer",
  		mode = "or"
  	},
  }

  script.on_event(--machines create machines create machines create machines create machines create.venjent.wav
  	defines.events.on_built_entity,
  	function(event)
  		handle_build_event(event)
  	end,
  	filters
  )

  script.on_event(
  	defines.events.on_robot_built_entity,
  	function(event)
  		handle_build_event(event)
  	end,
  	filters
  )

  script.on_event(
      defines.events.on_space_platform_built_entity,
      function(event)
          handle_build_event(event)
      end,
      filters
  )

  script.on_event(
  	defines.events.on_player_rotated_entity,
  		function(event)
  			local entity = event.entity
  			if entity.valid == false then return end
  			if entity.name == "supercomputer" then
  				supercomputer.on_supercomputer_rotated(entity)
				end
  		end
  )

  script.on_event(
  	defines.events.on_player_flipped_entity,
  		function(event)
  			local entity = event.entity
  			if entity.valid == false then return end
  			if entity.name == "supercomputer" then
  				supercomputer.on_supercomputer_flipped(entity)
  			end
  		end
  )


  function handle_build_event(event)
  	local entity = event.entity
  	if entity.name == "matter-reconstructor" then
  		gameplay.on_vital_building_built(entity)
  	elseif entity.name == "proton-decay-thermoelectric-generator" then
  		gameplay.on_vital_building_built(entity)
  	elseif entity.name == "supercomputer" then
  		supercomputer.on_supercomputer_built(entity)
  	end
  end

  script.on_event(
  	defines.events.on_object_destroyed,
  	function(event)
  		supercomputer.on_supercomputer_destroyed(event)
  	end
  )

  script.on_event(defines.events.on_gui_click, function(event)
      if event.element.name == "deploy_scout_o_tron" then
				event.element.parent.destroy() --tempoary to remove the old gui
      end
  end)

---on research and player progress
  script.on_event(defines.events.on_research_finished,
  	function(event)
  		story.trigger_story_event(event)
  		gameplay.research_finished(event)
  	end
  )

  script.on_event(defines.events.on_research_reversed,
  	function(event)
  		gameplay.research_removed(event)
  	end
  )

-- Register vehicle deployment requirements with spider-launcher
function register_vehicle_requirements()

  if remote.interfaces["spider-launcher"] then
    -- Register scout-o-tron: requires scout-o-tron-pod to deploy
    if remote.interfaces["spider-launcher"]["register_vehicle_requirements"] then
      remote.call("spider-launcher", "register_vehicle_requirements", "scout-o-tron", {
        required_items = {"scout-o-tron-pod"},
        deploy_item = "scout-o-tron-pod",  -- Deploy the pod, not the vehicle itself
        entity_name = "scout-o-tron"  -- But create a scout-o-tron entity
      })
      --game.print("[TFMG] Registered scout-o-tron deployment requirements")
    end
    
    -- Register default equipment and trunk items for scout-o-tron
    if remote.interfaces["spider-launcher"]["register_vehicle_defaults"] then
      remote.call("spider-launcher", "register_vehicle_defaults", "scout-o-tron", {
        equipment_grid = {
          {name = "solar-cell-equipment", count = 1},
          {name = "roboport-1-equipment", count = 1}
        },
        trunk_items = {
          {name = "construction-robot", count = 1}
        }
      })
      --game.print("[TFMG] Registered scout-o-tron default equipment and trunk items")
    end
  end
end





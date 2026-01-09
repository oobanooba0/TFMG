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
    if not storage.players then
      storage.players = {} end
    if not storage.supercomputer then
      storage.supercomputer = {} end
    if not storage.story then
      storage.story = {} end
    if not storage.story.tech_progress then
      storage.story.tech_progress = 0 end
		if not storage.story.handlers then
			storage.story.handlers = {} end
		if not storage.worms then
			storage.worms = {} end
		if not storage.worms.recent_launch_count then
		storage.worms.recent_launch_count = 0 end
		if not storage.worms.active_worms then
		storage.worms.active_worms = {} end
		if not storage.gameplay then
			storage.gameplay = {} end
		if not storage.story.self_version then
			story.get_self_version()
		end
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
		--register_vehicle_requirements()
  end)

  script.on_configuration_changed(function()
    refresh_data_storage()
		supercomputer.make_the_prod_bar_show()
		--register_vehicle_requirements()
  end)

	script.on_load(function()
		deal_with_stupid_handlers()
		--register_vehicle_requirements()
	end)

--Upon player joins
  script.on_event(defines.events.on_player_created, function(e)
  	local player = game.players[e.player_index]
  	storage.players[player.index] = {}--initialise player storage
  	if settings.global["start-as-SELF"].value then
    	player.teleport({ x = 0, y = 0 }, storage.platform.surface.name)
    	player.enter_space_platform (storage.platform)
			if e.player_index == 1 then
				player.request_translation({"self.self-platform-name"})
			end
  	end
    local group = game.permissions.get_group("players")
    if group then
    	group.add_player(player)
    end
  end)

	script.on_event(defines.events.on_force_created,
	function()
		supercomputer.make_the_prod_bar_show() --updating the prod for newly created forces and such.
	end
)


--cursed localisation event
script.on_event(defines.events.on_string_translated, function(e)
  if e.translated and e.localised_string[1] == "self.self-platform-name" then
		if not storage.platform then return end
    storage.platform.name = e.result
  end
end)




--on tick events
--taken nth ticks.
--36000
--300
--256
--1
--5

  script.on_event(
  	defines.events.on_tick,
  	function(event)
  		story.on_story_tick(event)
  		supercomputer.on_supercomputer_tick()
  	end
  )

	script.on_nth_tick(36000,--past 10 min, I should do a rolling average but im lazy.
		function()
			storage.worms.recent_launch_count = 0
		end
	)

	script.on_nth_tick(300,
		function()
			ice_worm.check_active_worms()
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
  	{filter = "name", name = "supercomputer", mode = "or"},
  	{filter = "name", name = "matter-reconstructor", mode = "or"},
  	{filter = "name", name = "proton-decay-thermoelectric-generator", mode = "or"},
  	{filter = "name", name = "cargo-bay", mode = "or"},
		{filter = "ghost_name", name = "cargo-bay", mode = "or"},
		{filter = "name", name = "scout-o-tron", mode = "or"}, --shouldnt be needed
		{filter = "name", name = "constructron", mode = "or"},
		{filter = "name", name = "solar-cell", mode = "or"},
		--{filter = "vehicle", mode = "or"},
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
    defines.events.script_raised_built,
    function(event)
      handle_build_event(event)
    end,
    filters
  )

	script.on_event(
    defines.events.script_raised_revive,
    function(event)
      handle_build_event(event)
    end,
    filters
  )

	script.on_event(
    defines.events.on_entity_cloned,
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
		elseif entity.name == "cargo-bay" or entity.type == "entity-ghost" and entity.ghost_name == "cargo-bay" then
			cargo.on_bay_built(event)
		elseif entity.name == "constructron" or entity.name == "scout-o-tron" then
			gameplay.on_spider_built(entity)
		elseif entity.name == "solar-cell" then
			gameplay.on_solar_panel_built(entity)
		end
  end

  script.on_event(
  	defines.events.on_object_destroyed,
  	function(event)
  		supercomputer.on_supercomputer_destroyed(event)
			cargo.on_bay_destroyed(event)
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
			supercomputer.make_the_prod_bar_show()
  	end
  )

  script.on_event(defines.events.on_research_reversed,
  	function(event)
  		gameplay.research_removed(event)
  	end
  )

	script.on_event(defines.events.on_player_respawned,
		function(event)
			gameplay.on_respawn(event)
		end
	)

-- Register vehicle deployment requirements with spider-launcher
function register_vehicle_requirements()

  if remote.interfaces["spider-launcher"] then
    -- Register scout-o-tron: requires scout-o-tron-pod to deploy
    if remote.interfaces["spider-launcher"]["register_vehicle_requirements"] then
      remote.call("spider-launcher", "register_vehicle_requirements", "scout-o-tron", {
        required_items = {"scout-o-tron"},
        deploy_item = "scout-o-tron",  -- Deploy the pod, not the vehicle itself
        entity_name = "scout-o-tron"  -- But create a scout-o-tron entity
      })
      --game.print("[TFMG] Registered scout-o-tron deployment requirements")
    end
    
    -- Register default equipment and trunk items for scout-o-tron
    if remote.interfaces["spider-launcher"]["register_vehicle_defaults"] then
      remote.call("spider-launcher", "register_vehicle_defaults", "scout-o-tron", {
        equipment_grid = {
          --{name = "solar-cell-equipment", count = 1},
          --{name = "roboport-1-equipment", count = 1}
        },
        trunk_items = {
          --{name = "construction-robot", count = 1}
        }
      })
      --game.print("[TFMG] Registered scout-o-tron default equipment and trunk items")
    end
  end
end







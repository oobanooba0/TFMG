require("scripts.init")
require("scripts.story")
require("scripts.gameplay")
gameplay = require("scripts.gameplay")
require("scripts.supercomputer")
supercomputer = require("scripts.supercomputer")
story = require("scripts.story")

--i crie everytime i redo several hours of work.
--stolen from allison
filters = {
	{
		filter = "name",
		name = "supercomputer",
		mode = "or"
	},
}
--- on events

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
script.on_event(
	defines.events.on_tick,
	function(event)
		story.on_story_tick(event)
		supercomputer.on_supercomputer_tick()
	end
)
script.on_nth_tick(256,
	function()
		gameplay.softlock_detection()
	end
)

script.on_nth_tick(1,
	function()
		gameplay.self_control()
	end
)

---on research
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

-- Upon player joins

script.on_event(defines.events.on_player_created, function(e)
	local player = game.players[e.player_index]
	storage.players[player.index] = {}--initialise player storage

  player.teleport({ x = 0, y = 0 }, storage.platform.surface.name)
  player.enter_space_platform (storage.platform)
  local group = game.permissions.get_group("players")
    if group then
    	group.add_player(player)
    end

		local anchor = {gui=defines.relative_gui_type.space_platform_hub_gui, position=defines.relative_gui_position.bottom}
  	local frame = player.gui.relative.add{type="frame", anchor=anchor}
		frame.add{type="button", name="deploy_scout_o_tron", caption={"spider-ui.deploy-scout-o-tron"}}
end)

---On open gui
script.on_event(defines.events.on_gui_opened, function(event)
	local player_storage = storage.players[event.player_index]
  if event.gui_type == defines.gui_type.entity then
		player_storage.gui_entity = event.entity
		if event.entity.type == "space-platform-hub" then 
			player_storage.hub = event.entity--we're gonna store the location, which is always 0,0
		end
  end
end)

script.on_event(defines.events.on_gui_click, function(event)
    if event.element.name == "deploy_scout_o_tron" then
			gameplay.deploy_scout_o_tron(event)
    end
end)

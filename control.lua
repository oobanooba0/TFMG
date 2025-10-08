require("scripts.init")
require("scripts.story")
require("scripts.thermal-system")
thermal_system = require("scripts.thermal-system")
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
		name = "matter-reconstructor",
		mode = "or"
	},
	{
		filter = "name",
		name = "assembling-machine",
		mode = "or"
	},
	{
		filter = "name",
		name = "furnace",
		mode = "or"
	},
	{
		filter = "name",
		name = "matter-reconstructor",
		mode = "or"
	},
	{
		filter = "name",
		name = "proton-decay-thermoelectric-generator",
		mode = "or"
	},
	{
		filter = "name",
		name = "supercomputer",
		mode = "or"
	},
	{
		filter = "name",
		name = "neural-node",
		mode = "or"
	},
	{
		filter = "name",
		name = "micro-assembler",
		mode = "or"
	},
	{
		filter = "name",
		name = "chemistry-plant",
		mode = "or"
	},
	{
		filter = "name",
		name = "refinery",
		mode = "or"
	},
	{
		filter = "name",
		name = "small-crusher",
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
			--elseif entity.name == "chemistry-plant" then
			--	thermal_system.on_chemistry_plant_rotated(entity)
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
	if entity.name == "assembling-machine" then
		thermal_system.on_assembling_machine_built(entity)
	elseif entity.name == "furnace" then
		thermal_system.on_furnace_built(entity)
	elseif entity.name == "matter-reconstructor" then
		gameplay.on_vital_building_built(entity)
		thermal_system.on_matter_reconstructor_built(entity)
	elseif entity.name == "proton-decay-thermoelectric-generator" then
		gameplay.on_vital_building_built(entity)
	elseif entity.name == "supercomputer" then
		supercomputer.on_supercomputer_built(entity)
	elseif entity.name == "neural-node" then
		thermal_system.on_neural_node_built(entity)
	elseif entity.name == "micro-assembler" then
		thermal_system.on_micro_assembler_built(entity)
	elseif entity.name == "small-crusher" then
		thermal_system.on_small_crusher_built(entity)
	elseif entity.name == "chemistry-plant" then
		thermal_system.on_chemistry_plant_built(entity)
	elseif entity.name == "refinery" then
		thermal_system.on_refinery_built(entity)
	end
end

script.on_event(
	defines.events.on_object_destroyed,
	function(event)
		thermal_system.on_machine_destroyed(event)
		supercomputer.on_supercomputer_destroyed(event)
		thermal_system.gui_cleanup(event)
	end
)
script.on_event(
	defines.events.on_tick,
	function(event)
		story.on_story_tick(event)
		thermal_system.on_matter_reconstructor_tick()
		thermal_system.on_assembling_machine_tick()
		thermal_system.on_furnace_tick()
		thermal_system.on_neural_node_tick()
		thermal_system.on_micro_assembler_tick()
		thermal_system.on_small_crusher_tick()
		thermal_system.on_chemistry_plant_tick()
		thermal_system.on_refinery_tick()
		supercomputer.on_supercomputer_tick()
		thermal_system.on_gui_tick()
	end
)
script.on_nth_tick(100,
	function()
		gameplay.softlock_detection()
	end
)

-- Upon player joins

script.on_event(defines.events.on_player_created, function(e)
	local player = game.players[e.player_index]
	storage.players[player.index] = {}--initialise player storage

  player.teleport({ x = 0, y = 0 }, storage.platform.surface.name)
	--player.teleport({x=0,y=0}, "arrival")--for debug
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
		thermal_system.on_gui_open(event)
		if event.entity.type == "space-platform-hub" then 
			player_storage.hub = event.entity--we're gonna store the location, which is always 0,0
		end
  end
end)

script.on_event(defines.events.on_gui_closed, function(event)
	if event.gui_type == defines.gui_type.entity then
		thermal_system.on_gui_close(event)
	end
end)

script.on_event(defines.events.on_gui_click, function(event)
    if event.element.name == "deploy_scout_o_tron" then
			gameplay.deploy_scout_o_tron(event)
    end
end)

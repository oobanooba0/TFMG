require("scripts.init")
require("scripts.story")
require("scripts.thermal-system")
thermal_system = require("scripts.thermal-system")
require("scripts.gameplay")
gameplay = require("scripts.gameplay")

--i crie everytime i redo several hours of work.
--stolen from allison
filters = {
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

function handle_build_event(event)
	local entity = event.entity
	if entity.name == "assembling-machine" then
		thermal_system.on_assembling_machine_built(entity)
	elseif entity.name == "furnace" then
		thermal_system.on_furnace_built(entity)
	end
end

script.on_event(
	defines.events.on_object_destroyed,
	function(event)
		thermal_system.on_machine_destroyed(event)
	end
)
script.on_event(
	defines.events.on_tick,
	function()
		thermal_system.on_assembling_machine_tick()
		thermal_system.on_furnace_tick()
	end
)

-- Upon player joins

script.on_event(defines.events.on_player_created, function(e)--Ngl I have no idea what the e means, but the code doesn't work without it.\
	local player = game.players[e.player_index]
	storage.players[player.index] = {hub = {}}--initialise player storage

  player.teleport({ x = 0, y = 0 }, storage.platform.surface.name)
  player.enter_space_platform (platform)
  local group = game.permissions.get_group("players")
    if group then
    	group.add_player(player)
    end

		local anchor = {gui=defines.relative_gui_type.space_platform_hub_gui, position=defines.relative_gui_position.bottom}
  	local frame = player.gui.relative.add{type="frame", anchor=anchor}
		frame.add{type="button", name="deploy_scout_o_tron", caption={"spider_ui.deploy-scout-o-tron"}}
end)

---On open hub gui
script.on_event(defines.events.on_gui_opened, function(event)
  if event.gui_type == defines.gui_type.entity and event.entity.type == "space-platform-hub" then
		local player_storage = storage.players[event.player_index]
		player_storage.hub = event.entity--we're gonna store the location, which is always 0,0
    end
end)




script.on_event(defines.events.on_gui_click, function(event)
    if event.element.name == "deploy_scout_o_tron" then
			gameplay.deploy_scout_o_tron(event)
    end
end)

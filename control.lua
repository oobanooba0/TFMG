require("scripts.init")
require("scripts.thermal-system")
require("scripts.story")
thermal_system = require("scripts.thermal-system")

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
local flib_table = require("__flib__/table")

local thermal_system = {}
--machine destruction

function thermal_system.on_machine_destroyed(event)--fuck this. Works somehow.
	if event.type == defines.target_type.entity then
		if storage.assembling_machine_thermal[event.useful_id] ~= nil then
		local entry = storage.assembling_machine_thermal[event.useful_id]
		entry.interface.destroy()
		storage.assembling_machine_thermal[event.useful_id] = nil

		elseif storage.furnace_thermal[event.useful_id] ~= nil then
		local entry = storage.furnace_thermal[event.useful_id]
		entry.interface.destroy()
		storage.furnace_thermal[event.useful_id] = nil
		end
	end
end

--assembler thermal

function thermal_system.on_assembling_machine_built(entity)
	local _reg_number, unit_number, _type = script.register_on_object_destroyed(entity)
	local surface = entity.surface
	local position = entity.position
	local force = entity.force
	local interface = surface.create_entity({ name = "assembling-machine-heat-interface", position = position, force = force })
	interface.disabled_by_script = true
	if storage.assembling_machine_thermal == nil then
		storage.assembling_machine_thermal = {}
	end
	table.insert(storage.assembling_machine_thermal, unit_number, { machine = entity, interface = interface })
end

function thermal_system.on_assembling_machine_tick()
	storage.machine_from_k = flib_table.for_n_of(
		storage.assembling_machine_thermal, storage.machine_from_k, 100000000, --this causes massive lag with lots of entites. I'll need a better solution
		function(v)
        local iscrafting = v.machine.is_crafting()
            if iscrafting == true then
        local energy_usage = (800*(1 + v.machine.consumption_bonus)) --in Kw. the assembling machine consumes 1000kw, but outputs 80% of it back out as heat
        local temperature_increase = (energy_usage / 60000) --interface has 1Mj specific heat. so 1mw=1degree/s and divide by 60 for per tick
        local final_temperature = (v.interface.temperature + (temperature_increase))
                v.interface.temperature = final_temperature
            end
        local temperature = v.interface.temperature--this should disable the assembling machine if it gets too warm, performance consequences abound.
            if temperature >= 250 then
                v.machine.disabled_by_script = true
            else
                v.machine.disabled_by_script = false
            end
		end
	)
end
---furnace thermal 

function thermal_system.on_furnace_built(entity)
	local _reg_number, unit_number, _type = script.register_on_object_destroyed(entity)
	local surface = entity.surface
	local position = entity.position
	local force = entity.force
	local interface = surface.create_entity({ name = "furnace-heat-interface", position = position, force = force })
	interface.disabled_by_script = true
	if storage.furnace_thermal == nil then
		storage.furnace_thermal = {}
	end
	table.insert(storage.furnace_thermal, unit_number, { machine = entity, interface = interface })
end

function thermal_system.on_furnace_tick()
	storage.machine_from_k = flib_table.for_n_of(
		storage.furnace_thermal, storage.machine_from_k, 100000000, --this causes massive lag with lots of entites. I'll need a better solution
		function(v)
        local iscrafting = v.machine.is_crafting()
            if iscrafting == true then
        local energy_usage = (2000*(1 + v.machine.consumption_bonus)) --in Kw. the furnace consumes 2500kw, but outputs 80% of it back out as heat
        local temperature_increase = (energy_usage / 60000) --interface has 1Mj specific heat. so 1mw=1degree/s and divide by 60 for per tick
        local final_temperature = (v.interface.temperature + (temperature_increase))
                v.interface.temperature = final_temperature
            end
        local temperature = v.interface.temperature--this should disable the assembling machine if it gets too warm, performance consequences abound.
            if temperature >= 750 then
                v.machine.disabled_by_script = true
            else
                v.machine.disabled_by_script = false
            end
		end
	)
end

return thermal_system
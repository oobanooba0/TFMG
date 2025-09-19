local flib_table = require("__flib__/table")

local thermal_system = {}

--This function handles all the control aspects of the thermal system
function thermal_update(v,max_working_temperature,max_safe_temperature,specific_heat,heat_ratio,base_energy_consumption)
		if v.machine.valid == false then--checks for machine validity, preventing a game crash if the machine is destroyed instantly.
		return end
		local unit_converter = 60
		local base_heat_output = (base_energy_consumption * heat_ratio)/(specific_heat*unit_converter)
		local temperature = v.interface.temperature
		if v.machine.status == 1 then
			local final_temperature = (temperature + (base_heat_output*(1 + v.machine.consumption_bonus)))
			v.interface.temperature = final_temperature
		end
		if temperature >= max_safe_temperature then
			v.machine.disabled_by_script = true
			v.machine.custom_status = {
				diode = defines.entity_status_diode.red,
				label = "Taking thermal damage!"
			}
			v.machine.damage(0.1,"neutral")--must be last part of the script that runs, since after this point, the machine may no longer exist.
		elseif temperature >= max_working_temperature then
			v.machine.disabled_by_script = true
			v.machine.custom_status = {
				diode = defines.entity_status_diode.red,
				label = "Overheated!"
			}
		else
			v.machine.disabled_by_script = false
			v.machine.custom_status = nil
		end
end

--machine destruction
function thermal_system.on_machine_destroyed(event)--fuck this. Works somehow.
if event.type == defines.target_type.entity then
	if storage.assembling_machine_thermal[event.useful_id] ~= nil then --check if assembling machine
		local entry = storage.assembling_machine_thermal[event.useful_id]
		entry.interface.destroy()
		storage.assembling_machine_thermal[event.useful_id] = nil
	elseif storage.furnace_thermal[event.useful_id] ~= nil then --check if furnace
		local entry = storage.furnace_thermal[event.useful_id]
		entry.interface.destroy()
		storage.furnace_thermal[event.useful_id] = nil
	elseif storage.matter_reconstructor_thermal[event.useful_id] ~= nil then --check if matter reconstructor
		local entry = storage.matter_reconstructor_thermal[event.useful_id]
		entry.interface.destroy()
		storage.matter_reconstructor_thermal[event.useful_id] = nil
	elseif storage.neural_node_thermal[event.useful_id] ~= nil then --check if neural node
		local entry = storage.neural_node_thermal[event.useful_id]
		entry.interface.destroy()
		storage.neural_node_thermal[event.useful_id] = nil
		end
	end
end

--assembler thermal
function thermal_system.on_assembling_machine_built(entity)
	local _reg_number, unit_number, _type = script.register_on_object_destroyed(entity)
	local surface = entity.surface
	local position = entity.position
	local force = entity.force
	if surface.get_property("gravity") == 0 then
		local interface = surface.create_entity({ name = "assembling-machine-heat-interface", position = position, force = force })
		interface.disabled_by_script = true
		interface.temperature = 240 -- Can't do it in the prototype :(
		interface.destructible = false
		if storage.assembling_machine_thermal == nil then
			storage.assembling_machine_thermal = {}
		end
		table.insert(storage.assembling_machine_thermal, unit_number, { machine = entity, interface = interface })
	end
end
function thermal_system.on_assembling_machine_tick()

	storage.machine_from_k = flib_table.for_n_of(
		storage.assembling_machine_thermal, storage.machine_from_k, 100000000, --this causes massive lag with lots of entites. I'll need a better solution
		function(v)
		  local max_working_temperature = 250
			local max_safe_temperature = 350
			local specific_heat = 1
			local heat_ratio = 0.5
			local base_energy_consumption = 1
			thermal_update(v,max_working_temperature,max_safe_temperature,specific_heat,heat_ratio,base_energy_consumption)
		end)
end
---furnace thermal 
function thermal_system.on_furnace_built(entity)
	local _reg_number, unit_number, _type = script.register_on_object_destroyed(entity)
	local surface = entity.surface
	local position = entity.position
	local force = entity.force
	if surface.get_property("gravity") == 0 then
		local interface = surface.create_entity({ name = "furnace-heat-interface", position = position, force = force })
		interface.disabled_by_script = true
		interface.temperature = 350 -- Can't do it in the prototype :(
		interface.destructible = false
		if storage.furnace_thermal == nil then
			storage.furnace_thermal = {}
		end
		table.insert(storage.furnace_thermal, unit_number, { machine = entity, interface = interface })
	end
end
function thermal_system.on_furnace_tick()
	storage.machine_from_k = flib_table.for_n_of(
		storage.furnace_thermal, storage.machine_from_k, 100000000, --this causes massive lag with lots of entites. I'll need a better solution
		function(v)
			local max_working_temperature = 400
			local max_safe_temperature = 500
			local specific_heat = 1
			local heat_ratio = 0.8
			local base_energy_consumption = 2.5
			thermal_update(v,max_working_temperature,max_safe_temperature,specific_heat,heat_ratio,base_energy_consumption)
		end)
end
---matter reconstructor
function thermal_system.on_matter_reconstructor_built(entity)
	local _reg_number, unit_number, _type = script.register_on_object_destroyed(entity)
	local surface = entity.surface
	local position = entity.position
	local force = entity.force
	if surface.get_property("gravity") == 0 then
		local interface = surface.create_entity({ name = "matter-reconstructor-heat-interface", position = position, force = force })
		interface.disabled_by_script = true
		interface.temperature = 15
		interface.destructible = false
		if storage.furnace_thermal == nil then
			storage.furnace_thermal = {}
		end
		table.insert(storage.matter_reconstructor_thermal, unit_number, { machine = entity, interface = interface })
	end
end
function thermal_system.on_matter_reconstructor_tick()
	storage.machine_from_k = flib_table.for_n_of(
		storage.matter_reconstructor_thermal, storage.machine_from_k, 100000000, --this causes massive lag with lots of entites. I'll need a better solution
		function(v)
			local max_working_temperature = 900--matter reconstructor and reactor will be special cases which cannot die from heat
			local max_safe_temperature = 1337
			local specific_heat = 1
			local heat_ratio = 0.01
			local base_energy_consumption = 0.5
			thermal_update(v,max_working_temperature,max_safe_temperature,specific_heat,heat_ratio,base_energy_consumption)
		end)
end
---neural node thermal
function thermal_system.on_neural_node_built(entity)
	local _reg_number, unit_number, _type = script.register_on_object_destroyed(entity)
	local surface = entity.surface
	local position = entity.position
	local force = entity.force
	if surface.get_property("gravity") == 0 then
		local interface = surface.create_entity({ name = "neural-node-heat-interface", position = position, force = force })
		interface.disabled_by_script = true
		interface.temperature = 80 -- Can't do it in the prototype :(
		interface.destructible = false
		if storage.neural_node_thermal == nil then
			storage.neural_node_thermal = {}
		end
		table.insert(storage.neural_node_thermal, unit_number, { machine = entity, interface = interface })
	end
end
function thermal_system.on_neural_node_tick()
	storage.machine_from_k = flib_table.for_n_of(
		storage.neural_node_thermal, storage.machine_from_k, 100000000, --this causes massive lag with lots of entites. I'll need a better solution
		function(v)
			local max_working_temperature = 90
			local max_safe_temperature = 120
			local specific_heat = 5
			local heat_ratio = 1
			local base_energy_consumption = 5
			thermal_update(v,max_working_temperature,max_safe_temperature,specific_heat,heat_ratio,base_energy_consumption)
		end)
end



return thermal_system
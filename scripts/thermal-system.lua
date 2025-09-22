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
	if event.type == defines.target_type.entity then--this elseif stack feels like it belongs in a programming gore video.
		if storage.assembling_machine_thermal[event.useful_id] ~= nil then --assembling machine
			local entry = storage.assembling_machine_thermal[event.useful_id]
			entry.interface.destroy()
			storage.assembling_machine_thermal[event.useful_id] = nil
		elseif storage.furnace_thermal[event.useful_id] ~= nil then --furnace
			local entry = storage.furnace_thermal[event.useful_id]
			entry.interface.destroy()
			storage.furnace_thermal[event.useful_id] = nil
		elseif storage.matter_reconstructor_thermal[event.useful_id] ~= nil then --matter reconstructor
			local entry = storage.matter_reconstructor_thermal[event.useful_id]
			entry.interface.destroy()
			storage.matter_reconstructor_thermal[event.useful_id] = nil
		elseif storage.neural_node_thermal[event.useful_id] ~= nil then --neural node
			local entry = storage.neural_node_thermal[event.useful_id]
			entry.interface.destroy()
			storage.neural_node_thermal[event.useful_id] = nil
		elseif storage.micro_assembler_thermal[event.useful_id] ~= nil then --micro assembler
			local entry = storage.micro_assembler_thermal[event.useful_id]
			entry.interface.destroy()
			storage.micro_assembler_thermal[event.useful_id] = nil
		elseif storage.small_crusher_thermal[event.useful_id] ~= nil then --crusher
			local entry = storage.small_crusher_thermal[event.useful_id]
			entry.interface.destroy()
			storage.small_crusher_thermal[event.useful_id] = nil
		elseif storage.refinery_thermal[event.useful_id] ~= nil then --refinery
			local entry = storage.refinery_thermal[event.useful_id]
			entry.interface.destroy()
			storage.refinery_thermal[event.useful_id] = nil
		elseif storage.chemistry_plant_thermal[event.useful_id] ~= nil then --chemistry plant
			local entry = storage.chemistry_plant_thermal[event.useful_id]
			entry.interface.destroy()
			storage.chemistry_plant_thermal[event.useful_id] = nil
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
--micro assembler
function thermal_system.on_micro_assembler_built(entity)
	local _reg_number, unit_number, _type = script.register_on_object_destroyed(entity)
	local surface = entity.surface
	local position = entity.position
	local force = entity.force
	if surface.get_property("gravity") == 0 then
		if entity.direction == 0 or entity.direction == 8 then
		  interface = surface.create_entity({ name = "micro-assembler-heat-interface-v", position = position, force = force })
		else
			interface = surface.create_entity({ name = "micro-assembler-heat-interface-h", position = position, force = force })
		end
		interface.disabled_by_script = true
		interface.temperature = 240 -- Can't do it in the prototype :(
		interface.destructible = false
		if storage.micro_assembler_thermal == nil then
			storage.micro_assembler_thermal = {}
		end
		table.insert(storage.micro_assembler_thermal, unit_number, { machine = entity, interface = interface })
	end
end
function thermal_system.on_micro_assembler_tick()--same as the assembler, just higher energy input
	storage.machine_from_k = flib_table.for_n_of(
	storage.micro_assembler_thermal, storage.machine_from_k, 100000000, --this causes massive lag with lots of entites. I'll need a better solution
	function(v)
	  local max_working_temperature = 250
		local max_safe_temperature = 350
		local specific_heat = 1
		local heat_ratio = 0.5
		local base_energy_consumption = 1.5
		thermal_update(v,max_working_temperature,max_safe_temperature,specific_heat,heat_ratio,base_energy_consumption)
	end)
end
--small crusher thermal
function thermal_system.on_small_crusher_built(entity,temperature)
	local _reg_number, unit_number, _type = script.register_on_object_destroyed(entity)
	local surface = entity.surface
	local position = entity.position
	local force = entity.force
	if surface.get_property("gravity") == 0 then
		if entity.direction == 0 or entity.direction == 8 then
		  interface = surface.create_entity({ name = "small-crusher-heat-interface-v", position = position, force = force })
		else
			interface = surface.create_entity({ name = "small-crusher-heat-interface-h", position = position, force = force })
		end
		interface.disabled_by_script = true
		interface.temperature = temperature or 290
		interface.destructible = false
		if storage.small_crusher_thermal == nil then
			storage.small_crusher_thermal = {}
		end
		table.insert(storage.small_crusher_thermal, unit_number, { machine = entity, interface = interface })
	end
end
function thermal_system.on_small_crusher_tick()
	storage.machine_from_k = flib_table.for_n_of(
	storage.small_crusher_thermal, storage.machine_from_k, 100000000, --this causes massive lag with lots of entites. I'll need a better solution
	function(v)
	  local max_working_temperature = 300
		local max_safe_temperature = 400
		local specific_heat = 1
		local heat_ratio = 0.4
		local base_energy_consumption = 1.5
		thermal_update(v,max_working_temperature,max_safe_temperature,specific_heat,heat_ratio,base_energy_consumption)
	end)
end

--refinery
function thermal_system.on_refinery_built(entity)
	local _reg_number, unit_number, _type = script.register_on_object_destroyed(entity)
	local surface = entity.surface
	local position = entity.position
	local force = entity.force
	if surface.get_property("gravity") == 0 then
		local interface = surface.create_entity({ name = "refinery-heat-interface", position = position, force = force })
		interface.disabled_by_script = true
		interface.temperature = 390 -- Can't do it in the prototype :(
		interface.destructible = false
		if storage.refinery_thermal == nil then
			storage.refinery_thermal = {}
		end
		table.insert(storage.refinery_thermal, unit_number, { machine = entity, interface = interface })
	end
end
function thermal_system.on_refinery_tick()
	storage.machine_from_k = flib_table.for_n_of(
	storage.refinery_thermal, storage.machine_from_k, 100000000, --this causes massive lag with lots of entites. I'll need a better solution
	function(v)
	  local max_working_temperature = 400
		local max_safe_temperature = 450
		local specific_heat = 1
		local heat_ratio = 0.7
		local base_energy_consumption = 4
		thermal_update(v,max_working_temperature,max_safe_temperature,specific_heat,heat_ratio,base_energy_consumption)
	end)
end

--chemistry plant
function thermal_system.on_chemistry_plant_built(entity,temperature)
	local _reg_number, unit_number, _type = script.register_on_object_destroyed(entity)
	local surface = entity.surface
	local position = entity.position
	local force = entity.force
	if surface.get_property("gravity") == 0 then
		interface = surface.create_entity({ name = "chemistry-plant-heat-interface", position = position, force = force })
		interface.disabled_by_script = true
		interface.temperature = temperature or 310 -- Can't do it in the prototype :(
		interface.destructible = false
		if storage.chemistry_plant_thermal == nil then
			storage.chemistry_plant_thermal = {}
		end
		table.insert(storage.chemistry_plant_thermal, unit_number, { machine = entity, interface = interface })
	end
end

--function thermal_system.on_chemistry_plant_rotated(entity) -- awaiting bugfix for rotatable entities
--	local v = storage.chemistry_plant_thermal[entity.unit_number]
--	local temperature = v.interface.temperature
--	v.interface.destroy()
--	storage.chemistry_plant_thermal[entity.unit_number] = nil
--	thermal_system.on_chemistry_plant_built(v.machine,temperature)
--end

function thermal_system.on_chemistry_plant_tick()
	storage.machine_from_k = flib_table.for_n_of(
	storage.chemistry_plant_thermal, storage.machine_from_k, 100000000, --this causes massive lag with lots of entites. I'll need a better solution
	function(v)
	  local max_working_temperature = 320
		local max_safe_temperature = 355
		local specific_heat = 1
		local heat_ratio = 0.45
		local base_energy_consumption = 2
		thermal_update(v,max_working_temperature,max_safe_temperature,specific_heat,heat_ratio,base_energy_consumption)
	end)
end

return thermal_system
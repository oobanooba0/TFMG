local flib_table = require("__flib__/table")

local thermal_system = {}

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
	local max_working_temperature = 250
	local max_safe_temperature = 350
	storage.machine_from_k = flib_table.for_n_of(
		storage.assembling_machine_thermal, storage.machine_from_k, 100000000, --this causes massive lag with lots of entites. I'll need a better solution
		function(v)
			if v.machine.valid == false then--checks for machine validity, preventing a game crash if the machine is destroyed instantly.
			return end
			local temperature = v.interface.temperature
			if v.machine.status == 1 then
				local energy_usage = (500*(1 + v.machine.consumption_bonus)) --in Kw. the assembling machine consumes 1000kw, but outputs 50% of it back out as heat
				local temperature_increase = (energy_usage / 60000) --interface has 1Mj specific heat. so 1mw=1degree/s and divide by 60 for per tick
				local final_temperature = (temperature + (temperature_increase))
					v.interface.temperature = final_temperature
			end
			if temperature >= max_working_temperature then
				v.machine.disabled_by_script = true
				v.machine.custom_status = {
					diode = defines.entity_status_diode.red,
					label = "Overheated!"
					}
				if temperature >= max_safe_temperature then
					v.machine.custom_status = {
						diode = defines.entity_status_diode.red,
						label = "Taking thermal damage!"
						}
					v.machine.damage(0.1,"neutral")--must be last part of the script that runs.
				end
			else
				v.machine.disabled_by_script = false
				v.machine.custom_status = nil
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
	local max_working_temperature = 400
	local max_safe_temperature = 500
	storage.machine_from_k = flib_table.for_n_of(
		storage.furnace_thermal, storage.machine_from_k, 100000000, --this causes massive lag with lots of entites. I'll need a better solution
		function(v)
		  if v.machine.valid == false then--checks for machine validity, preventing a game crash if the machine is destroyed instantly.
			return end
			local temperature = v.interface.temperature
			if v.machine.status == 1 then --This just checks weather the machine is currently working
				local energy_usage = (2000*(1 + v.machine.consumption_bonus)) --in Kw. the furnace consumes 2500kw, but outputs 80% of it back out as heat
				local temperature_increase = (energy_usage / 60000) --interface has 1Mj specific heat. so 1mw=1degree/s and divide by 60 for per tick
				local final_temperature = (temperature + (temperature_increase))
					v.interface.temperature = final_temperature
			end
			if temperature >= max_working_temperature then
				v.machine.disabled_by_script = true
				v.machine.custom_status = {
					diode = defines.entity_status_diode.red,
					label = "Overheated!"
					}
				if temperature >= max_safe_temperature then
					v.machine.custom_status = {
						diode = defines.entity_status_diode.red,
						label = "Taking thermal damage!"
						}
					v.machine.damage(0.1,"neutral")--must be last thing that happens, past this point assembling machine might no longer exist and cannot be interacted with
				end
			else
				v.machine.disabled_by_script = false
				v.machine.custom_status = nil
			end
		end
	)
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
	local max_working_temperature = 5000--matter reconstructor and reactor will be special cases which cannot die from heat
	storage.machine_from_k = flib_table.for_n_of(
		storage.matter_reconstructor_thermal, storage.machine_from_k, 100000000, --this causes massive lag with lots of entites. I'll need a better solution
		function(v)
		  if v.machine.valid == false then
			return end
			local temperature = v.interface.temperature
			if v.machine.status == 1 then
				local energy_usage = (5*(1 + v.machine.consumption_bonus)) --in Kw. the matter_reconstructor consumes 500kw, but outputs 1% of it back out as heat, its magic, okay?
				local temperature_increase = (energy_usage / 60000) --interface has 1Mj specific heat. so 1mw=1degree/s and divide by 60 for per tick
				local final_temperature = (temperature + (temperature_increase))
					v.interface.temperature = final_temperature
			end
			if temperature >= max_working_temperature then
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
	)
end

return thermal_system
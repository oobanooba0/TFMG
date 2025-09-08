local flib_table = require("__flib__/table")

local supercomputer = {}

function supercomputer.on_supercomputer_built(entity)
  local _reg_number, unit_number, _type = script.register_on_object_destroyed(entity)
  if storage.supercomputer == nil then
	  storage.supercomputer = {}
	end
  table.insert(storage.supercomputer, unit_number, {machine = entity})
end


function supercomputer.on_supercomputer_destroyed(event)
  if event.type == defines.target_type.entity then
    if storage.supercomputer[event.useful_id] ~= nil then
  		storage.supercomputer[event.useful_id] = nil
	  end
	end
end

function supercomputer.on_supercomputer_tick()
 storage.machine_from_k = flib_table.for_n_of(
		storage.supercomputer, storage.machine_from_k, 100000000,
		function(v)
      if v.machine.valid == false then--checks for machine validity, preventing a game crash if the machine is destroyed instantly.
		  return end
      local signal_x = v.machine.get_signal({type = "virtual", name = "signal-X"},defines.wire_connector_id.circuit_green)
      if signal_x == 1 then
        game.print("you're so smart")
        
      end 
    end
  )
end

function supercomputer.create_new_problem()

end

return supercomputer
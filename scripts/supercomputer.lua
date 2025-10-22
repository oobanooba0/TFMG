local flib_table = require("__flib__/table")

local supercomputer = {}

function supercomputer.on_supercomputer_destroyed(event)
  if event.type == defines.target_type.entity then
    if storage.supercomputer[event.useful_id] ~= nil then
      local entry = storage.supercomputer[event.useful_id]
      entry.input.destroy()
      entry.output.destroy()--byebye!
      if entry.interface ~= nil then
        entry.interface.destroy()
      end
  		storage.supercomputer[event.useful_id] = nil
	  end
	end
end

function supercomputer.on_supercomputer_built(entity)
  local _reg_number, unit_number, _type = script.register_on_object_destroyed(entity)
  local surface = entity.surface
  local force = entity.force
	local position_x = entity.position.x
  local position_y = entity.position.y
  local direction = entity.direction--no idea if i can get things supporting orientations, but i need to. worst case this requires an additional proxy entity.
  local interface_direction = direction + 8
  if interface_direction >= 16 then interface_direction = interface_direction - 8 end
  if entity.mirroring == false then
    if direction == 0 then
      inputxy  = {position_x+1,position_y+2}
      outputxy = {position_x-1,position_y+2}
    elseif direction == 4 then
      inputxy  = {position_x-2,position_y+1}
      outputxy = {position_x-2,position_y-1}
    elseif direction == 8 then
      inputxy  = {position_x-1,position_y-2}
      outputxy = {position_x+1,position_y-2}
    elseif direction == 12 then
      inputxy  = {position_x+2,position_y-1}
      outputxy = {position_x+2,position_y+1}
    end
  else
    if direction == 0 then
      inputxy  = {position_x-1,position_y+2}
      outputxy = {position_x+1,position_y+2}
    elseif direction == 4 then
      inputxy  = {position_x-2,position_y-1}
      outputxy = {position_x-2,position_y+1}
    elseif direction == 8 then
      inputxy  = {position_x+1,position_y-2}
      outputxy = {position_x-1,position_y-2}
    elseif direction == 12 then
      inputxy  = {position_x+2,position_y+1}
      outputxy = {position_x+2,position_y-1}
    end
  end
  local supercomputer_input = surface.create_entity({ name = "supercomputer-input", position = inputxy, force = force, direction = interface_direction, fast_replace = true })
  local supercomputer_output = surface.create_entity({ name = "supercomputer-output", position = outputxy, force = force, direction = interface_direction, fast_replace = true})
  supercomputer_input.destructible = false
  supercomputer_output.destructible = false
  entity.disabled_by_script = true
  if storage.supercomputer == nil then
	  storage.supercomputer = {}
	end
  table.insert(storage.supercomputer, unit_number, {machine = entity, input = supercomputer_input, output = supercomputer_output, recipe = nil, solution_x = nil})--bigass table lol
end
function supercomputer.on_supercomputer_rotated(entity)
    local v = storage.supercomputer[entity.unit_number]
    v.input.rotate{}
    v.output.rotate{}
    supercomputer.relocate(v)
end
function supercomputer.on_supercomputer_flipped(entity)
    local v = storage.supercomputer[entity.unit_number]
    supercomputer.relocate(v)
end
function supercomputer.relocate(v)--this saves us from doing this twice.
    local position_x = v.machine.position.x
    local position_y = v.machine.position.y
    local direction = v.machine.direction
    if v.machine.mirroring == false then
      if direction == 0 then
        v.input.teleport{position_x+1,position_y+2}
        v.output.teleport{position_x-1,position_y+2}
      elseif direction == 4 then
        v.input.teleport{position_x-2,position_y+1}
        v.output.teleport{position_x-2,position_y-1}
      elseif direction == 8 then
        v.input.teleport{position_x-1,position_y-2}
        v.output.teleport{position_x+1,position_y-2}
      elseif direction == 12 then
        v.input.teleport{position_x+2,position_y-1}
        v.output.teleport{position_x+2,position_y+1}
      end
    else
      if direction == 0 then
        v.input.teleport{position_x-1,position_y+2}
        v.output.teleport{position_x+1,position_y+2}
      elseif direction == 4 then
        v.input.teleport{position_x-2,position_y-1}
        v.output.teleport{position_x-2,position_y+1}
      elseif direction == 8 then
        v.input.teleport{position_x+1,position_y-2}
        v.output.teleport{position_x-1,position_y-2}
      elseif direction == 12 then
        v.input.teleport{position_x+2,position_y+1}
        v.output.teleport{position_x+2,position_y-1}
      end
    end
end

function supercomputer.on_supercomputer_tick()
 storage.machine_from_k = flib_table.for_n_of(
		storage.supercomputer, storage.machine_from_k, 100000000,
		function(v)
      if not v.machine.valid then return end --checks for machine validity, preventing a game crash if the machine is destroyed instantly.
      if v.machine.disabled_by_script then return end --If the machine has been disabled at the start of the tick, we dont have to run anything else.
      
      local recipe = v.machine.get_recipe()
      if not recipe then--If no recipe then only the reset script needs to run and we can skip all else.
        if v.recipe == recipe then return end
          v.output.get_control_behavior().remove_section(1)
          v.recipe = nil
      return end

      if v.machine.status ~= 1 then --if the machine isn't able to run for any reason, end the script.
      return end

      if recipe ~= v.recipe then--check if the recipe has changed, so we know to generate a new problem

        if recipe.name == "introspection-science" then
          supercomputer.create_new_problem_introspection(v)
        end
        if recipe.name == "exploration-science" then
          supercomputer.create_new_problem_exploration(v)
        end
        v.recipe = recipe
      end

      if recipe.name == "introspection-science" then--we need to check different signals for each science. so this needs a seperate script for each, to keep each as lightweight as possible.
        supercomputer.introspection_solution(v)
      elseif recipe.name == "exploration-science" then
        supercomputer.exploration_solution(v)
      end
    end
  )
end
---introspection recipes
function supercomputer.introspection_solution(v)
  local input_green_signal_x = v.input.get_signal({type = "virtual", name = "signal-X"},defines.wire_connector_id.circuit_green)
  local input_red_signal_x = v.input.get_signal({type = "virtual", name = "signal-X"},defines.wire_connector_id.circuit_red)

  if input_green_signal_x == v.solution_x or input_red_signal_x == v.solution_x then--first check if we've solved the current problem
    v.machine.disabled_by_script = false
    supercomputer.create_new_problem_introspection(v)
  else
    v.machine.disabled_by_script = true
    v.machine.custom_status = {
		  diode = defines.entity_status_diode.yellow,
		  label = "Ready for signal X"
		  }
  end 
end

function supercomputer.create_new_problem_introspection(v)--introspection recipe mechanics
  if v.output.get_control_behavior().get_section(1) == nil then
    v.output.get_control_behavior().add_section(nil)
  end
  local output_control = v.output.get_control_behavior().get_section(1)

  local problem_a = math.random(100)
  local problem_b = math.random(100)
  local operator_select = math.random(4)
  
  if operator_select == 1 then
  v.solution_x = problem_a + problem_b
  problem_operator = "signal-plus"
  elseif operator_select == 2 then
  v.solution_x = problem_a - problem_b
  problem_operator = "signal-minus"
  elseif operator_select == 3 then
  v.solution_x = problem_a * problem_b
  problem_operator = "signal-multiplication"
  elseif operator_select == 4 then
  v.solution_x = math.floor(problem_a / problem_b)
  problem_operator = "signal-division"
  end


  output_control.filters = {
    {value = {type = "virtual", name = "signal-A", quality = "normal"}, min = problem_a},
    {value = {type = "virtual", name = "signal-B", quality = "normal"}, min = problem_b},
    {value = {type = "virtual", name = problem_operator, quality = "normal"}, min = 1},
    }
  output_control.group = ""
end

---exploration recipes

function supercomputer.exploration_solution(v)
  local green_distance = v.input.get_signal({type = "virtual", name = "signal-distance"},defines.wire_connector_id.circuit_green)
  local red_distance = v.input.get_signal({type = "virtual", name = "signal-distance"},defines.wire_connector_id.circuit_red)
  local green_difference = math.abs(green_distance - v.solution_x)
  local red_difference = math.abs(red_distance - v.solution_x)
  local tolerance = 1

  if green_difference <= tolerance or red_difference <= tolerance then--first check if we've solved the current problem
    --game.print("red:"..red_difference.."green:"..green_difference)
    v.machine.disabled_by_script = false
    supercomputer.create_new_problem_exploration(v)
  else
    v.machine.disabled_by_script = true
    v.machine.custom_status = {
		  diode = defines.entity_status_diode.yellow,
		  label = "Ready for distance solution"
		  }
  end 
end

function supercomputer.create_new_problem_exploration(v)--introspection recipe mechanics
  if v.output.get_control_behavior().get_section(1) == nil then
    v.output.get_control_behavior().add_section(nil)
  end
  local output_control = v.output.get_control_behavior().get_section(1)
  local range = 10000
  local x_0 = math.random(-range,range)
  local y_0 = math.random(-range,range)
  local x_1 = math.random(-range,range)
  local y_1 = math.random(-range,range)

  v.solution_x = ((x_0-x_1)^2 + (y_0-y_1)^2)^0.5
  --game.print(v.solution_x)


  output_control.filters = {
    {value = {type = "virtual", name = "signal-x-0", quality = "normal"}, min = x_0},
    {value = {type = "virtual", name = "signal-y-0", quality = "normal"}, min = y_0},
    {value = {type = "virtual", name = "signal-x-1", quality = "normal"}, min = x_1},
    {value = {type = "virtual", name = "signal-y-1", quality = "normal"}, min = y_1},
    }
  output_control.group = ""
  --game.print(v.problem_a..v.problem_operator..v.problem_b.."="..v.solution_x)
end

return supercomputer
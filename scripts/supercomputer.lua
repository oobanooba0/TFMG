local flib_table = require("__flib__/table")

local supercomputer = {}

function supercomputer.on_supercomputer_destroyed(event)
  if event.type == defines.target_type.entity then
    if storage.supercomputer[event.useful_id] ~= nil then
      local entry = storage.supercomputer[event.useful_id]
      entry.input.destroy()
      entry.output.destroy()--byebye!
  		storage.supercomputer[event.useful_id] = nil
	  end
	end
end

function supercomputer.on_supercomputer_built(entity)
  local _reg_number, unit_number, _type = script.register_on_object_destroyed(entity)
  local surface = entity.surface
	local position_x = entity.position.x
  local position_y = entity.position.y
  local direction = entity.direction--no idea if i can get things supporting orientations, but i need to. worst case this requires an additional proxy entity.
  if entity.mirroring == false then
    if direction == 0 then
      inputxy = {position_x-1,position_y-2}
      outputxy = {position_x+1,position_y-2}
    elseif direction == 4 then
      inputxy = {position_x+2,position_y-1}
      outputxy = {position_x+2,position_y+1}
    elseif direction == 8 then
      inputxy = {position_x+1,position_y+2}
      outputxy = {position_x-1,position_y+2}
    elseif direction == 12 then
      inputxy = {position_x-2,position_y+1}
      outputxy = {position_x-2,position_y-1}
    end
  else
    if direction == 0 then
      outputxy = {position_x-1,position_y-2}
      inputxy = {position_x+1,position_y-2}
    elseif direction == 4 then
      outputxy = {position_x+2,position_y-1}
      inputxy = {position_x+2,position_y+1}
    elseif direction == 8 then
      outputxy = {position_x+1,position_y+2}
      inputxy = {position_x-1,position_y+2}
    elseif direction == 12 then
      outputxy = {position_x-2,position_y+1}
      inputxy = {position_x-2,position_y-1}
    end
  end
	local force = entity.force
  local supercomputer_input = surface.create_entity({ name = "supercomputer-input", position = inputxy, force = force, direction = direction, fast_replace = true })
  local supercomputer_output = surface.create_entity({ name = "supercomputer-output", position = outputxy, force = force, direction = direction, fast_replace = true})
  supercomputer_input.destructible = false
  supercomputer_output.destructible = false
  entity.disabled_by_script = true
  if storage.supercomputer == nil then
	  storage.supercomputer = {}
	end
  table.insert(storage.supercomputer, unit_number, {machine = entity, input = supercomputer_input, output = supercomputer_output, recipe = nil, problem_a = nil, problem_b = nil, problem_operator = nil, solution_x = nil})
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
        v.input.teleport{position_x-1,position_y-2}
        v.output.teleport{position_x+1,position_y-2}
      elseif direction == 4 then
        v.input.teleport{position_x+2,position_y-1}
        v.output.teleport{position_x+2,position_y+1}
      elseif direction == 8 then
        v.input.teleport{position_x+1,position_y+2}
        v.output.teleport{position_x-1,position_y+2}
      elseif direction == 12 then
        v.input.teleport{position_x-2,position_y+1}
        v.output.teleport{position_x-2,position_y-1}
      end
    else
      if direction == 0 then
        v.output.teleport{position_x-1,position_y-2}
        v.input.teleport{position_x+1,position_y-2}
      elseif direction == 4 then
        v.output.teleport{position_x+2,position_y-1}
        v.input.teleport{position_x+2,position_y+1}
      elseif direction == 8 then
        v.output.teleport{position_x+1,position_y+2}
        v.input.teleport{position_x-1,position_y+2}
      elseif direction == 12 then
        v.output.teleport{position_x-2,position_y+1}
        v.input.teleport{position_x-2,position_y-1}
      end
    end
end

function supercomputer.on_supercomputer_tick()
 storage.machine_from_k = flib_table.for_n_of(
		storage.supercomputer, storage.machine_from_k, 100000000,
		function(v)
      if v.machine.valid == false then--checks for machine validity, preventing a game crash if the machine is destroyed instantly.
		  return end
      local recipe = v.machine.get_recipe()
      if recipe == nil then --atm no point in running any script unless theres a recipe
      return end
      local input_green_signal_x = v.input.get_signal({type = "virtual", name = "signal-X"},defines.wire_connector_id.circuit_green)
      local input_red_signal_x = v.input.get_signal({type = "virtual", name = "signal-X"},defines.wire_connector_id.circuit_red)
      if recipe ~= v.recipe then--check if the recipe has changed, so we know to generate a new problem
        if recipe.name == "introspection-science" then
          supercomputer.create_new_problem_introspection(v)
        end
        v.recipe = recipe
      end

      if recipe.name == "introspection-science" then
        if input_green_signal_x == v.solution_x or input_red_signal_x == v.solution_x then--first check if we've solved the current problem
          v.machine.disabled_by_script = false
          supercomputer.create_new_problem_introspection(v)
        else
          v.machine.disabled_by_script = true
        end 
      end
    end
  )
end

function supercomputer.create_new_problem_introspection(v)
  if v.output.get_control_behavior().get_section(1) == nil then
    v.output.get_control_behavior().add_section(nil)
  end
  local output_control = v.output.get_control_behavior().get_section(1)

  v.problem_a = math.random(100)
  v.problem_b = math.random(100)
  operator_select = math.random(4)
  
  if operator_select == 1 then
  v.solution_x = v.problem_a + v.problem_b
  v.problem_operator = "signal-plus"
  elseif operator_select == 2 then
  v.solution_x = v.problem_a - v.problem_b
  v.problem_operator = "signal-minus"
  elseif operator_select == 3 then
  v.solution_x = v.problem_a * v.problem_b
  v.problem_operator = "signal-multiplication"
  elseif operator_select == 4 then
  v.solution_x = math.floor(v.problem_a / v.problem_b)
  v.problem_operator = "signal-division"
  end


  output_control.filters = {
    {value = {type = "virtual", name = "signal-A", quality = "normal"}, min = v.problem_a},
    {value = {type = "virtual", name = "signal-B", quality = "normal"}, min = v.problem_b},
    {value = {type = "virtual", name = v.problem_operator, quality = "normal"}, min = 1},
  }
  output_control.group = ""
  --game.print(v.problem_a..v.problem_operator..v.problem_b.."="..v.solution_x)
end

return supercomputer
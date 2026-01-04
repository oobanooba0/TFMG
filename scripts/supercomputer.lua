local flib_table = require("__flib__/table")

local supercomputer = {}

--ideally i want to migrate this information into mod data, so i can define it in the recipe prototype or something.
local par_times = { --these are the number of ticks on average that a "good" solution takes. and is the required time to achive a 100% bonus
  ["introspection-science"] = 2,
  ["exploration-science"] = 12,
  ["exploitation-science"] = 90,
}

--remember to update par times in locale

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
      inputxy  = {position_x+3,position_y+5}
      outputxy = {position_x-3,position_y+5}
    elseif direction == 4 then
      inputxy  = {position_x-5,position_y+3}
      outputxy = {position_x-5,position_y-3}
    elseif direction == 8 then
      inputxy  = {position_x-3,position_y-5}
      outputxy = {position_x+3,position_y-5}
    elseif direction == 12 then
      inputxy  = {position_x+5,position_y-3}
      outputxy = {position_x+5,position_y+3}
    end
  else
    if direction == 0 then
      inputxy  = {position_x-3,position_y+5}
      outputxy = {position_x+3,position_y+5}
    elseif direction == 4 then
      inputxy  = {position_x-5,position_y-3}
      outputxy = {position_x-5,position_y+3}
    elseif direction == 8 then
      inputxy  = {position_x+3,position_y-5}
      outputxy = {position_x-3,position_y-5}
    elseif direction == 12 then
      inputxy  = {position_x+5,position_y+3}
      outputxy = {position_x+5,position_y-3}
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
  table.insert(storage.supercomputer, unit_number, {machine = entity, input = supercomputer_input, output = supercomputer_output})--bigass table lol
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
        v.input.teleport{position_x+3,position_y+5}
        v.output.teleport{position_x-3,position_y+5}
      elseif direction == 4 then
        v.input.teleport{position_x-5,position_y+3}
        v.output.teleport{position_x-5,position_y-3}
      elseif direction == 8 then
        v.input.teleport{position_x-3,position_y-5}
        v.output.teleport{position_x+3,position_y-5}
      elseif direction == 12 then
        v.input.teleport{position_x+5,position_y-3}
        v.output.teleport{position_x+5,position_y+3}
      end
    else
      if direction == 0 then
        v.input.teleport{position_x-3,position_y+5}
        v.output.teleport{position_x+3,position_y+5}
      elseif direction == 4 then
        v.input.teleport{position_x-5,position_y-3}
        v.output.teleport{position_x-5,position_y+3}
      elseif direction == 8 then
        v.input.teleport{position_x+3,position_y-5}
        v.output.teleport{position_x-3,position_y-5}
      elseif direction == 12 then
        v.input.teleport{position_x+5,position_y+3}
        v.output.teleport{position_x+5,position_y-3}
      end
    end
end

local function supercomputer_passive_draw(v) --controls passive power draw of supercomputers
  v.machine.disabled_by_script = true
  v.machine.energy = v.machine.energy*(1/10)
end

function supercomputer.production_bonus(v) --calculates the production bonus, and also resets the machines state for the next recipe.
  local par_time = par_times[v.recipe.name]
  if not par_time then return end
  local ticks_taken = game.tick - (v.start_tick or 0)
  local recipe = v.recipe
  --calculate the bonus to give
  local bonus_ratio = math.min((par_time/ticks_taken -0.01),5) --this represents the bonus given, relative to craft progress. A flat value is subtracted for the recipe productivity added to make the bar show up. ratio is capped at 5 to prevent any possibility of utter game breakage.
  local bonus_given

  if v.machine.status == 1 then
    bonus_given = (bonus_ratio/recipe.energy)*(v.machine.speed_bonus + 1)
  elseif v.machine.status == 14 then
    local energy_multiplier = (1 + v.machine.consumption_bonus)
    local base_buffer_size = (v.machine.prototype.get_max_energy_usage())*(64/60)
    local power_level = v.machine.energy/(base_buffer_size*energy_multiplier)
    bonus_given = (bonus_ratio/recipe.energy)*(v.machine.speed_bonus + 1)*power_level
  end

  v.machine.bonus_progress = math.max((v.machine.bonus_progress + bonus_given),0) --because of the flat reduction, the resulting bonus can be negative, which is not allowed.
  v.recipe = nil --we set this to nil to indicate that we're done and will need a new problem next tick.
end

function supercomputer.make_the_prod_bar_show()
  for _,force in pairs(game.forces) do
    if not force then return end
    for recipe_name,_ in pairs(par_times) do --weird way to do it, but surprisingly functional, as the table contains all the names of the recipes for which this needs to be done
      local recipe = force.recipes[recipe_name]
      recipe.productivity_bonus = 0.01
    end
  end
end

function supercomputer.on_supercomputer_tick()
  for _,v in pairs(storage.supercomputer) do
    supercomputer.supercomputer_tick(v)
  end
end

function supercomputer.supercomputer_tick(v)
  if not v.machine.valid then return end --checks for machine validity, preventing a game crash if the machine is destroyed instantly.
  if v.machine.disabled_by_script then return end --If the machine has been disabled at the start of the tick, we dont have to run anything else.
  
  local recipe = v.machine.get_recipe()
  if not recipe then--If no recipe then only the reset script needs to run and we can skip all else.
    if not v.recipe then return end
    v.output.get_control_behavior().remove_section(1)
    v.recipe = nil
  return end

  if v.machine.status ~= 1 and v.machine.status ~= 14 then v.machine.disabled_by_script = true return end--if the machine isn't able to run for any reason, end the script.
  --check if the recipe has changed, so we know to generate a new problem
  if recipe ~= v.recipe then
    if recipe.name == "introspection-science" then
      supercomputer.create_new_problem_introspection(v)
    elseif recipe.name == "exploration-science" then
      supercomputer.create_new_problem_exploration(v)
    elseif recipe.name == "exploitation-science" then
      supercomputer.create_new_problem_exploitation(v)
    end
    v.machine.disabled_by_script = true --disable the machine for the tick.
    v.recipe = recipe
  return end
  
  if recipe.name == "introspection-science" then--we need to check different signals for each science. so this needs a seperate script for each, to keep each as lightweight as possible.
    supercomputer.introspection_solution(v)
  elseif recipe.name == "exploration-science" then
    supercomputer.exploration_solution(v)
  elseif recipe.name == "exploitation-science" then
    supercomputer.exploitation_solution(v)
  end
end
---introspection recipes
function supercomputer.introspection_solution(v)
  local input_green_signal_x = v.input.get_signal({type = "virtual", name = "signal-X"},defines.wire_connector_id.circuit_green)
  local input_red_signal_x = v.input.get_signal({type = "virtual", name = "signal-X"},defines.wire_connector_id.circuit_red)

  if input_green_signal_x == v.solution_x or input_red_signal_x == v.solution_x then--first check if we've solved the current problem
    supercomputer.production_bonus(v)
  else
    supercomputer_passive_draw(v)
    v.machine.custom_status = {
		  diode = defines.entity_status_diode.yellow,
		  label = "Ready for signal X"
		  }
  end
end

function supercomputer.create_new_problem_introspection(v)--introspection recipe mechanics
  v.start_tick = game.tick
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
    supercomputer.production_bonus(v)
  else
    supercomputer_passive_draw(v)
    v.machine.custom_status = {
		  diode = defines.entity_status_diode.yellow,
		  label = "Ready for distance solution"
		  }
  end 
end

function supercomputer.create_new_problem_exploration(v)--introspection recipe mechanics
  v.start_tick = game.tick
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

--exploitation science

local exploitation_source = {"0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F"}

local function swap(v,a,b)
  local table = v.scramble_list
  local size = #table
  if a > 0 and b > 0 and a <= size and b <= size then
    table[a], table[b] = table[b] , table[a]
  end
end

local function check_exploitation_solution(v)
  for index, letter in pairs(v.scramble_list) do
    if letter ~= exploitation_source[index] then return false end
  end
return true end

function supercomputer.exploitation_solution(v)
  --control the combinators
  local green_swap_a = v.input.get_signal({type = "virtual", name = "signal-A"},defines.wire_connector_id.circuit_green)
  local green_swap_b = v.input.get_signal({type = "virtual", name = "signal-B"},defines.wire_connector_id.circuit_green)
  local red_swap_a = v.input.get_signal({type = "virtual", name = "signal-A"},defines.wire_connector_id.circuit_red)
  local red_swap_b = v.input.get_signal({type = "virtual", name = "signal-B"},defines.wire_connector_id.circuit_red)
  swap(v,green_swap_a,green_swap_b)
  swap(v,red_swap_a,red_swap_b)
  supercomputer.update_problem_exploitation(v)
  --solution handling
  if check_exploitation_solution(v) then --if we solved it
    supercomputer.production_bonus(v)
  else
    supercomputer_passive_draw(v)
    v.machine.custom_status = {
		  diode = defines.entity_status_diode.yellow,
		  label = "Ready for sorting"
		}
  end
end

function supercomputer.update_problem_exploitation(v) --update the output signals
  if v.output.get_control_behavior().get_section(1) == nil then
    v.output.get_control_behavior().add_section(nil)
  end
  local output_control = v.output.get_control_behavior().get_section(1)
  local output_list = {}
  for index,letter in pairs(v.scramble_list) do --build my list of signals from my scramble
    local signal = {value = {type = "virtual", name = "signal-"..letter, quality = "normal"}, min = index}
    table.insert(output_list,signal)
  end
  output_control.filters = output_list
  output_control.group = ""

end

function supercomputer.create_new_problem_exploitation(v)
  v.start_tick = game.tick
  v.scramble_list = TFMG.newscramble(exploitation_source) --get scrombombled!
  supercomputer.update_problem_exploitation(v)
end

return supercomputer
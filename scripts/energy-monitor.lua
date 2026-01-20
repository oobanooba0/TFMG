local flib_table = require("__flib__/table")

local energy_monitor = {}

--thanks the study of an old power meter mod (factorio power plus), i might have finally found a solution to this power conundrum
local energy_monitor_components = {--this is to save my ass time copy pasting similar but not quite identical code
  ["1"] = "energy-monitor-generator-primary",
  ["2"] = "energy-monitor-generator-secondary",
  ["3"] = "energy-monitor-generator-tertiary",
  ["A"] = "energy-monitor-consumer-primary",
  ["B"] = "energy-monitor-consumer-secondary",
  ["C"] = "energy-monitor-consumer-tertiary",
}


function energy_monitor.on_energy_monitor_built(entity)
  local _reg_number, unit_number, _type = script.register_on_object_destroyed(entity)
  local surface = entity.surface
  local position = entity.position
  local force = entity.force

  local children = {}

  for k,v in pairs(energy_monitor_components) do
    local child = surface.create_entity({ name = v, position = position, force = force, })
    child.destructible = false
    children[k] = child
  end

  table.insert(storage.energy_monitor, unit_number, {
    combinator = entity,
    children = children
  })

  TFMG.block(storage.energy_monitor[unit_number])
end

function energy_monitor.on_energy_monitor_destroyed(event)
  if event.type ~= defines.target_type.entity then return end
  if storage.energy_monitor[event.useful_id] then
    local v = storage.energy_monitor[event.useful_id]
    for _,child in pairs (v.children) do
      if child.valid then child.destroy() end
    end
    storage.energy_monitor[event.useful_id] = nil
  end
end


local function update_energy_monitor(v) --update a single energy monitor
  if not v.combinator.valid then return end

  if v.combinator.get_control_behavior().get_section(1) == nil then
    v.combinator.get_control_behavior().add_section(nil)
  end
  local combinator_control = v.combinator.get_control_behavior().get_section(1)
  local signal_values = {}

  for k,child in pairs(v.children) do
    if not child.valid then return game.print("borked energy monitor?") end
    if child.type == "generator" then
      child.fluidbox[1] = { name = "nothing", amount = 100}
      signal_values[k] =   -(child.energy_generated_last_tick * 100)
    elseif child.type == "electric-energy-interface" then
      signal_values[k] = child.energy
    end
  end

  combinator_control.filters = {
    {value = {type = "virtual", name = "signal-P", quality = "normal"}, min = math.ceil(signal_values["A"] + signal_values["1"])},
    {value = {type = "virtual", name = "signal-S", quality = "normal"}, min = math.ceil(signal_values["B"] + signal_values["2"])},
    {value = {type = "virtual", name = "signal-T", quality = "normal"}, min = math.ceil(signal_values["C"] + signal_values["3"])},
  }
  combinator_control.group = ""

end

--we're gonna use our flib function to update one energy monitor every tick. 
--though i do kinda wanna look into the possibility of updating every energy monitor thats on a particular network together? 
--that might be alot more complex though, so we're gonna start with a basic implementaiton

function energy_monitor.on_tick()
  storage.energy_monitor_k = flib_table.for_n_of( storage.energy_monitor, storage.energy_monitor_k, 1,
  function(v,k)
    update_energy_monitor(v)
  end)
end




return energy_monitor
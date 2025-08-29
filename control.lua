require("scripts.init")
require("scripts.thermal-system")
heat_system = require("scripts.thermal-system")

--b

script.on_event(defines.events.on_tick, function()
  heat_system.on_tick()
end)
local item_sounds = require("__base__.prototypes.item_sounds")
local speed_module = data.raw.module["speed-module"]
speed_module.effect = {speed = 0.2, consumption = 0.6, quality = -0.1}
speed_module.icon = "__base__/graphics/icons/speed-module-3.png"

local efficiency_module = data.raw.module["efficiency-module"]
efficiency_module.effect = {consumption = -0.4}
efficiency_module.icon = "__base__/graphics/icons/efficiency-module-3.png"
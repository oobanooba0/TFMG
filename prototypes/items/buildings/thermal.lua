local item_sounds = require("__base__.prototypes.item_sounds")

--small radiator
  local small_radiator = data.raw.item["small-radiator"]
  small_radiator.flags = {"always-show"}
  small_radiator.default_import_location = "arrival"
  small_radiator.weight = 20 * kg
  small_radiator.hidden = false
--ground radiator
  local ground_radiator = data.raw.item["ground-radiator"]
  ground_radiator.hidden = false
  ground_radiator.weight = 20 * kg
  ground_radiator.default_import_location = "arrival"

data:extend({
  {--heat monitor
    type = "item",
    name = "heat-monitor",
    icon = "__base__/graphics/icons/heat-interface.png",
    subgroup = "energy",
    order = "a-z",
    inventory_move_sound = item_sounds.mechanical_inventory_move,
    pick_sound = item_sounds.mechanical_inventory_pickup,
    drop_sound = item_sounds.mechanical_inventory_move,
    place_result = "heat-monitor",
    stack_size = 50,
    default_import_location = "arrival",
  },
})
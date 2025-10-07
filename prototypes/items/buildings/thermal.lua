local item_sounds = require("__base__.prototypes.item_sounds")

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
    stack_size = 50
  },

  {--small radiator
    type = "item",
    name = "small-radiator",
    icon = "__TFMG-assets-0__/buildings/small-radiator/panel_icon.png",
    icon_size = 256,
    subgroup = "space-related",
    order = "d[radiator]",
    inventory_move_sound = item_sounds.mechanical_inventory_move,
    pick_sound = item_sounds.mechanical_inventory_pickup,
    drop_sound = item_sounds.mechanical_inventory_move,
    place_result = "small-radiator",
    stack_size = 20,
    flags = {"always-show"},
  },
})
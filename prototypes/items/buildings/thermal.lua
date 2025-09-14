local item_sounds = require("__base__.prototypes.item_sounds")

data:extend({
  {--small radiator
    type = "item",
    name = "small-radiator",
    icon = "__TFMG__/graphics/buildings/small-radiator/panel_icon.png",
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
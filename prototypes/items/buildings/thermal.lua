local item_sounds = require("__base__.prototypes.item_sounds")

data:extend({
  {--small radiator
    type = "item",
    name = "small-radiator",
    icon = "__base__/graphics/icons/signal/signal-fire.png",
    subgroup = "space-related",
    order = "d[radiator]",
    inventory_move_sound = item_sounds.mechanical_inventory_move,
    pick_sound = item_sounds.mechanical_inventory_pickup,
    drop_sound = item_sounds.mechanical_inventory_move,
    place_result = "small-radiator",
    stack_size = 20
  },
})
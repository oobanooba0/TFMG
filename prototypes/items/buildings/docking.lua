local item_sounds = require("__base__.prototypes.item_sounds")

data:extend({
  {--docking connector?
    type = "item",
    name = "docking-port",
    icon = "__base__/graphics/icons/wooden-chest.png",
    subgroup = "space-related",
    order = "k-a",
    inventory_move_sound = item_sounds.wood_inventory_move,
    pick_sound = item_sounds.wood_inventory_pickup,
    drop_sound = item_sounds.wood_inventory_move,
    place_result = "docking-port",
    stack_size = 50,
    hidden = false,
  },
  {
    type = "item",
    name = "docking-belt",
    icon = "__base__/graphics/icons/linked-belt.png",
    hidden = false,
    subgroup = "space-related",
    order = "k-b",
    inventory_move_sound = item_sounds.mechanical_inventory_move,
    pick_sound = item_sounds.mechanical_inventory_pickup,
    drop_sound = item_sounds.mechanical_inventory_move,
    place_result = "docking-belt",
    stack_size = 50
  },
})
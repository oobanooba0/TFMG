local item_sounds = require("__base__.prototypes.item_sounds")

data:extend({
  {
    type = "item",
    name = "pipe-2",
    icon = "__Krastorio2Assets__/icons/entities/steel-pipe.png",
    subgroup = "energy-pipe-distribution",
    order = "aa[pipe-2]-a[pipe]",
    inventory_move_sound = item_sounds.metal_small_inventory_move,
    pick_sound = item_sounds.metal_small_inventory_pickup,
    drop_sound = item_sounds.metal_small_inventory_move,
    place_result = "pipe-2",
    stack_size = 100,
    weight = 5 * kg,
    random_tint_color = item_tints.iron_rust
  },
  {
    type = "item",
    name = "pipe-to-ground-2",
    icon = "__Krastorio2Assets__/icons/entities/steel-pipe-to-ground.png",
    subgroup = "energy-pipe-distribution",
    order = "aa[pipe-2]-b[pipe-to-ground]",
    inventory_move_sound = item_sounds.metal_small_inventory_move,
    pick_sound = item_sounds.metal_small_inventory_pickup,
    drop_sound = item_sounds.metal_small_inventory_move,
    place_result = "pipe-to-ground-2",
    stack_size = 50,
    random_tint_color = item_tints.iron_rust
  },
})
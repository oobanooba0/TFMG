local item_sounds = require("__base__.prototypes.item_sounds")

data.extend({
 {
    type = "item",
    name = "container-1",
    icon = "__base__/graphics/icons/iron-chest.png",
    subgroup = "storage",
    order = "a[items]-b[iron-chest]",
    inventory_move_sound = item_sounds.metal_chest_inventory_move,
    pick_sound = item_sounds.metal_chest_inventory_pickup,
    drop_sound = item_sounds.metal_chest_inventory_move,
    place_result = "container-1",
    stack_size = 50,
    random_tint_color = item_tints.iron_rust
  },
})
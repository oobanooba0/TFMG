local item_sounds = require("__base__.prototypes.item_sounds")

data:extend({
  {--scout radar
    type = "item",
    name = "scout-radar",
    icons = {{icon = "__base__/graphics/icons/radar.png", tint = {1,1,0.8}}},
    subgroup = "defensive-structure",
    order = "d[radar]-b[radar]",
    inventory_move_sound = item_sounds.metal_large_inventory_move,
    pick_sound = item_sounds.metal_large_inventory_pickup,
    drop_sound = item_sounds.metal_large_inventory_move,
    place_result = "scout-radar",
    stack_size = 10,
    random_tint_color = item_tints.iron_rust,
    default_import_location = "nauvis",
  },
})
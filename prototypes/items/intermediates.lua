local item_sounds = require("__base__.prototypes.item_sounds")

--Intermediates
data:extend({
    {
    type = "item",
    name = "general-purpose-structure",
    icons = {{icon = "__base__/graphics/icons/low-density-structure.png", tint = {0.7, 0.7, 1, 1}}},
    subgroup = "intermediate-product",
    color_hint = { text = "I" },
    order = "a[structural-materials]-a[general-purpose-structure]",
    inventory_move_sound = item_sounds.low_density_inventory_move,
    pick_sound = item_sounds.low_density_inventory_pickup,
    drop_sound = item_sounds.low_density_inventory_move,
    stack_size = 100,
  },
})

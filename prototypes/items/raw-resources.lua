local item_sounds = require("__base__.prototypes.item_sounds")
data:extend({
  {--ferric ore
    type = "item",
    name = "ferric-ore",
    icon = "__base__/graphics/icons/copper-ore.png",
    pictures =
    {
      { size = 64, filename = "__base__/graphics/icons/copper-ore.png",   scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__base__/graphics/icons/copper-ore-1.png",   scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__base__/graphics/icons/copper-ore-2.png",   scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__base__/graphics/icons/copper-ore-3.png",   scale = 0.5, mipmap_count = 4 },
    },
    subgroup = "raw-materials",
    order = "b[ore]-a[ferric]",
    inventory_move_sound = item_sounds.resource_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.resource_inventory_move,
    stack_size = 50,
    default_import_location = "arrival",
    weight = 1*kg,
  },
  {--mineral ore
    type = "item",
    name = "mineral-ore",
    icon = "__space-age__/graphics/icons/calcite.png",
    pictures =
    {
      { size = 64, filename = "__space-age__/graphics/icons/calcite.png",   scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__space-age__/graphics/icons/calcite-1.png",   scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__space-age__/graphics/icons/calcite-2.png",   scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__space-age__/graphics/icons/calcite-3.png",   scale = 0.5, mipmap_count = 4 },
    },
    subgroup = "raw-materials",
    order = "b[ore]-b[mineral]",
    inventory_move_sound = item_sounds.resource_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.resource_inventory_move,
    stack_size = 50,
    default_import_location = "arrival",
    weight = 1*kg,
  },

})
--Raw Materials
data:extend({
      {
    type = "item",
    name = "metal-ore",
    icon = "__base__/graphics/icons/iron-ore.png",
    pictures =
    {
      {size = 64, filename = "__base__/graphics/icons/iron-ore.png", scale = 0.5, mipmap_count = 4},
      {size = 64, filename = "__base__/graphics/icons/iron-ore-1.png", scale = 0.5, mipmap_count = 4},
      {size = 64, filename = "__base__/graphics/icons/iron-ore-2.png", scale = 0.5, mipmap_count = 4},
      {size = 64, filename = "__base__/graphics/icons/iron-ore-3.png", scale = 0.5, mipmap_count = 4}
    },
    subgroup = "raw-resource",
    color_hint = { text = "I" },
    order = "e[iron-ore]",
    stack_size = 50,
    weight = 2 * kg
  },
})
--Asteroid Chunks
data:extend({
  {
    type = "item",
    name = "ferric-asteroid-chunk",
    icon = "__TFMG__/graphics/icons/ferric-asteroid-chunk.png",
    subgroup = "space-material",
    order = "a[ferric]-e[chunk]",
    inventory_move_sound = "__space-age__/sound/item/rock-inventory-move.ogg",
    pick_sound = "__space-age__/sound/item/rock-inventory-pickup.ogg",
    drop_sound = "__space-age__/sound/item/rock-inventory-move.ogg",
    stack_size = 1,
    weight = 100 * kg
  },
})
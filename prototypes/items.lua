
--require from vanilla
local sounds = require("__base__.prototypes.entity.sounds")
local item_sounds = require("__base__.prototypes.item_sounds")
local item_tints = require("__base__.prototypes.item-tints")
--local simulations = require("__base__.prototypes.factoriopedia-simulations") -- don't need this atm, so I won't require rn.

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
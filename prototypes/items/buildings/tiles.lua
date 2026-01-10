local item_sounds = require("__base__.prototypes.item_sounds")
local TFMG = require("util.TFMG")

--heavy space platform
local HSP = data.raw.item["space-platform-foundation"] --halal snack pack
  HSP.flags = {"always-show"}
  HSP.stack_size = 250
  HSP.weight = TFMG.rocket_capacity(250)

data:extend({
  {
    type = "item",
    name = "light-space-platform-foundation",
    icons = {{icon = "__space-age__/graphics/icons/space-platform-foundation.png", tint = {0.8,1,1}}},
    subgroup = "space-platform",
    order = "b[light-space-platform-foundation]",
    inventory_move_sound = item_sounds.metal_large_inventory_move,
    pick_sound = item_sounds.metal_large_inventory_pickup,
    drop_sound = item_sounds.metal_large_inventory_move,
    stack_size = 250,
    weight = TFMG.rocket_capacity(250),
    place_as_tile =
    {
      result = "light-space-platform-foundation",
      condition_size = 1,
      condition = {layers={empty_space=true}},
      invert = true,
    }
  },
  {
    type = "item",
    name = "ultralight-scaffold",
    icons = {{icon = "__space-age__/graphics/icons/space-platform-foundation.png", tint = {1,1,1,0.5}}},
    subgroup = "space-platform",
    order = "c[light-space-platform-foundation]",
    inventory_move_sound = item_sounds.metal_large_inventory_move,
    pick_sound = item_sounds.metal_large_inventory_pickup,
    drop_sound = item_sounds.metal_large_inventory_move,
    stack_size = 250,
    weight = TFMG.rocket_capacity(500),
    place_as_tile =
    {
      result = "ultralight-scaffold",
      condition_size = 1,
      condition = {layers={empty_space=true}},
      invert = true,
    }
  },
  {
    type = "item",
    name = "depleted-regolith",
    icon = "__base__/graphics/icons/landfill.png",
    subgroup = "terrain",
    order = "c[landfill]-a[dirt]",
    inventory_move_sound = item_sounds.landfill_inventory_move,
    pick_sound = item_sounds.landfill_inventory_pickup,
    drop_sound = item_sounds.landfill_inventory_move,
    stack_size = 50,
    weight = TFMG.rocket_capacity(10),
    place_as_tile =
    {
      result = "depleted-regolith",
      condition_size = 1,
      condition = {layers={empty_space=true}},
      invert = true,
    },
    random_tint_color = item_tints.organic_green
  },
})
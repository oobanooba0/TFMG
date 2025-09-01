local item_sounds = require("__base__.prototypes.item_sounds")

data:extend({
      {
    type = "item",
    name = "matter-reconstructor",
    icon = "__base__/graphics/icons/assembling-machine-1.png",
    subgroup = "production-machine",
    order = "a2[matter-reconstructor]",
    inventory_move_sound = item_sounds.mechanical_inventory_move,
    pick_sound = item_sounds.mechanical_inventory_pickup,
    drop_sound = item_sounds.mechanical_inventory_move,
    place_result = "matter-reconstructor",
    stack_size = 50,
    flags = {"always-show"},
  },
  {
    type = "item",
    name = "assembling-machine",
    icon = "__base__/graphics/icons/assembling-machine-3.png",
    subgroup = "production-machine",
    order = "c[assembling-machine-3]",
    inventory_move_sound = item_sounds.mechanical_inventory_move,
    pick_sound = item_sounds.mechanical_inventory_pickup,
    drop_sound = item_sounds.mechanical_inventory_move,
    place_result = "assembling-machine",
    stack_size = 50,
    weight = 40*kg,
  },
    {
    type = "item",
    name = "furnace",
    icon = "__base__/graphics/icons/electric-furnace.png",
    subgroup = "smelting-machine",
    order = "a[furnace]",
    inventory_move_sound = item_sounds.electric_large_inventory_move,
    pick_sound = item_sounds.electric_large_inventory_pickup,
    drop_sound = item_sounds.electric_large_inventory_move,
    place_result = "furnace",
    stack_size = 50,
    weight = 20*kg
  },
})
local item_sounds = require("__base__.prototypes.item_sounds")

data:extend({
---poles
  {
    type = "item",
    name = "tiny-electric-pole",
    icon = "__base__/graphics/icons/medium-electric-pole.png",
    subgroup = "energy-pipe-distribution",
    order = "a-a",
    inventory_move_sound = item_sounds.electric_large_inventory_move,
    pick_sound = item_sounds.electric_large_inventory_pickup,
    drop_sound = item_sounds.electric_large_inventory_move,
    place_result = "tiny-electric-pole",
    stack_size = 100
  },


---generators
      {--proton decay thermoelectric generator
    type = "item",
    name = "proton-decay-thermoelectric-generator",
    icon = "__Krastorio2Assets__/icons/entities/matter-plant.png",
    subgroup = "energy",
    order = "z",
    inventory_move_sound = item_sounds.reactor_inventory_move,
    pick_sound = item_sounds.reactor_inventory_pickup,
    drop_sound = item_sounds.reactor_inventory_move,
    place_result = "proton-decay-thermoelectric-generator",
    weight = 1000 * tons,
    stack_size = 1,
    flags = {"always-show"},
  },
  {
    type = "item",
    name = "solar-cell",
    icon = "__base__/graphics/icons/solar-panel.png",
    subgroup = "energy",
    order = "a",
    inventory_move_sound = item_sounds.electric_large_inventory_move,
    pick_sound = item_sounds.electric_large_inventory_pickup,
    drop_sound = item_sounds.electric_large_inventory_move,
    place_result = "solar-cell",
    stack_size = 50
  },
})
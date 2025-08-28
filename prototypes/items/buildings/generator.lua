local item_sounds = require("__base__.prototypes.item_sounds")

data:extend({
      {--proton decay thermolectric generator
    type = "item",
    name = "proton-decay-thermolectric-generator",
    icon = "__base__/graphics/icons/nuclear-reactor.png",
    subgroup = "energy",
    order = "f[nuclear-energy]-a[reactor]",
    inventory_move_sound = item_sounds.reactor_inventory_move,
    pick_sound = item_sounds.reactor_inventory_pickup,
    drop_sound = item_sounds.reactor_inventory_move,
    place_result = "proton-decay-thermolectric-generator",
    weight = 1 * tons,
    stack_size = 10
  },
})
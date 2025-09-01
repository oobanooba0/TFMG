local item_sounds = require("__base__.prototypes.item_sounds")

data:extend({
  {
    type = "item",
    name = "inserter-1",
    icon = "__base__/graphics/icons/inserter.png",
    subgroup = "inserter",
    color_hint = { text = "Y" },
    order = "b[inserter]",
    inventory_move_sound = item_sounds.inserter_inventory_move,
    pick_sound = item_sounds.inserter_inventory_pickup,
    drop_sound = item_sounds.inserter_inventory_move,
    place_result = "inserter-1",
    stack_size = 50,
    flags = {"always-show"},
  },
})
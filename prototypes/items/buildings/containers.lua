local item_sounds = require("__base__.prototypes.item_sounds")

--empy

data:extend({
  {
    type = "item",
    name = "chest-2",
    icon = "__Krastorio2Assets__/icons/entities/strongbox.png",
    subgroup = "storage",
    order = "a[items]-d[chest-2]",
    place_result = "chest-2",
    stack_size = 50,
    weight = 20*kg,
  },


})
local item_sounds = require("__base__.prototypes.item_sounds")

--empy
local chest_2_stack_size = 10
local chest_2_weight = 20*kg

data:extend({
  {
    type = "item",
    name = "chest-2",
    icon = "__Krastorio2Assets__/icons/entities/strongbox.png",
    subgroup = "storage",
    order = "a[items]-d[chest-2]-a",
    place_result = "chest-2",
    stack_size = chest_2_stack_size,
    weight = chest_2_weight,
  },
  {
    type = "item",
    name = "active-provider-chest-2",
    icon = "__Krastorio2Assets__/icons/entities/active-provider-strongbox.png",
    subgroup = "storage",
    order = "a[items]-d[chest-2]-b",
    place_result = "active-provider-chest-2",
    stack_size = chest_2_stack_size,
    weight = chest_2_weight,
  },
  {
    type = "item",
    name = "passive-provider-chest-2",
    icon = "__Krastorio2Assets__/icons/entities/passive-provider-strongbox.png",
    subgroup = "storage",
    order = "a[items]-d[chest-2]-c",
    place_result = "passive-provider-chest-2",
    stack_size = chest_2_stack_size,
    weight = chest_2_weight,
  },
  {
    type = "item",
    name = "requester-chest-2",
    icon = "__Krastorio2Assets__/icons/entities/requester-strongbox.png",
    subgroup = "storage",
    order = "a[items]-d[chest-2]-d",
    place_result = "requester-chest-2",
    stack_size = chest_2_stack_size,
    weight = chest_2_weight,
  },
  {
    type = "item",
    name = "storage-chest-2",
    icon = "__Krastorio2Assets__/icons/entities/storage-strongbox.png",
    subgroup = "storage",
    order = "a[items]-d[chest-2]-e",
    place_result = "storage-chest-2",
    stack_size = chest_2_stack_size,
    weight = chest_2_weight,
  },
  {
    type = "item",
    name = "buffer-chest-2",
    icon = "__Krastorio2Assets__/icons/entities/buffer-strongbox.png",
    subgroup = "storage",
    order = "a[items]-d[chest-2]-f",
    place_result = "buffer-chest-2",
    stack_size = chest_2_stack_size,
    weight = chest_2_weight,
  },
})
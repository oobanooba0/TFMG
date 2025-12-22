
local item_sounds = require("__base__.prototypes.item_sounds")
local TFMG = require("__TFMG__.util.TFMG")


data:extend({
  {
    type = "item",
    name = "neural-node",
    icon = "__base__/graphics/icons/lab.png",
    subgroup = "production-machine",
    order = "z[lab]",
    inventory_move_sound = item_sounds.lab_inventory_move,
    pick_sound = item_sounds.lab_inventory_pickup,
    drop_sound = item_sounds.lab_inventory_move,
    place_result = "neural-node",
    stack_size = 10,
    default_import_location = "nauvis",
  },
})
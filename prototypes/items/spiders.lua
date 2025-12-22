
local item_sounds = require("__base__.prototypes.item_sounds")
local TFMG = require("__TFMG__.util.TFMG")

data:extend({
  {--Scout'o'tron
    type = "item-with-entity-data",
    name = "scout-o-tron",
    icon = "__base__/graphics/icons/spidertron.png",
    icon_tintable = "__base__/graphics/icons/spidertron-tintable.png",
    icon_tintable_mask = "__base__/graphics/icons/spidertron-tintable-mask.png",
    subgroup = "transport",
    order = "b[personal-transport]-c[spidertron]-a[scout]",
    inventory_move_sound = item_sounds.spidertron_inventory_move,
    pick_sound = item_sounds.spidertron_inventory_pickup,
    drop_sound = item_sounds.spidertron_inventory_move,
    place_result = "scout-o-tron",
    weight = TFMG.rocket_capacity(1),
    stack_size = 1,
    default_import_location = "nauvis",
  },
  {--constructron
    type = "item-with-entity-data",
    name = "constructron",
    icon = "__base__/graphics/icons/spidertron.png",
    icon_tintable = "__base__/graphics/icons/spidertron-tintable.png",
    icon_tintable_mask = "__base__/graphics/icons/spidertron-tintable-mask.png",
    subgroup = "transport",
    order = "b[personal-transport]-c[spidertron]-b[constructron]",
    inventory_move_sound = item_sounds.spidertron_inventory_move,
    pick_sound = item_sounds.spidertron_inventory_pickup,
    drop_sound = item_sounds.spidertron_inventory_move,
    place_result = "constructron",
    weight = TFMG.rocket_capacity(1),
    stack_size = 1,
    default_import_location = "nauvis",
  },
})
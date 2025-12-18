local item_sounds = require("__base__.prototypes.item_sounds")
local space_age_item_sounds = require("__space-age__.prototypes.item_sounds")
local second = 60
local minute = 3600
local TFMG = require("util.TFMG")

data:extend({
  {
    type = "item",
    name = "mechanical-leg",
    icon = "__base__/graphics/icons/exoskeleton-equipment.png",
    subgroup = "advanced-intermediates",
    order = "b[spiderton]-b[mechanical-leg]",
    inventory_move_sound = item_sounds.electric_small_inventory_move,
    pick_sound = item_sounds.electric_small_inventory_pickup,
    drop_sound = item_sounds.electric_small_inventory_move,
    stack_size = 5,
    place_as_equipment_result = "mechanical-leg-equipment",
    default_import_location = "nauvis",
  },
})
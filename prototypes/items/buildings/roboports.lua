local item_sounds = require("__base__.prototypes.item_sounds")


data:extend({
  {
    type = "item",
    name = "roboport-1",
    icon = "__base__/graphics/icons/roboport.png",
    place_as_equipment_result = "roboport-1-equipment",
    place_result = "roboport-1",
    subgroup = "logistic-network",
    order = "c[signal]-a[roboport]",
    inventory_move_sound = item_sounds.roboport_inventory_move,
    pick_sound = item_sounds.roboport_inventory_pickup,
    drop_sound = item_sounds.roboport_inventory_move,
    stack_size = 10,
    default_import_location = "arrival",
  },
})
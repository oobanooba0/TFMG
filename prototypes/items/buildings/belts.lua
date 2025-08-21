local item_sounds = require("__base__.prototypes.item_sounds")

data:extend({
    {
    type = "item",
    name = "transport-belt-1",
    icon = "__base__/graphics/icons/transport-belt.png",
    subgroup = "belt",
    color_hint = { text = "1" },
    order = "a[transport-belt]-a[transport-belt]",
    inventory_move_sound = item_sounds.transport_belt_inventory_move,
    pick_sound = item_sounds.transport_belt_inventory_pickup,
    drop_sound = item_sounds.transport_belt_inventory_move,
    place_result = "transport-belt-1",
    stack_size = 100
    },
    {
    type = "item",
    name = "underground-belt-1",
    icon = "__base__/graphics/icons/underground-belt.png",
    subgroup = "belt",
    color_hint = { text = "1" },
    order = "b[underground-belt]-a[underground-belt]",
    inventory_move_sound = item_sounds.mechanical_inventory_move,
    pick_sound = item_sounds.mechanical_inventory_pickup,
    drop_sound = item_sounds.mechanical_inventory_move,
    place_result = "underground-belt-1",
    stack_size = 50
    },
    {
    type = "item",
    name = "splitter-1",
    icon = "__base__/graphics/icons/splitter.png",
    subgroup = "belt",
    color_hint = { text = "1" },
    order = "c[splitter]-a[splitter]",
    inventory_move_sound = item_sounds.mechanical_inventory_move,
    pick_sound = item_sounds.mechanical_inventory_pickup,
    drop_sound = item_sounds.mechanical_inventory_move,
    place_result = "splitter-1",
    stack_size = 50,
    weight = 20*kg
    },
    {
    type = "item",
    name = "loader-1",
    icon = "__base__/graphics/icons/loader.png",
    hidden = true,
    subgroup = "belt",
    color_hint = { text = "1" },
    order = "d[loader]-a[basic-loader]",
    inventory_move_sound = item_sounds.mechanical_inventory_move,
    pick_sound = item_sounds.mechanical_inventory_pickup,
    drop_sound = item_sounds.mechanical_inventory_move,
    place_result = "loader-1",
    stack_size = 50
    },
  })
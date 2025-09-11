local item_sounds = require("__base__.prototypes.item_sounds")
data:extend({
--science packs

  {--introspection unverified
    type = "item",
    name = "introspection-science-unverified",
    icons = {{icon = "__base__/graphics/icons/automation-science-pack.png" , tint = {0.6, 0.6, 0.6}}},
    subgroup = "science-unverified",
    order = "a[introspection]",
    inventory_move_sound = item_sounds.science_inventory_move,
    pick_sound = item_sounds.science_inventory_pickup,
    drop_sound = item_sounds.science_inventory_move,
    stack_size = 100,
    weight = 1 * kg,
  },
  {--introspection
    type = "tool",
    name = "introspection-science",
    icon = "__base__/graphics/icons/automation-science-pack.png",
    subgroup = "science-verified",
    order = "a[introspection]",
    inventory_move_sound = item_sounds.science_inventory_move,
    pick_sound = item_sounds.science_inventory_pickup,
    drop_sound = item_sounds.science_inventory_move,
    stack_size = 100,
    weight = 1 * kg,
    durability = 1,
    durability_description_key = "description.science-pack-remaining-amount-key",
    factoriopedia_durability_description_key = "description.factoriopedia-science-pack-remaining-amount-key",
    durability_description_value = "description.science-pack-remaining-amount-value",
    random_tint_color = item_tints.bluish_science
  },

})
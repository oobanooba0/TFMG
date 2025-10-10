local item_sounds = require("__base__.prototypes.item_sounds")
data:extend({
--science packs

  {--introspection unverified
    type = "item",
    name = "introspection-science-unverified",
    icons = {
      {icon = "__Krastorio2Assets__/icons/cards/matter-tech-card.png"},
      {icon = "__Krastorio2Assets__/icons/cards/matter-tech-card-light.png",tint = {1,0,0,0.1}}
    },
    subgroup = "science-unverified",
    order = "a[introspection]",
    inventory_move_sound = item_sounds.science_inventory_move,
    pick_sound = item_sounds.science_inventory_pickup,
    drop_sound = item_sounds.science_inventory_move,
    stack_size = 100,
    weight = 1 * kg,
    default_import_location = "arrival",
  },
  {--introspection
    type = "tool",
    name = "introspection-science",
    icon = "__Krastorio2Assets__/icons/cards/matter-tech-card.png",
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
    random_tint_color = item_tints.bluish_science,
    default_import_location = "arrival",
    pictures = {
      layers = {
        {
          filename = "__Krastorio2Assets__/icons/cards/matter-tech-card.png",
          size = 64,
          scale = 0.5,
        },
        {
          filename = "__Krastorio2Assets__/icons/cards/matter-tech-card-light.png",
          size = 64,
          scale = 0.5,
          draw_as_light = true,
        },
      },
    },
  },
  {--exploration unverified
    type = "item",
    name = "exploration-science-unverified",
    icons = {
      {icon = "__Krastorio2Assets__/icons/cards/utility-tech-card.png"},
      {icon = "__Krastorio2Assets__/icons/cards/utility-tech-card-light.png",tint = {1,0,0,0.1}}
    },
    subgroup = "science-unverified",
    order = "b[exploration]",
    inventory_move_sound = item_sounds.science_inventory_move,
    pick_sound = item_sounds.science_inventory_pickup,
    drop_sound = item_sounds.science_inventory_move,
    stack_size = 100,
    weight = 1 * kg,
    default_import_location = "arrival",
  },
  {--exploration
    type = "tool",
    name = "exploration-science",
    icon = "__Krastorio2Assets__/icons/cards/utility-tech-card.png",
    subgroup = "science-verified",
    order = "b[introspection]",
    inventory_move_sound = item_sounds.science_inventory_move,
    pick_sound = item_sounds.science_inventory_pickup,
    drop_sound = item_sounds.science_inventory_move,
    stack_size = 100,
    weight = 1 * kg,
    durability = 1,
    durability_description_key = "description.science-pack-remaining-amount-key",
    factoriopedia_durability_description_key = "description.factoriopedia-science-pack-remaining-amount-key",
    durability_description_value = "description.science-pack-remaining-amount-value",
    random_tint_color = item_tints.bluish_science,
    default_import_location = "arrival",
    pictures = {
      layers = {
        {
          filename = "__Krastorio2Assets__/icons/cards/utility-tech-card.png",
          size = 64,
          scale = 0.5,
        },
        {
          filename = "__Krastorio2Assets__/icons/cards/utility-tech-card-light.png",
          size = 64,
          scale = 0.5,
          draw_as_light = true,
        },
      },
    },
  },

})
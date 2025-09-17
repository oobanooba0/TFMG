local sounds = require "__base__.prototypes.entity.sounds"

--Ferric ore
data:extend({
  {
    type = "resource",
    name = "ferric-ore",
    hidden_in_factoriopedia = true,
    icon = "__TFMG__/graphics/icons/ferric-ore.png",
    flags = {"placeable-neutral"},
    order = "a-a",
    tree_removal_probability = 0.8,
    tree_removal_max_distance = 32 * 32,
    minable = {
        mining_particle = "stone-particle",
        mining_time = 1,
        results = {
            {type = "item", name = "ferric-ore", amount = 1},
        }
    },
    walking_sound = sounds.ore,
    driving_sound = stone_driving_sound,
    collision_box = {{-0.1, -0.1}, {0.1, 0.1}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    autoplace = {
        control = "ferric_ore",
        default_enabled = false,
        force = "neutral",
        order = "a-a",
        placement_density = 1,
        probability_expression = "ferric_ore",
        richness_expression = [[var("control:ferric_ore:richness") *  var("ferric_ore") * (sqrt(x*x + y*y))]],
    },
    stage_counts = {15000, 9500, 5500, 2900, 1300, 400, 150, 80},
    stages =
    {
      sheet =
      {
        filename = "__TFMG__/graphics/entity/ferric-ore/ferric-ore.png",
        priority = "extra-high",
        size = 128,
        frame_count = 8,
        variation_count = 8,
        scale = 0.5
      }
    },
    map_color = {255, 100, 100},
    mining_visualisation_tint = {255, 240, 240},
  }
})
data:extend({
  {
    type = "autoplace-control",
    name = "ferric_ore",
    localised_name = {"", "[entity=ferric-ore] ", {"entity-name.ferric-ore"}},
    richness = true,
    order = "a-a",
    category = "resource"
  },
})

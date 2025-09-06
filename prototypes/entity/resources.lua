local sounds = require "__base__.prototypes.entity.sounds"


data:extend({
  {
    type = "resource",
    name = "ice-ore",
    hidden_in_factoriopedia = true,
    icon = "__TFMG__/graphics/icons/ice-ore.png",
    flags = {"placeable-neutral"},
    order = "a",
    tree_removal_probability = 0.8,
    tree_removal_max_distance = 32 * 32,
    minable = {
        mining_particle = "stone-particle",
        mining_time = 1,
        results = {
            {type = "item", name = "ice-ore", amount = 1},
        }
    },
    walking_sound = sounds.ore,
    driving_sound = stone_driving_sound,
    collision_box = {{-0.1, -0.1}, {0.1, 0.1}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    autoplace = {
        control = "ice_ore",
        default_enabled = false,
        force = "neutral",
        order = "a",
        placement_density = 1,
        probability_expression = "ice_ore",
        richness_expression = [[var("control:ice_ore:richness") *  var("ice_ore") * (sqrt(x*x + y*y))]],
    },
    stage_counts = {15000, 9500, 5500, 2900, 1300, 400, 150, 80},
    stages =
    {
      sheet =
      {
        filename = "__TFMG__/graphics/entity/ice-ore/ice-ore.png",
        priority = "extra-high",
        size = 128,
        frame_count = 8,
        variation_count = 8,
        scale = 0.5
      }
    },
    map_color = {240, 240, 255},
    mining_visualisation_tint = {255, 240, 240},
  }
})

data:extend({
  {
    type = "autoplace-control",
    name = "ice_ore",
    localised_name = {"", "[entity=ice-ore] ", {"entity-name.ice-ore"}},
    richness = true,
    order = "a-a",
    category = "resource"
  },
})
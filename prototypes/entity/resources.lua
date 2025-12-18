local sounds = require "__base__.prototypes.entity.sounds"
local base_tile_sounds = require("__base__.prototypes.tile.tile-sounds")
local resource_autoplace = require("resource-autoplace")

resource_autoplace.initialize_patch_set("ice-geyser", false, "nauvis")

local function resource(resource_parameters, autoplace_parameters, icon)
  return
  {
    type = "resource",
    name = resource_parameters.name,
    icon = icon or "__TFMG-assets-0__/icons/" .. resource_parameters.name .. ".png",
    flags = {"placeable-neutral"},
    order="a-b-"..resource_parameters.order,
    tree_removal_probability = 0.8,
    tree_removal_max_distance = 32 * 32,
    minable = resource_parameters.minable or
    {
      mining_particle = "stone-particle",--remember to change later
      mining_time = resource_parameters.mining_time,
      result = resource_parameters.result
    },
    category = resource_parameters.category,
    subgroup = resource_parameters.subgroup,
    walking_sound = resource_parameters.walking_sound,
    collision_mask = resource_parameters.collision_mask,
    collision_box = {{-0.1, -0.1}, {0.1, 0.1}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    resource_patch_search_radius = resource_parameters.resource_patch_search_radius,
    autoplace = autoplace_parameters.probability_expression ~= nil and
    {
      --control = resource_parameters.name,
      order = resource_parameters.order,
      probability_expression = autoplace_parameters.probability_expression,
      richness_expression = autoplace_parameters.richness_expression
    }
    or resource_autoplace.resource_autoplace_settings
    {
      name = resource_parameters.name,
      order = resource_parameters.order,
      autoplace_control_name = resource_parameters.autoplace_control_name,
      base_density = autoplace_parameters.base_density,
      base_spots_per_km = autoplace_parameters.base_spots_per_km2,
      regular_rq_factor_multiplier = autoplace_parameters.regular_rq_factor_multiplier,
      starting_rq_factor_multiplier = autoplace_parameters.starting_rq_factor_multiplier,
      candidate_spot_count = autoplace_parameters.candidate_spot_count,
      tile_restriction = autoplace_parameters.tile_restriction
    },
    stage_counts = {15000, 9500, 5500, 2900, 1300, 400, 150, 80},
    stages =
    {
      sheet =
      {
        filename = "__TFMG-assets-0__/entity/" .. resource_parameters.name .. "/" .. resource_parameters.name .. ".png",
        priority = "extra-high",
        size = 128,
        frame_count = 8,
        variation_count = 8,
        scale = 0.5
      }
    },
    map_color = resource_parameters.map_color,
    mining_visualisation_tint = resource_parameters.mining_visualisation_tint,
    factoriopedia_simulation = resource_parameters.factoriopedia_simulation
  }
end


data:extend({
  resource(--Ferric ore
    {
      name = "ferric-ore",
      order = "b",
      map_color = {0.803, 0.388, 0.215},
      mining_time = 1,
      result = "ferric-asteroid-chunk",
      walking_sound = sounds.ore,
      mining_visualisation_tint = {r = 1.000, g = 0.675, b = 0.541, a = 1.000},
    },
    {
      probability_expression = 0
    },
    "__TFMG-assets-0__/icons/ferric-asteroid-chunk.png"
  ),
  {--ferric ore autoplace controls
    type = "autoplace-control",
    name = "ferric_ore",
    localised_name = {"", "[entity=ferric-ore] ", {"entity-name.ferric-ore"}},
    richness = true,
    order = "a-a",
    category = "resource"
  },
  --Mineral Ore
    resource(
    {
      name = "mineral-ore",
      order = "b",
      map_color = {0.7, 0.4, 0.7},
      mining_time = 4,
      result = "crystalline-asteroid-chunk",
      walking_sound = sounds.ore,
      mining_visualisation_tint = {r = 0.99, g = 1.0, b = 0.92, a = 1.000},
    },
    {
      probability_expression = 0
    },
    "__TFMG-assets-0__/icons/items/crystalline-chunk.png"
  ),
  {--mineral ore autoplace controls
    type = "autoplace-control",
    name = "mineral_ore",
    localised_name = {"", "[entity=mineral-ore] ", {"entity-name.mineral-ore"}},
    richness = true,
    order = "a-b",
    category = "resource"
  },

  {--ice geyser
    type = "resource",
    name = "ice-geyser",
    icon = "__space-age__/graphics/icons/lithium-brine.png",
    flags = {"placeable-neutral"},
    category = "basic-fluid",
    subgroup = "mineable-fluids",
    order="c",
    highlight = true,
    normal = 50000,
    resource_patch_search_radius = 16,
    tree_removal_probability = 0.7,
    tree_removal_max_distance = 32 * 32,
    minable =
    {
      mining_time = 0.5,
      results =
      {
        {
          type = "fluid",
          name = "hydrocarbon-slush",
          amount_min = 10,
          amount_max = 10,
          probability = 1
        }
      }
    },
    walking_sound = base_tile_sounds.walking.oil({}),
    collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    autoplace = {
      order="a[resources]-c[ice-geyser]",
      probability_expression = "ice_geyser_probability",
      richness_expression = "ice_geyser_richness"
    },
    stage_counts = {0},
    stages =
    {
      layers =
      {
        util.sprite_load("__space-age__/graphics/entity/lithium-brine/lithium-brine",
        {
          priority = "extra-high",
          frame_count = 4,
          scale = 0.5
        })
      }
    },
    draw_stateless_visualisation_under_building = false,
    stateless_visualisation =
    {
      {
        count = 1,
        render_layer = "smoke",
        animation = util.sprite_load("__space-age__/graphics/entity/lithium-brine/smoke-1",
        {
          priority = "extra-high",
          frame_count = 64,
          animation_speed = 0.35,
          tint = util.multiply_color({r=0.9, g=1, b=0.9}, 1),
          scale = 0.5
          --shift = util.by_pixel( 0.5, -54.0)
        })
      },
      {
        count = 1,
        render_layer = "smoke",
        animation = util.sprite_load("__space-age__/graphics/entity/lithium-brine/smoke-2",
        {
          priority = "extra-high",
          frame_count = 64,
          animation_speed = 0.35,
          tint = util.multiply_color({r=0.4, g=0.6, b=0.4}, 0.5),
          scale = 0.5
          --shift = util.by_pixel( 0.5, -54.0)
        })
      },
      {
        count = 1,
        render_layer = "smoke",
        animation = {
          filename = "__space-age__/graphics/entity/fluorine-vent/fluorine-vent-gas-outer.png",
          frame_count = 47,
          line_length = 16,
          width = 90,
          height = 188,
          animation_speed = 0.5,
          shift = util.by_pixel(-2, -40),
          scale = 0.5,
          tint = util.multiply_color({r=0.9, g=1, b=0.9}, 0.1),
        }
      },
      {
        count = 1,
        render_layer = "smoke",
        animation = {
          filename = "__space-age__/graphics/entity/fluorine-vent/fluorine-vent-gas-inner.png",
          frame_count = 47,
          line_length = 16,
          width = 40,
          height = 84,
          animation_speed = 0.5,
          shift = util.by_pixel(0, -14),
          scale = 0.5,
          tint = util.multiply_color({r=0.4, g=0.6, b=0.4}, 0.1),
        }
      }
    },
    map_color = {0.6, 0.6, 1},
    map_grid = false,
  },
  {--ice geyser autoplace controls
    type = "autoplace-control",
    name = "ice_geyser",
    localised_name = {"", "[entity=ice-geyser] ", {"entity-name.ice-geyser"}},
    richness = true,
    order = "a-b",
    category = "resource"
  },
})


local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")

data:extend({
  {--tiny electric pole
    type = "electric-pole",
    name = "tiny-electric-pylon",
    icon = "__base__/graphics/icons/medium-electric-pole.png",
    quality_indicator_scale = 0.75,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "tiny-electric-pylon"},
    max_health = 100,
    corpse = "medium-electric-pole-remnants",
    dying_explosion = "medium-electric-pole-explosion",
    fast_replaceable_group = "electric-pole",
    resistances =
    {
      {
        type = "fire",
        percent = 100
      }
    },
    collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    damaged_trigger_effect = hit_effects.entity({{-0.2, -2.2},{0.2, 0.2}}),
    drawing_box_vertical_extension = 2.3,
    maximum_wire_distance = 8,
    supply_area_distance = 1,
    impact_category = "metal",
    open_sound = sounds.electric_network_open,
    close_sound = sounds.electric_network_close,
    pictures =
    {
      layers =
      {
        {
          filename = "__space-age__/graphics/entity/stack-inserter/stack-inserter-platform.png",
          priority = "extra-high",
          flags = { "low-object" },
          direction_count = 4,
          width = 105,
          height = 79,
          shift = util.by_pixel(1.5, 7.5-1),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/circuit-connector/ccm-inserter-01-base-sequence.png",
          direction_count = 4,
          height = 40,
          line_length = 4,
          priority = "extra-high",
          flags = { "low-object" },
          scale = 0.5,
          shift = util.by_pixel(1.0, 2.5),
          width = 52
        },
        {
          filename = "__base__/graphics/entity/circuit-connector/ccm-inserter-01-wire-sequence.png",
          direction_count = 4,
          height = 46,
          line_length = 4,
          priority = "extra-high",
          flags = { "low-object" },
          scale = 0.5,
          shift = util.by_pixel(3, -1),
          width = 62
        },
        {
          draw_as_shadow = true,
          filename = "__base__/graphics/entity/circuit-connector/ccm-inserter-01-base-shadow.png",
          direction_count = 4,
          height = 36,
          line_length = 4,
          priority = "extra-high",
          flags = { "low-object" },
          scale = 0.5,
          shift = util.by_pixel(6.5, 7),
          width = 56
        },
        {
          draw_as_shadow = true,
          filename = "__base__/graphics/entity/circuit-connector/ccm-inserter-01-wire-shadow.png",
          direction_count = 4,
          height = 46,
          line_length = 4,
          priority = "extra-high",
          flags = { "low-object" },
          scale = 0.5,
          shift = util.by_pixel(12, 5.5),
          width = 64
        },
      }
    },
    connection_points =
    {
      {
        shadow = { red = util.by_pixel(21.5, -2.5), green = util.by_pixel(25, 3), copper = util.by_pixel(23.25,0.25)},
        wire = { red = util.by_pixel(13, -10), green = util.by_pixel(16, -4.5), copper = util.by_pixel(14.5, -7.25)},
      },
      {
        shadow = { red = util.by_pixel(15, -6.5), green = util.by_pixel(21.5, -3), copper = util.by_pixel(18.25,-4.75) },
        wire = { red = util.by_pixel(7.5, -13), green = util.by_pixel(13, -10), copper = util.by_pixel(10.25,-11.5) },
      },
      {
        shadow = { red = util.by_pixel(25, 8.5), green = util.by_pixel(22, 13.5), copper = util.by_pixel(23.5,11) },
        wire = { red = util.by_pixel(16.5, 1.5), green = util.by_pixel(12.5, 6), copper = util.by_pixel(14.5,3.75) },
      },
      {
        shadow = { red = util.by_pixel(4.5, -6), green = util.by_pixel(-3, -3.5), copper = util.by_pixel(0.75,-4.75) },
        wire = { red = util.by_pixel(-5.5, -12.5), green = util.by_pixel(-11, -11), copper = util.by_pixel(-8.25,-11.75) }
      },
    },
    radius_visualisation_picture =
    {
      filename = "__base__/graphics/entity/small-electric-pole/electric-pole-radius-visualization.png",
      width = 12,
      height = 12,
      priority = "extra-high-no-scale"
    },
    water_reflection =
    {
      pictures =
      {
        filename = "__base__/graphics/entity/small-electric-pole/small-electric-pole-reflection.png",
        priority = "extra-high",
        width = 12,
        height = 28,
        shift = util.by_pixel(5, 40),
        variation_count = 4,
        scale = 5
      },
      rotate = false,
      orientation_to_variation = true
    }
  },
  {--small electric pole
    type = "electric-pole",
    name = "small-electric-pylon",
    icon = "__base__/graphics/icons/small-electric-pole.png",
    quality_indicator_scale = 0.75,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "small-electric-pylon"},
    max_health = 100,
    corpse = "medium-electric-pole-remnants",
    dying_explosion = "medium-electric-pole-explosion",
    fast_replaceable_group = "electric-pole",
    resistances =
    {
      {
        type = "fire",
        percent = 100
      }
    },
    collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    damaged_trigger_effect = hit_effects.entity({{-0.2, -2.2},{0.2, 0.2}}),
    drawing_box_vertical_extension = 2.3,
    maximum_wire_distance = 12,
    supply_area_distance = 6,
    impact_category = "metal",
    open_sound = sounds.electric_network_open,
    close_sound = sounds.electric_network_close,
    pictures =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/medium-electric-pole/medium-electric-pole.png",
          priority = "extra-high",
          width = 84,
          height = 252,
          direction_count = 4,
          shift = util.by_pixel(3.5, -44),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/medium-electric-pole/medium-electric-pole-shadow.png",
          priority = "extra-high",
          width = 280,
          height = 64,
          direction_count = 4,
          shift = util.by_pixel(56.5, -1),
          draw_as_shadow = true,
          scale = 0.5
        }
      }
    },
    connection_points =
    {
      {
        shadow =
        {
          copper = util.by_pixel_hr(229, -13),
          red = util.by_pixel_hr(246, -2),
          green = util.by_pixel_hr(201, -2)
        },
        wire =
        {
          copper = util.by_pixel_hr(15, -199),
          red = util.by_pixel_hr(43, -179),
          green = util.by_pixel_hr(-15, -185)
        }
      },
      {
        shadow =
        {
          copper = util.by_pixel_hr(229, -13),
          red = util.by_pixel_hr(230, 10),
          green = util.by_pixel_hr(196, -23)
        },
        wire =
        {
          copper = util.by_pixel_hr(15, -199),
          red = util.by_pixel_hr(27, -167),
          green = util.by_pixel_hr(-9, -200)
        }
      },
      {
        shadow =
        {
          copper = util.by_pixel_hr(229, -13),
          red = util.by_pixel_hr(208, 12),
          green = util.by_pixel_hr(217, -30)
        },
        wire =
        {
          copper = util.by_pixel_hr(15, -199),
          red = util.by_pixel_hr(5, -166),
          green = util.by_pixel_hr(13, -206)
        }
      },
      {
        shadow =
        {
          copper = util.by_pixel_hr(229, -13),
          red = util.by_pixel_hr(195, 1),
          green = util.by_pixel_hr(238, -23)
        },
        wire =
        {
          copper = util.by_pixel_hr(15, -199),
          red = util.by_pixel_hr(-12, -175),
          green = util.by_pixel_hr(36, -199)
        }
      }
    },
    radius_visualisation_picture =
    {
      filename = "__base__/graphics/entity/small-electric-pole/electric-pole-radius-visualization.png",
      width = 12,
      height = 12,
      priority = "extra-high-no-scale"
    },
    water_reflection =
    {
      pictures =
      {
        filename = "__base__/graphics/entity/medium-electric-pole/medium-electric-pole-reflection.png",
        priority = "extra-high",
        width = 12,
        height = 28,
        shift = util.by_pixel(0, 55),
        variation_count = 1,
        scale = 5
      },
      rotate = false,
      orientation_to_variation = false
    }
  },


---generators
  {--proton decay RTG
    type = "solar-panel",
    name = "proton-decay-thermoelectric-generator",
    icon = "__Krastorio2Assets__/icons/entities/matter-plant.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "proton-decay-thermoelectric-generator"},
    max_health = 150,
    corpse = "nuclear-reactor-remnants",
    dying_explosion = "nuclear-reactor-explosion",
    subgroup = "other",
    collision_box = {{-3.7, -3.7}, {3.7, 3.7}},
    selection_box = {{-4, -4}, {4, 4}},
    damaged_trigger_effect = hit_effects.entity(),
    drawing_box_vertical_extension = 0.5,
    gui_mode = "none",
    allow_copy_paste = true,
    energy_source =
    {
      type = "electric",
      usage_priority = "solar"
    },
    production = "1GW",
    performance_at_day = 1,
    performance_at_night =1,
    solar_coefficient_property = "spacetime-flow-viscosity",
    picture = {
      layers = {
        {
          filename = "__Krastorio2Assets__/buildings/matter-plant/matter-plant.png",
          priority = "high",
          width = 462,
          height = 500,
          shift = { -0.1, -0.2 },
          scale = 0.5,
        },
        {
          filename = "__Krastorio2Assets__/buildings/matter-plant/matter-plant-sh.png",
          priority = "high",
          width = 504,
          height = 444,
          draw_as_shadow = true,
          shift = { 0.23, 0.24 },
          scale = 0.5,
        }
      }
    },
    open_sound = { filename = "__Krastorio2Assets__/sounds/buildings/open.ogg", volume = 1 },
    close_sound = { filename = "__Krastorio2Assets__/sounds/buildings/close.ogg", volume = 1 },
    impact_category = "metal",
  },
  {--solar cell
    type = "solar-panel",
    name = "solar-cell",
    icon = "__base__/graphics/icons/solar-panel.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "solar-cell"},
    max_health = 200,
    corpse = "solar-panel-remnants",
    dying_explosion = "solar-panel-explosion",
    collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    damaged_trigger_effect = hit_effects.entity(),
    energy_source =
    {
      type = "electric",
      usage_priority = "solar"
    },
    picture =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/solar-panel/solar-panel.png",
          priority = "high",
          width = 230,
          height = 224,
          shift = util.by_pixel(-3, 3.5),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/solar-panel/solar-panel-shadow.png",
          priority = "high",
          width = 220,
          height = 180,
          shift = util.by_pixel(9.5, 6),
          draw_as_shadow = true,
          scale = 0.5
        }
      }
    },
    overlay =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/solar-panel/solar-panel-shadow-overlay.png",
          priority = "high",
          width = 214,
          height = 180,
          shift = util.by_pixel(10.5, 6),
          scale = 0.5
        }
      }
    },
    impact_category = "glass",
    production = "0.5MW"
  },
})
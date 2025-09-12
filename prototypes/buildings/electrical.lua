local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")

data:extend({

  {--tiny electric pole
    type = "electric-pole",
    name = "tiny-electric-pole",
    icon = "__base__/graphics/icons/medium-electric-pole.png",
    quality_indicator_scale = 0.75,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "tiny-electric-pole"},
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
    type = "electric-energy-interface",
    name = "proton-decay-thermoelectric-generator",
    icons = {{icon = "__base__/graphics/icons/nuclear-reactor.png", tint = {1, 1, 1, 1}}},
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "proton-decay-thermoelectric-generator"},
    max_health = 150,
    corpse = "nuclear-reactor-remnants",
    dying_explosion = "nuclear-reactor-explosion",
    subgroup = "other",
    collision_box = {{-2.2, -2.2}, {2.2, 2.2}},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    damaged_trigger_effect = hit_effects.entity(),
    drawing_box_vertical_extension = 0.5,
    gui_mode = "none",
    allow_copy_paste = true,
    energy_source =
    {
      type = "electric",
      buffer_capacity = "1GJ",
      usage_priority = "primary-output"
    },
    energy_production = "1GW",
    energy_usage = "0kW",
    -- also 'pictures' for 4-way sprite is available, or 'animation' resp. 'animations'
    picture =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/nuclear-reactor/reactor.png",
          width = 302,
          height = 318,
          scale = 0.5,
          shift = util.by_pixel(-5, -7)
        },
        {
          filename = "__base__/graphics/entity/nuclear-reactor/reactor-shadow.png",
          width = 525,
          height = 323,
          scale = 0.5,
          shift = { 1.625, 0 },
          draw_as_shadow = true
        }
      }
    },
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    impact_category = "metal",
  },
  {
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
local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")
local TFMG = require("__TFMG__.util.TFMG")

---Heat interface connections, again
  --connected
  local HP_NS = {size = 64, filename = "__base__/graphics/entity/heat-pipe/heat-pipe-straight-vertical-1.png", scale = 0.5}
  local HP_EW = {size = 64, filename = "__base__/graphics/entity/heat-pipe/heat-pipe-straight-horizontal-1.png", scale = 0.5}
  --disconnected
  local HP_N = {size = 64, filename = "__base__/graphics/entity/heat-pipe/heat-pipe-ending-down-1.png", scale = 0.5}
  local HP_N_big = {size = 64, filename = "__base__/graphics/entity/heat-pipe/heat-pipe-ending-down-1.png", scale = 0.5,shift = {0,-0.3}}
  local HP_E = {size = 64, filename = "__base__/graphics/entity/heat-pipe/heat-pipe-ending-left-1.png", scale = 0.5}
  local HP_E_big = {size = 64, filename = "__base__/graphics/entity/heat-pipe/heat-pipe-ending-left-1.png", scale = 0.5,shift = {0.3,0}}
  local HP_S = {size = 64, filename = "__base__/graphics/entity/heat-pipe/heat-pipe-ending-up-1.png", scale = 0.5}
  local HP_S_big = {size = 64, filename = "__base__/graphics/entity/heat-pipe/heat-pipe-ending-up-1.png", scale = 0.5,shift = {0,0.3}}
  local HP_W = {size = 64, filename = "__base__/graphics/entity/heat-pipe/heat-pipe-ending-right-1.png", scale = 0.5}
  local HP_W_big = {size = 64, filename = "__base__/graphics/entity/heat-pipe/heat-pipe-ending-right-1.png", scale = 0.5,shift = {-0.3,0}}
  ---Hot Heat interface connections
  --connected
  local HP_NS_Hot = {size = 64, filename = "__base__/graphics/entity/heat-pipe/heated-straight-vertical-1.png", scale = 0.5}
  local HP_EW_Hot = {size = 64, filename = "__base__/graphics/entity/heat-pipe/heated-straight-horizontal-1.png", scale = 0.5}
  --disconnected
  local HP_N_Hot = {size = 64, filename = "__base__/graphics/entity/heat-pipe/heated-ending-down-1.png", scale = 0.5}
  local HP_N_Hot_big = {size = 64, filename = "__base__/graphics/entity/heat-pipe/heated-ending-down-1.png", scale = 0.5,shift = {0,-0.3}}
  local HP_E_Hot = {size = 64, filename = "__base__/graphics/entity/heat-pipe/heated-ending-left-1.png", scale = 0.5}
  local HP_E_Hot_big = {size = 64, filename = "__base__/graphics/entity/heat-pipe/heated-ending-left-1.png", scale = 0.5,shift = {0.3,0}}
  local HP_S_Hot = {size = 64, filename = "__base__/graphics/entity/heat-pipe/heated-ending-up-1.png", scale = 0.5}
  local HP_S_Hot_big = {size = 64, filename = "__base__/graphics/entity/heat-pipe/heated-ending-up-1.png", scale = 0.5,shift = {0,0.3}}
  local HP_W_Hot = {size = 64, filename = "__base__/graphics/entity/heat-pipe/heated-ending-right-1.png", scale = 0.5}
  local HP_W_Hot_big = {size = 64, filename = "__base__/graphics/entity/heat-pipe/heated-ending-right-1.png", scale = 0.5,shift = {-0.3,-0}}


--medium pole
  local medium_pole = data.raw["electric-pole"]["medium-electric-pole"]
  medium_pole.maximum_wire_distance = 13
  medium_pole.supply_area_distance = 6.5

--big pole
  local big_pole = data.raw["electric-pole"]["big-electric-pole"]
  big_pole.maximum_wire_distance = 64
  big_pole.supply_area_distance = 2

--energy monitor (combinator)
  local energy_monitor = table.deepcopy(data.raw["constant-combinator"]["constant-combinator"])
  energy_monitor.name = "energy-monitor-combinator"
  energy_monitor.icon = nil
  energy_monitor.icons = {{
      icon = "__base__/graphics/icons/accumulator.png",
      tint = {1,1,0}
    }}
  energy_monitor.minable = {mining_time = 0.1, result = "energy-monitor"}

--energy monitor generators
  --primary
  local energy_monitor_generator_primary = {
    type = "generator",
    name = "energy-monitor-generator-primary",
    icons = {{
      icon = "__base__/graphics/icons/accumulator.png",
      tint = {1,1,0}
    }},
    flags = {"placeable-neutral","player-creation"},
    selectable_in_game = false,
    hidden = true,
    max_health = 300,
    max_power_output = "60W",
    fluid_usage_per_tick = 1,
    effectivity = 100,
    maximum_temperature = 0,
    burns_fluid = true,
    scale_fluid_usage = true,
    collision_box =  {{-0.5, -0.5}, {0.5, 0.5}},
    selection_box = {{-0.25, -0.25}, {0.25, 0.25}},
    collision_mask = {layers = {},not_colliding_with_itself = true},
    fluid_box =
    {
      volume = 100,
      production_type = "input",
      pipe_connections = {}
    },
    energy_source =
    {
      type = "electric",
      usage_priority = "primary-output",
    },
  }
  --secondary
  local energy_monitor_generator_secondary = table.deepcopy(energy_monitor_generator_primary)
  energy_monitor_generator_secondary.name = "energy-monitor-generator-secondary"
  energy_monitor_generator_secondary.energy_source.usage_priority = "secondary-output"
  --tertiary
  local energy_monitor_generator_tertiary = table.deepcopy(energy_monitor_generator_primary)
  energy_monitor_generator_tertiary.name = "energy-monitor-generator-tertiary"
  energy_monitor_generator_tertiary.energy_source.usage_priority = "tertiary"
---energy monitor consumers
  --primary
  local energy_monitor_consumer_primary = {
    type = "electric-energy-interface",
    name = "energy-monitor-consumer-primary",
    icons = {{
      icon = "__base__/graphics/icons/accumulator.png",
      tint = {1,1,0}
    }},
    energy_source =
    {
      type = "electric",
      usage_priority = "primary-input",
      buffer_capacity = "100J",
    },
    energy_usage = "6000W",
    collision_box =  {{-0.5, -0.5}, {0.5, 0.5}},
    selection_box = {{-0.25, -0.25}, {0.25, 0.25}},
    collision_mask = {layers = {},not_colliding_with_itself = true},
    selectable_in_game = false,
    hidden = true,
  }
  --secondry
  local energy_monitor_consumer_secondary = table.deepcopy(energy_monitor_consumer_primary)
  energy_monitor_consumer_secondary.name = "energy-monitor-consumer-secondary"
  energy_monitor_consumer_secondary.energy_source.usage_priority = "secondary-input"
  --tertiary
  local energy_monitor_consumer_tertiary = table.deepcopy(energy_monitor_consumer_primary)
  energy_monitor_consumer_tertiary.name = "energy-monitor-consumer-tertiary"
  energy_monitor_consumer_tertiary.energy_source.usage_priority = "tertiary"


data:extend({
  energy_monitor,
  energy_monitor_generator_primary,
  energy_monitor_generator_secondary,
  energy_monitor_generator_tertiary,
  energy_monitor_consumer_primary,
  energy_monitor_consumer_secondary,
  energy_monitor_consumer_tertiary,
  
  {--tiny electric pole
    type = "electric-pole",
    name = "small-electric-pole",
    icon = "__base__/graphics/icons/medium-electric-pole.png",
    quality_indicator_scale = 0.75,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "small-electric-pole"},
    max_health = 100,
    corpse = "medium-electric-pole-remnants",
    dying_explosion = "medium-electric-pole-explosion",
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
    supply_area_distance = 1.5,
    rewire_neighbors_when_destroying = false,
    auto_connect_up_to_n_wires = 0,
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
    friendly_map_color = {150,0,150},
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
    production = "250MW",
    performance_at_day = 1,
    performance_at_night =1,
    solar_coefficient_property = "spacetime-flow-viscosity",
    stateless_visualisation = {
      {
        animation = {
          layers = {
            {
              filename = "__Krastorio2Assets__/buildings/matter-plant/matter-plant.png",
              priority = "high",
              width = 462,
              height = 500,
              frame_count = 1,
              shift = { -0.1, -0.2 },
              scale = 0.5,
            },
            {
              filename = "__Krastorio2Assets__/buildings/matter-plant/matter-plant-sh.png",
              priority = "high",
              width = 504,
              height = 444,
              frame_count = 1,
              draw_as_shadow = true,
              shift = { 0.23, 0.24 },
              scale = 0.5,
            },
          },
        },
      },
      {
        draw_as_light = true,
        blend_mode = "additive-soft",
        animation = {
          filename = "__Krastorio2Assets__/buildings/matter-plant/matter-plant-working-light.png",
          priority = "high",
          width = 462,
          height = 500,
          frame_count = 30,
          line_length = 6,
          shift = { -0.1, -0.2 },
          scale = 0.5,
          animation_speed = 0.75,
        },
      },
      {
        draw_as_glow = true,
        blend_mode = "additive-soft",
        synced_fadeout = true,
        animation = {
          filename = "__Krastorio2Assets__/buildings/matter-plant/matter-plant-working-glow.png",
          priority = "high",
          width = 462,
          height = 500,
          frame_count = 30,
          line_length = 6,
          shift = { -0.1, -0.2 },
          scale = 0.5,
          animation_speed = 0.75,
        },
      },
      {
        animation = {
          filename = "__Krastorio2Assets__/buildings/matter-plant/matter-plant-working.png",
          width = 462,
          height = 500,
          frame_count = 30,
          line_length = 6,
          shift = { -0.1, -0.2 },
          scale = 0.5,
          animation_speed = 0.75,
        },
      },
    },
    open_sound = { filename = "__Krastorio2Assets__/sounds/buildings/open.ogg", volume = 1 },
    close_sound = { filename = "__Krastorio2Assets__/sounds/buildings/close.ogg", volume = 1 },
    impact_category = "metal",
  },
  {--solar panel
    type = "solar-panel",
    name = "solar-panel",
    icon = "__base__/graphics/icons/solar-panel.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "solar-panel"},
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
  {--small turbine
    type = "generator",
    name = "small-turbine",
    icon = "__base__/graphics/icons/steam-turbine.png",
    flags = {"placeable-neutral","player-creation"},
    minable = {mining_time = 0.3, result = "small-turbine"},
    max_health = 300,
    corpse = "steam-turbine-remnants",
    dying_explosion = "steam-turbine-explosion",
    alert_icon_shift = util.by_pixel(0, -12),
    effectivity = 1,
    fluid_usage_per_tick = 1,
    maximum_temperature = 500,
    burns_fluid = false,
    resistances =
    {
      {
        type = "fire",
        percent = 70
      }
    },
    collision_box = {{-1.25, -2.35}, {1.25, 2.35}},
    selection_box = {{-1.5, -2.5}, {1.5, 2.5}},
    damaged_trigger_effect = hit_effects.entity(),
    fluid_box =
    {
      volume = 200,
      pipe_covers = pipecoverspictures(),
      pipe_connections =
      {
        { flow_direction = "input-output", direction = defines.direction.south, position = {0, 2} },
        { flow_direction = "input-output", direction = defines.direction.north, position = {0, -2} }
      },
      production_type = "input",
      filter = "steam",
      minimum_temperature = 500.0
    },
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-output"
    },
    horizontal_animation =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/steam-turbine/steam-turbine-H.png",
          width = 320,
          height = 245,
          frame_count = 8,
          line_length = 4,
          shift = util.by_pixel(0, -2.75),
          run_mode = "backward",
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/steam-turbine/steam-turbine-H-shadow.png",
          width = 435,
          height = 150,
          repeat_count = 8,
          line_length = 1,
          draw_as_shadow = true,
          shift = util.by_pixel(28.5, 18),
          run_mode = "backward",
          scale = 0.5
        }
      }
    },
    vertical_animation =
    {
     layers =
     {
        {
          filename = "__base__/graphics/entity/steam-turbine/steam-turbine-V.png",
          width = 217,
          height = 374,
          frame_count = 8,
          line_length = 4,
          shift = util.by_pixel(4.75, 0.0),
          run_mode = "backward",
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/steam-turbine/steam-turbine-V-shadow.png",
          width = 302,
          height = 260,
          repeat_count = 8,
          line_length = 1,
          draw_as_shadow = true,
          shift = util.by_pixel(39.5, 24.5),
          run_mode = "backward",
          scale = 0.5
        }
      }
    },
    smoke =
    {
      {
        name = "turbine-smoke",
        north_position = {0.0, -1.0},
        east_position = {0.75, -0.75},
        frequency = 10 / 32,
        starting_vertical_speed = 0.08,
        starting_frame_deviation = 60
      }
    },
    impact_category = "metal-large",
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/steam-turbine.ogg",
        volume = 0.49,
        modifiers = volume_multiplier("main-menu", 0.7),
        speed_smoothing_window_size = 60,
        advanced_volume_control = {attenuation = "exponential"},
        audible_distance_modifier = 0.8,
      },
      match_speed_to_activity = true,
      max_sounds_per_prototype = 3,
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },
    perceived_performance = {minimum = 0.25, performance_to_activity_rate = 2.0},
    water_reflection =
    {
      pictures =
      {
        filename = "__base__/graphics/entity/steam-turbine/steam-turbine-reflection.png",
        priority = "extra-high",
        width = 40,
        height = 36,
        shift = util.by_pixel(0, 50),
        variation_count = 2,
        repeat_count = 2,
        scale = 5
      },
      rotate = false,
      orientation_to_variation = true
    }
  },
  {--small heat exchanger
    type = "boiler",
    name = "small-heat-exchanger",
    icon = "__base__/graphics/icons/heat-boiler.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "small-heat-exchanger"},
    max_health = 200,
    corpse = "heat-exchanger-remnants",
    dying_explosion = "heat-exchanger-explosion",
    impact_category = "metal",
    mode = "output-to-separate-pipe",
    resistances =
    {},
    collision_box = {{-1.29, -0.79}, {1.29, 0.79}},
    selection_box = {{-1.5, -1}, {1.5, 1}},
    damaged_trigger_effect = hit_effects.entity(),
    target_temperature = 500,
    fluid_box =
    {
      volume = 200,
      pipe_covers = pipecoverspictures(),
      pipe_connections =
      {
        {flow_direction = "input-output", direction = defines.direction.west, position = {-1, 0.5}},
        {flow_direction = "input-output", direction = defines.direction.east, position = {1, 0.5}}
      },
      production_type = "input",
      filter = "water"
    },
    output_fluid_box =
    {
      volume  = 200,
      pipe_covers = pipecoverspictures(),
      pipe_connections =
      {
        {flow_direction = "output", direction = defines.direction.north, position = {0, -0.5}}
      },
      production_type = "output",
      filter = "steam"
    },
    energy_consumption = "10MW",
    energy_source =
    {
      type = "heat",
      max_temperature = 1000,
      specific_heat = "1MJ",
      max_transfer = "2GW",
      min_working_temperature = 500,
      minimum_glow_temperature = 350,
      connections =
      {
        {
          position = {0, 0.5},
          direction = defines.direction.south
        }
      },
      pipe_covers =
        make_4way_animation_from_spritesheet(
        {
          filename = "__base__/graphics/entity/heat-exchanger/heatex-endings.png",
          width = 64,
          height = 64,
          direction_count = 4,
          scale = 0.5
        }),
      heat_pipe_covers =
        make_4way_animation_from_spritesheet(
        apply_heat_pipe_glow{
          filename = "__base__/graphics/entity/heat-exchanger/heatex-endings-heated.png",
          width = 64,
          height = 64,
          direction_count = 4,
          scale = 0.5
        }),
      heat_picture =
      {
        north = apply_heat_pipe_glow
        {
          filename = "__base__/graphics/entity/heat-exchanger/heatex-N-heated.png",
          priority = "extra-high",
          width = 44,
          height = 96,
          shift = util.by_pixel(-0.5, 8.5),
          scale = 0.5
        },
        east = apply_heat_pipe_glow
        {
          filename = "__base__/graphics/entity/heat-exchanger/heatex-E-heated.png",
          priority = "extra-high",
          width = 80,
          height = 80,
          shift = util.by_pixel(-21, -13),
          scale = 0.5
        },
        south = apply_heat_pipe_glow
        {
          filename = "__base__/graphics/entity/heat-exchanger/heatex-S-heated.png",
          priority = "extra-high",
          width = 28,
          height = 40,
          shift = util.by_pixel(-1, -30),
          scale = 0.5
        },
        west = apply_heat_pipe_glow
        {
          filename = "__base__/graphics/entity/heat-exchanger/heatex-W-heated.png",
          priority = "extra-high",
          width = 64,
          height = 76,
          shift = util.by_pixel(23, -13),
          scale = 0.5
        }
      }
    },
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/heat-exchanger.ogg",
        volume = 0.65,
        modifiers = volume_multiplier("main-menu", 0.7),
        audible_distance_modifier = 0.5,
      },
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },
    open_sound = sounds.steam_open,
    close_sound = sounds.steam_close,

    pictures =
    {
      north =
      {
        structure =
        {
          layers =
          {
            {
              filename = "__base__/graphics/entity/heat-exchanger/heatex-N-idle.png",
              priority = "extra-high",
              width = 269,
              height = 221,
              shift = util.by_pixel(-1.25, 5.25),
              scale = 0.5
            },
            {
              filename = "__base__/graphics/entity/boiler/boiler-N-shadow.png",
              priority = "extra-high",
              width = 274,
              height = 164,
              scale = 0.5,
              shift = util.by_pixel(20.5, 9),
              draw_as_shadow = true
            }
          }
        }
      },
      east =
      {
        structure =
        {
          layers =
          {
            {
              filename = "__base__/graphics/entity/heat-exchanger/heatex-E-idle.png",
              priority = "extra-high",
              width = 211,
              height = 301,
              shift = util.by_pixel(-1.75, 1.25),
              scale = 0.5
            },
            {
              filename = "__base__/graphics/entity/boiler/boiler-E-shadow.png",
              priority = "extra-high",
              width = 184,
              height = 194,
              scale = 0.5,
              shift = util.by_pixel(30, 9.5),
              draw_as_shadow = true
            }
          }
        }
      },
      south =
      {
        structure =
        {
          layers =
          {
            {
              filename = "__base__/graphics/entity/heat-exchanger/heatex-S-idle.png",
              priority = "extra-high",
              width = 260,
              height = 201,
              shift = util.by_pixel(4, 10.75),
              scale = 0.5
            },
            {
              filename = "__base__/graphics/entity/boiler/boiler-S-shadow.png",
              priority = "extra-high",
              width = 311,
              height = 131,
              scale = 0.5,
              shift = util.by_pixel(29.75, 15.75),
              draw_as_shadow = true
            }
          }
        }
      },
      west =
      {
        structure =
        {
          layers =
          {
            {
              filename = "__base__/graphics/entity/heat-exchanger/heatex-W-idle.png",
              priority = "extra-high",
              width = 196,
              height = 273,
              shift = util.by_pixel(1.5, 7.75),
              scale = 0.5
            },
            {
              filename = "__base__/graphics/entity/boiler/boiler-W-shadow.png",
              priority = "extra-high",
              width = 206,
              height = 218,
              scale = 0.5,
              shift = util.by_pixel(19.5, 6.5),
              draw_as_shadow = true
            }
          }
        }
      },
    },
    burning_cooldown = 20,
    water_reflection = boiler_reflection()
  },
  {--chemical reactor
    type = "reactor",
    name = "chemical-reactor",
    icon  = "__base__/graphics/icons/nuclear-reactor.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.5, result = "chemical-reactor"},
    max_health = 500,
    corpse = "nuclear-reactor-remnants",
    surface_conditions = TFMG.conditions.oxygen,
    dying_explosion = "nuclear-reactor-explosion",
    {
      {
        property = "pressure",
        min = 1,
      }
    },
    consumption = "20MW",
    neighbour_bonus = 0.5,
    energy_source =
    {
      type = "fluid",
      effectivity = 0.5,
      burns_fluid = true,
      scale_fluid_usage = true,
      destroy_non_fuel_fluid = false,
      fluid_box = {
        pipe_covers = pipecoverspictures(),
        volume = 200,
        pipe_connections = {
          { flow_direction = "input-output", direction = defines.direction.east, position = { 2, 0 } },
          { flow_direction = "input-output", direction = defines.direction.west, position = { -2, 0 } },
          { flow_direction = "input-output", direction = defines.direction.south, position = { 0, 2 } },
          { flow_direction = "input-output", direction = defines.direction.north, position = { 0, -2 } },
        },
        production_type = "input-output",
      },
    },
    collision_box = {{-2.2, -2.2}, {2.2, 2.2}},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    damaged_trigger_effect = hit_effects.entity(),
    picture = {
      layers = {
        {
          filename = "__Krastorio2Assets__/buildings/gas-power-station/gas-power-station.png",
          width = 380,
          height = 380,
          scale = 0.5,
          frame_count = 32,
          line_length = 8,
          animation_speed = 1.2,
          shift = { 0, 0 },
        },
        {
          filename = "__Krastorio2Assets__/buildings/pipe-patch/pipe-patch.png",
          width = 55,
          height = 50,
          frame_count = 1,
          repeat_count = 32,
          scale = 0.5,
          shift = { 0, 2.5 },
        },
        {
          filename = "__Krastorio2Assets__/buildings/gas-power-station/gas-power-station-sh.png",
          width = 380,
          height = 380,
          scale = 0.5,
          frame_count = 1,
          repeat_count = 32,
          animation_speed = 1.2,
          draw_as_shadow = true,
          shift = { 0, 0 },
        },
      },
    },
    heat_buffer =
    {
      max_temperature = 750,
      specific_heat = "10MJ",
      max_transfer = "10GW",
      minimum_glow_temperature = 350,
      connections =
      {
        { position = {-1, -2}, direction = defines.direction.north },
        { position = {1, -2}, direction = defines.direction.north },
        { position = {2, -1}, direction = defines.direction.east },
        { position = {2, 1}, direction = defines.direction.east },
        { position = {1, 2}, direction = defines.direction.south },
        { position = {-1, 2}, direction = defines.direction.south },
        { position = {-2, 1}, direction = defines.direction.west },
        { position = {-2, -1}, direction = defines.direction.west }
      },
    },
    connection_patches_connected = {
      HP_NS,HP_NS,
      HP_EW,HP_EW,
      HP_NS,HP_NS,
      HP_EW,HP_EW,
      },
    connection_patches_disconnected = {
      HP_N_big,HP_N_big,
      HP_E_big,HP_E_big,
      HP_S_big,HP_S_big,
      HP_W_big,HP_W_big,
      },
    heat_connection_patches_connected ={
      HP_NS_Hot,HP_NS_Hot,
      HP_EW_Hot,HP_EW_Hot,
      HP_NS_Hot,HP_NS_Hot,
      HP_EW_Hot,HP_EW_Hot,
      },
    heat_connection_patches_disconnected ={
      HP_N_Hot_big,HP_N_Hot_big,
      HP_E_Hot_big,HP_E_Hot_big,
      HP_S_Hot_big,HP_S_Hot_big,
      HP_W_Hot_big,HP_W_Hot_big,
    },
    impact_category = "metal-large",
    open_sound = {filename = "__base__/sound/open-close/nuclear-open.ogg", volume = 0.8},
    close_sound = {filename = "__base__/sound/open-close/nuclear-close.ogg", volume = 0.8},
    working_sound = {
      sound = {
        variations = {
          {
            filename = "__Krastorio2Assets__/sounds/buildings/gas-power-station-1.ogg",
            volume = 0.5,
          },
          {
            filename = "__Krastorio2Assets__/sounds/buildings/gas-power-station-2.ogg",
            volume = 0.4,
          },
        },
        aggregation = {
          max_count = 3,
          remove = false,
          count_already_playing = true,
        },
      },
      match_speed_to_activity = true,
      max_sounds_per_prototype = 3,
      fade_in_ticks = 10,
      fade_out_ticks = 30,
    },
    default_temperature_signal = {type = "virtual", name = "signal-T"},
    circuit_wire_max_distance = reactor_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions["nuclear-reactor"],
  },
---Charger discharger
  {--Charger
    type = "furnace",
    name = "charger",
    icon = "__Krastorio2Assets__/icons/entities/singularity-beacon.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = "charger"},
    circuit_wire_max_distance = furnace_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions["electric-furnace"],
    max_health = 350,
    corpse = "electric-furnace-remnants",
    dying_explosion = "electric-furnace-explosion",
    resistances =
    {
      {
        type = "fire",
        percent = 80
      }
    },
    collision_box = { { -0.75, -0.75 }, { 0.75, 0.75 } },
    selection_box = { { -0.9, -0.9 }, { 0.9, 0.9 } },
    damaged_trigger_effect = hit_effects.entity(),
    icon_draw_specification = {shift = {0, -0.1}},
    icons_positioning =
    {
      {inventory_index = defines.inventory.crafter_modules, shift = {0, 0.8}}
    },
    crafting_categories = {"charger"},
    result_inventory_size = 1,
    crafting_speed = 1,
    energy_usage = "10MW",
    passive_energy_usage = "0MW",
    --quality_affects_energy_usage = true,
    source_inventory_size = 1,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = { pollution = 1 }
    },
    impact_category = "metal",
    open_sound = { filename = "__Krastorio2Assets__/sounds/buildings/open.ogg", volume = 1 },
    close_sound = { filename = "__Krastorio2Assets__/sounds/buildings/close.ogg", volume = 1 },
    working_sound = {
      sound = {
        filename = "__Krastorio2Assets__/sounds/buildings/tesla-coil.ogg",
        volume = 0.5,
        aggregation = {
          max_count = 2,
          remove = false,
          count_already_playing = true,
        },
      },
      persistent = false,
    },
    graphics_set = {
      animation = {
        layers =
        {
          {
            filename = "__Krastorio2Assets__/buildings/singularity-beacon/singularity-beacon.png",
            width = 360,
            height = 360,
            shift = util.by_pixel(0, -5),
            scale = 0.25,
          },
        },
      },
      working_visualisations =
      {
        {
          fadeout = true,
          animation =
          {
            layers = {
            {
              filename = "__Krastorio2Assets__/buildings/singularity-beacon/singularity-beacon-w-light.png",
              width = 190,
              height = 214,
              frame_count = 10,
              line_length = 5,
              shift = util.by_pixel(0, -11.5),
              draw_as_light = true,
              flags = { "light" },
              scale = 0.25,
              animation_speed = 0.5,
            },
            {
              filename = "__Krastorio2Assets__/buildings/singularity-beacon/singularity-beacon-w.png",
              width = 190,
              height = 214,
              frame_count = 10,
              line_length = 5,
              shift = util.by_pixel(0, -11.5),
              scale = 0.25,
              animation_speed = 0.5,
            },
          },
          },
        },
      },
      water_reflection = {
        pictures = {
          filename = "__Krastorio2Assets__/buildings/singularity-beacon/singularity-beacon-reflection.png",
          priority = "extra-high",
          width = 20,
          height = 25,
          shift = util.by_pixel(0, 40),
          variation_count = 1,
          scale = 5,
        },
        rotate = false,
        orientation_to_variation = false,
      },
    },
  },
  {--discharger
    type = "burner-generator",
    name = "discharger",
    icon = "__Krastorio2Assets__/icons/entities/tesla-coil.png",
    collision_box = { { -1.25, -1.25 }, { 1.25, 1.25 } },
    selection_box = { { -1.45, -1.45 }, { 1.45, 1.45 } },
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = { mining_time = 0.2, result = "discharger" },
    drawing_box_vertical_extension = 1,
    energy_source = {
      type = "electric",
      usage_priority = "secondary-output",
    },
    burner = {
      type = "burner",
      fuel_inventory_size = 1,
      burnt_inventory_size = 1,
      effectivity = 1,
      fuel_categories = {"electric"}
    },
    max_power_output = "20MW",
    max_health = 200,
    damaged_trigger_effect = hit_effects.entity(),
    resistances = {
      { type = "fire", percent = 60 },
    },
    vehicle_impact_sound = sounds.generic_impact,
    working_sound = {
      sound = {
        filename = "__Krastorio2Assets__/sounds/buildings/tesla-coil.ogg",
        volume = 0.5,
        aggregation = {
          max_count = 2,
          remove = false,
          count_already_playing = true,
        },
      },
      persistent = false,
    },
    animation = {
      layers = {
        {
          filename = "__Krastorio2Assets__/buildings/tesla-coil/tesla-coil-animation-light.png",
          priority = "high",
          width = 194,
          height = 232,
          scale = 0.5,
          frame_count = 60,
          line_length = 10,
          animation_speed = 1,
          run_mode = "forward",
          shift = { 0, -0.75 },
          draw_as_light = true,
          blend_mode = "additive-soft",
        },
        {
          filename = "__Krastorio2Assets__/buildings/tesla-coil/tesla-coil-base.png",
          priority = "high",
          width = 194,
          height = 232,
          scale = 0.5,
          repeat_count = 60,
          run_mode = "forward",
          shift = { 0, -0.75 },
        },
        {
          filename = "__Krastorio2Assets__/buildings/tesla-coil/tesla-coil-animation.png",
          priority = "high",
          width = 194,
          height = 232,
          scale = 0.5,
          frame_count = 60,
          line_length = 10,
          run_mode = "forward",
          shift = { 0, -0.75 },
        },
        {
          filename = "__Krastorio2Assets__/buildings/tesla-coil/tesla-coil-shadow.png",
          priority = "medium",
          width = 250,
          height = 150,
          scale = 0.5,
          repeat_count = 60,
          frame_count = 1,
          shift = { 0.37, -0.01 },
          draw_as_shadow = true,
        },
      },
    },
  },
})
local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")

data:extend({
  {--matter reconstructor
    type = "assembling-machine",
    name = "matter-reconstructor",
    icon = "__base__/graphics/icons/assembling-machine-1.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = "matter-reconstructor"},
    max_health = 300,
    corpse = "assembling-machine-1-remnants",
    dying_explosion = "assembling-machine-1-remnants",
    icon_draw_specification = {shift = {0, -0.3}},
    resistances =
    {
      {
        type = "fire",
        percent = 70
      }
    },
    collision_box = {{-0.7, -0.7}, {0.7, 0.7}},
    selection_box = {{-1, -1}, {1, 1}},
    damaged_trigger_effect = hit_effects.entity(),
    circuit_wire_max_distance = assembling_machine_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions["assembling-machine"],
    alert_icon_shift = util.by_pixel(0, -12),
    graphics_set =
    {
      animation =
      {
        layers =
        {
          {
            filename = "__base__/graphics/entity/assembling-machine-1/assembling-machine-1.png",
            priority="high",
            width = 214,
            height = 226,
            frame_count = 32,
            line_length = 8,
            shift = util.by_pixel(0, 2),
            scale = 0.35
          },
          {
            filename = "__base__/graphics/entity/assembling-machine-1/assembling-machine-1-shadow.png",
            priority="high",
            width = 190,
            height = 165,
            line_length = 1,
            repeat_count = 32,
            draw_as_shadow = true,
            shift = util.by_pixel(8.5, 5),
            scale = 0.35
          }
        }
      }
    },
    crafting_categories = {
      "matter-reconstructor",
      "basic-assembling"
    },
    crafting_speed = 10,
    energy_source =
    {
      type = "electric",
    usage_priority = "secondary-input",
    emissions_per_minute = { pollution = 4 }
    },
    energy_usage = "100kW",
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    module_slots = 0,
    allowed_effects = { "consumption", "speed", "productivity", "pollution" , "quality"},
    impact_category = "metal",
    working_sound =
    {
      sound = {filename = "__base__/sound/assembling-machine-t1-1.ogg", volume = 0.5, audible_distance_modifier = 0.5},
      fade_in_ticks = 4,
      fade_out_ticks = 20
    }
  },
  {--Assembling machine
    type = "assembling-machine",
    name = "assembling-machine",
    icon = "__base__/graphics/icons/assembling-machine-3.png",
    flags = {"placeable-neutral","placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = "assembling-machine"},
    max_health = 400,
    corpse = "assembling-machine-3-remnants",
    dying_explosion = "assembling-machine-3-explosion",
    icon_draw_specification = {shift = {0, -0.3}},
    circuit_wire_max_distance = assembling_machine_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions["assembling-machine"],
    alert_icon_shift = util.by_pixel(0, -12),
    created_effect = {
      type = "direct",
        action_delivery = {
          type = "instant",
          source_effects = {
            type = "script",
            effect_id = "create-heat-assembling-machine"
        }
      }
    },
    resistances =
    {
      {
        type = "fire",
        percent = 70
      }
    },
    fluid_boxes =
    {
      {
        production_type = "input",
        pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections = {{ flow_direction="input", direction = defines.direction.north, position = {0, -1} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "output",
        pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections = {{ flow_direction="output", direction = defines.direction.south, position = {0, 1} }},
        secondary_draw_orders = { north = -1 }
      }
    },
    fluid_boxes_off_when_no_fluid_recipe = true,
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    impact_category = "metal",
    working_sound =
    {
      sound = {filename = "__base__/sound/assembling-machine-t3-1.ogg", volume = 0.45, audible_distance_modifier = 0.5},
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    damaged_trigger_effect = hit_effects.entity(),
    drawing_box_vertical_extension = 0.2,
    fast_replaceable_group = "assembling-machine",
    graphics_set =
    {
      animation_progress = 0.5,
      animation =
      {
        layers =
        {
          {
            filename = "__base__/graphics/entity/assembling-machine-3/assembling-machine-3.png",
            priority = "high",
            width = 214,
            height = 237,
            frame_count = 32,
            line_length = 8,
            shift = util.by_pixel(0, -0.75),
            scale = 0.5
          },
          {
            filename = "__base__/graphics/entity/assembling-machine-3/assembling-machine-3-shadow.png",
            priority = "high",
            width = 260,
            height = 162,
            frame_count = 32,
            line_length = 8,
            draw_as_shadow = true,
            shift = util.by_pixel(28, 4),
            scale = 0.5
          }
        }
      }
    },

    crafting_categories = {
      "basic-assembling"
    },
    crafting_speed = 1,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = { pollution = 2 },
    },
    energy_usage = "100kW",
    module_slots = 2,
    allowed_effects = {"consumption", "speed", "productivity", "pollution", "quality"},
  },
  {
    type = "reactor",
    name = "assembling-machine-heat-interface",
    icon  = "__space-age__/graphics/icons/heating-tower.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.5, result = "heating-tower"},
    max_health = 500,
    corpse = "heating-tower-remnants",
    dying_explosion = "heating-tower-explosion",
    surface_conditions =
    {
      {
        property = "pressure",
        max = 0,
        min = 0,
      }
    },
    consumption = "40MW",
    neighbour_bonus = 0,
    energy_source =
    {
      type = "void",
    },
    collision_box = {{-1.25, -1.25}, {1.25, 1.25}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    damaged_trigger_effect = hit_effects.entity(),
    drawing_box_vertical_extension = 1,

    picture =
    {
      layers =
      {
        util.sprite_load("__space-age__/graphics/entity/heating-tower/heating-tower-main", {
         scale = 0.5
        }),
        util.sprite_load("__space-age__/graphics/entity/heating-tower/heating-tower-shadow", {
          scale = 0.5,
          draw_as_shadow = true
        })
      }
    },

    working_light_picture =
    {
      layers = {
        util.sprite_load("__space-age__/graphics/entity/heating-tower/heating-tower-working-fire", {
          frame_count = 24,
          scale = 0.5,
          blend_mode = "additive",
          draw_as_glow = true,
          animation_speed = 0.333
        }),
        util.sprite_load("__space-age__/graphics/entity/heating-tower/heating-tower-working-light", {
          frame_count = 1,
          repeat_count = 24,
          scale = 0.5,
          blend_mode = "additive",
          draw_as_glow = true
        })
      }
    },

    heat_buffer =
    {
      max_temperature = 1000,
      specific_heat = "5MJ",
      max_transfer = "10GW",
      minimum_glow_temperature = 50,
      connections =
      {
        {
          position = {0, -1},
          direction = defines.direction.north
        },
        {
          position = {1, 0},
          direction = defines.direction.east
        },
        {
          position = {0, 1},
          direction = defines.direction.south
        },
        {
          position = {-1, 0},
          direction = defines.direction.west
        },
      },

    heat_picture = apply_heat_pipe_glow(
      util.sprite_load("__space-age__/graphics/entity/heating-tower/heating-tower-glow", {
        scale = 0.5,
        blend_mode = "additive"
      }))
    },

    connection_patches_connected =
    {
      sheet = util.sprite_load("__space-age__/graphics/entity/heating-tower/heating-tower-pipes", {
        scale = 0.5,
        variation_count = 4
      })
    },

    connection_patches_disconnected =
    {
      sheet = util.sprite_load("__space-age__/graphics/entity/heating-tower/heating-tower-pipes-disconnected", {
        scale = 0.5,
        variation_count = 4
      })
    },

    heat_connection_patches_connected =
    {
      sheet = apply_heat_pipe_glow(
        util.sprite_load("__space-age__/graphics/entity/heating-tower/heating-tower-pipes-heat", {
        scale = 0.5,
        variation_count = 4
      }))
    },

    heat_connection_patches_disconnected =
    {
      sheet = apply_heat_pipe_glow(
        util.sprite_load("__space-age__/graphics/entity/heating-tower/heating-tower-pipes-heat-disconnected", {
        scale = 0.5,
        variation_count = 4
      }))
    },

    open_sound = sounds.steam_open,
    close_sound = sounds.steam_close,
    working_sound =
    {
      sound = {filename = "__space-age__/sound/entity//heating-tower/heating-tower-loop.ogg", volume = 0.5},
      max_sounds_per_prototype = 2,
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },

    default_temperature_signal = {type = "virtual", name = "signal-T"},
    circuit_wire_max_distance = reactor_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions["heating-tower"]
  },
})
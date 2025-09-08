local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")

data:extend({
  {--matter reconstructor
    type = "assembling-machine",
    name = "matter-reconstructor",
    icon = "__base__/graphics/icons/assembling-machine-1.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = "matter-reconstructor"},
    max_health = 1000,
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
    emissions_per_minute = { pollution = 1 }
    },
    energy_usage = "500kW",
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
    custom_tooltip_fields = {
      {
      name = {"thermal-system.max-temperature"},
      value = {"thermal-system.assembling-machine-max-temperature"},
      order = 254,
      },
      {
      name = {"thermal-system.damage-temperature"},
      value = {"thermal-system.assembling-machine-damage-temperature"},
      order = 254,
      },
      {
      name = {"thermal-system.efficiency"},
      value = {"thermal-system.assembling-machine-efficiency"},
      order = 255,
      },
    },
    flags = {"placeable-neutral","placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = "assembling-machine"},
    max_health = 400,
    corpse = "assembling-machine-3-remnants",
    dying_explosion = "assembling-machine-3-explosion",
    icon_draw_specification = {shift = {0, -0.3}},
    circuit_wire_max_distance = assembling_machine_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions["assembling-machine"],
    alert_icon_shift = util.by_pixel(0, -12),
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
    selection_box = {{-1.4, -1.4}, {1.4, 1.4}},
    damaged_trigger_effect = hit_effects.entity(),
    drawing_box_vertical_extension = 0.2,
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
      "basic-assembling","assembling-machine"
    },
    crafting_speed = 1,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = { pollution = 2 },
    },
    energy_usage = "1000kW",
    module_slots = 2,
    allowed_effects = {"consumption", "speed", "productivity", "pollution", "quality"},
  },
  {--assembling machine heat interface
    type = "reactor",
    name = "assembling-machine-heat-interface",
    icon  = "__space-age__/graphics/icons/heating-tower.png",
    flags = {"placeable-neutral", "player-creation","not-on-map","not-blueprintable","not-deconstructable","no-automated-item-insertion","no-automated-item-removal"},
    max_health = 250,
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
    tile_height = 1,
    tile_width = 1,
    collision_mask = {layers ={}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    selection_priority = 40,
    damaged_trigger_effect = hit_effects.entity(),
    drawing_box_vertical_extension = 1,
    --selectable_in_game = false,
    allow_copy_paste = false,
    gui_mode = "none",
    consumption = "1MW",
    neighbour_bonus = 0,
    energy_source =
    {
      type = "void",
    },
    heat_buffer =
    {
      max_temperature = 450,--200 degrees above max.
      minimum_glow_temperature = 50,
      specific_heat = "1MJ",
      max_transfer = "10GW",
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
    default_temperature_signal = {type = "virtual", name = "signal-T"},
    circuit_wire_max_distance = reactor_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions["heating-tower"]
  },
  {--furnace
    type = "furnace",
    name = "furnace",
    icon = "__base__/graphics/icons/electric-furnace.png",
    custom_tooltip_fields = {
      {
      name = {"thermal-system.max-temperature"},
      value = {"thermal-system.furnace-max-temperature"},
      order = 254,
      },
      {
      name = {"thermal-system.efficiency"},
      value = {"thermal-system.furnace-efficiency"},
      order = 255,
      },
    },
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = "furnace"},
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
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.4, -1.4}, {1.4, 1.4}},
    damaged_trigger_effect = hit_effects.entity(),
    module_slots = 2,
    icon_draw_specification = {shift = {0, -0.1}},
    icons_positioning =
    {
      {inventory_index = defines.inventory.furnace_modules, shift = {0, 0.8}}
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution", "quality"},
    crafting_categories = {"furnace"},
    result_inventory_size = 1,
    crafting_speed = 1,
    energy_usage = "2500kW",
    source_inventory_size = 1,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = { pollution = 1 }
    },
    impact_category = "metal",
    open_sound = sounds.electric_large_open,
    close_sound = sounds.electric_large_close,
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/electric-furnace.ogg",
        volume = 0.85,
        modifiers = volume_multiplier("main-menu", 4.2),
        advanced_volume_control = {attenuation = "exponential"},
        audible_distance_modifier = 0.7,
      },
      max_sounds_per_prototype = 4,
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },
    graphics_set =
    {
      animation =
      {
        layers =
        {
          {
            filename = "__base__/graphics/entity/electric-furnace/electric-furnace.png",
            priority = "high",
            width = 239,
            height = 219,
            shift = util.by_pixel(0.75, 5.75),
            scale = 0.5
          },
          {
            filename = "__base__/graphics/entity/electric-furnace/electric-furnace-shadow.png",
            priority = "high",
            width = 227,
            height = 171,
            draw_as_shadow = true,
            shift = util.by_pixel(11.25, 7.75),
            scale = 0.5
          }
        }
      },
      working_visualisations =
      {
        {
          fadeout = true,
          animation =
          {
            layers =
            {
              {
                filename = "__base__/graphics/entity/electric-furnace/electric-furnace-heater.png",
                priority = "high",
                width = 60,
                height = 56,
                frame_count = 12,
                animation_speed = 0.5,
                draw_as_glow = true,
                shift = util.by_pixel(1.75, 32.75),
                scale = 0.5
              },
              {
                filename = "__base__/graphics/entity/electric-furnace/electric-furnace-light.png",
                blend_mode = "additive",
                width = 202,
                height = 202,
                repeat_count = 12,
                draw_as_glow = true,
                shift = util.by_pixel(1, 0),
                scale = 0.5,
              },
            }
          },
        },
        {
          fadeout = true,
          animation =
          {
            filename = "__base__/graphics/entity/electric-furnace/electric-furnace-ground-light.png",
            blend_mode = "additive",
            width = 166,
            height = 124,
            draw_as_light = true,
            shift = util.by_pixel(3, 69),
            scale = 0.5,
          },
        },
        {
          animation =
          {
            filename = "__base__/graphics/entity/electric-furnace/electric-furnace-propeller-1.png",
            priority = "high",
            width = 37,
            height = 25,
            frame_count = 4,
            animation_speed = 0.5,
            shift = util.by_pixel(-20.5, -18.5),
            scale = 0.5
          }
        },
        {
          animation =
          {
            filename = "__base__/graphics/entity/electric-furnace/electric-furnace-propeller-2.png",
            priority = "high",
            width = 23,
            height = 15,
            frame_count = 4,
            animation_speed = 0.5,
            shift = util.by_pixel(3.5, -38),
            scale = 0.5
          }
        }
      },
      water_reflection =
      {
        pictures =
        {
          filename = "__base__/graphics/entity/electric-furnace/electric-furnace-reflection.png",
          priority = "extra-high",
          width = 24,
          height = 24,
          shift = util.by_pixel(5, 40),
          variation_count = 1,
          scale = 5
        },
        rotate = false,
        orientation_to_variation = false
      }
    }
  },
  {--furnace heat interface
    type = "reactor",
    name = "furnace-heat-interface",
    icon  = "__space-age__/graphics/icons/heating-tower.png",
    flags = {"placeable-neutral", "player-creation","not-on-map","not-blueprintable","not-deconstructable","no-automated-item-insertion","no-automated-item-removal"},
    max_health = 250,
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
    tile_height = 1,
    tile_width = 1,
    collision_mask = {layers ={}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    selection_priority = 40,
    damaged_trigger_effect = hit_effects.entity(),
    drawing_box_vertical_extension = 1,
    --selectable_in_game = false,
    allow_copy_paste = false,
    gui_mode = "none",
    consumption = "1MW",
    neighbour_bonus = 0,
    energy_source =
    {
      type = "void",
    },
    heat_buffer =
    {
      max_temperature = 600,--200 degrees above max temperature.
      minimum_glow_temperature = 150,
      specific_heat = "1MJ",
      max_transfer = "10GW",
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
    default_temperature_signal = {type = "virtual", name = "signal-T"},
    circuit_wire_max_distance = reactor_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions["heating-tower"]
  },
})
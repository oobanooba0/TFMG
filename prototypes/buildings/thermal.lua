local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")

---Heat interface connections
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

data:extend({
  {--heat monitor
    type = "reactor",
    name = "heat-monitor",
    icon  = "__base__/graphics/icons/heat-interface.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.5, result = "heat-monitor"},
    max_health = 500,
    corpse = "nuclear-reactor-remnants",
    dying_explosion = "nuclear-reactor-explosion",
    {
      {
        property = "pressure",
        min = 1,
      }
    },
    consumption = "1W",
    neighbour_bonus = 0,
    energy_source =
    {
      type = "burner",
      fuel_inventory_size = 0,
      render_no_power_icon = false,
      fuel_categories = {"nothing"}
    },
    collision_box = {{-0.3, -0.3}, {0.3, 0.3}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    damaged_trigger_effect = hit_effects.entity(),
    picture =
    {
      filename = "__base__/graphics/icons/heat-interface.png",
      height = 64,
      width = 64,
      scale = 0.5,
      flags = {"no-crop"}
    },
    heat_buffer =
    {
      max_temperature = 1000,
      specific_heat = "1MJ",
      max_transfer = "1GW",
      minimum_glow_temperature = 350,
      connections =
      {
        { position = {0, 0}, direction = defines.direction.north },
        { position = {0, 0}, direction = defines.direction.east },
        { position = {0, 0}, direction = defines.direction.south },
        { position = {0, 0}, direction = defines.direction.west },
      },
    },
    connection_patches_connected = {HP_NS,HP_EW,HP_NS,HP_EW},
    connection_patches_disconnected = {HP_N_big,HP_E_big,HP_S_big,HP_W_big,},
    heat_connection_patches_connected ={HP_NS_Hot,HP_EW_Hot,HP_NS_Hot,HP_EW_Hot,},
    heat_connection_patches_disconnected ={HP_N_Hot_big,HP_E_Hot_big,HP_S_Hot_big,HP_W_Hot_big,},
    impact_category = "metal-large",
    open_sound = {filename = "__base__/sound/open-close/nuclear-open.ogg", volume = 0.8},
    close_sound = {filename = "__base__/sound/open-close/nuclear-close.ogg", volume = 0.8},
    default_temperature_signal = {type = "virtual", name = "signal-T"},
    circuit_wire_max_distance = reactor_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions["chest"],
  },
  {--small radiator
    type = "assembling-machine",
    name = "small-radiator",
    icon = "__TFMG-assets-0__/buildings/small-radiator/panel_icon.png",
    flags = {"placeable-neutral","player-creation","filter-directions"},
    minable = {mining_time = 0.2, result = "small-radiator"},
    max_health = 400,
    corpse = "offshore-pump-remnants",
    dying_explosion = "offshore-pump-explosion",
    circuit_wire_max_distance = assembling_machine_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions["assembling-machine"],
    collision_box = {{-0.9, -4.2}, {0.9, 0.3}},
    selection_box = {{-1, -4.5}, {1, 0.5}},
    tile_height = 1,
    tile_width = 1,
    tile_buildability_rules =
    {
      {area = {{-0.9, -4.4}, {0.9, 0.4}}, required_tiles = {layers = {empty_space = true}}, remove_on_collision = true},
      {area = {{-0.4, 0.6}, {0.4, 0.9}}, required_tiles = {layers = {ground_tile = true}}, colliding_tiles = {layers = {empty_space = true}}, remove_on_collision = true},
    },
    surface_conditions =
    {
      {
        property = "pressure",
        min = 0,
        max = 0
      }
    },
    collision_mask = {layers={is_object = true, is_lower_object = true, transport_belt = true, platform = true}},
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    impact_category = "metal",
    working_sound =
    {
      sound = {filename = "__base__/sound/nuclear-reactor-1.ogg", volume = 0.45, audible_distance_modifier = 0.5},
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },
    damaged_trigger_effect = hit_effects.entity(),
    graphics_set =--solarcore
    {
      animation =
      {
        north =
        {
          layers =
          {
            {
              filename = "__TFMG-assets-0__/buildings/small-radiator/panel_north.png",
              priority = "high",
              line_length = 1,
              frame_count = 1,
              animation_speed = 0.25,
              width = 480,
              height = 960,
              shift = util.by_pixel(0, -56),
              scale = 0.15
            }
          }
        },
        east =
        {
          layers =
          {
            {
              filename = "__TFMG-assets-0__/buildings/small-radiator/panel_east.png",
              priority = "high",
              line_length = 1,
              frame_count = 1,
              animation_speed = 0.25,
              width = 960,
              height = 480,
              shift = util.by_pixel(56, 0),
              scale = 0.15
            }
          }
        },
        south =
        {
          layers =
          {
            {
              filename = "__TFMG-assets-0__/buildings/small-radiator/panel_south.png",
              priority = "high",
              line_length = 1,
              frame_count = 1,
              animation_speed = 0.25,
              width = 480,
              height = 960,
              shift = util.by_pixel(0, 56),
              scale = 0.15,
            }
          }
        },
        west =
        {
          layers =
          {
            {
              filename = "__TFMG-assets-0__/buildings/small-radiator/panel_west.png",
              priority = "high",
              line_length = 1,
              frame_count = 1,
              animation_speed = 0.25,
              width = 960,
              height = 480,
              shift = util.by_pixel(-56, 0),
              scale = 0.15
            }
          }
        }
      },
      working_visualisations = {{
        fadeout = true,
        effect = "uranium-glow",
        light = {intensity = 1, size = 9.9, shift = {0, 0}, color = {1, 0.2, 0.2}},
        north_animation = {
          layers = {
            {
              filename = "__TFMG-assets-0__/buildings/small-radiator/panel_north_glow.png",
              priority = "high",
              line_length = 1,
              frame_count = 1,
              animation_speed = 0.25, 
              width = 480,
              height = 960,
              shift = util.by_pixel(0, -56),
              scale = 0.15,
              draw_as_glow = true,
              tint = {1,1,1,0.5}
            },
          }
        },
        east_animation = {
          layers = {
            {
              filename = "__TFMG-assets-0__/buildings/small-radiator/panel_east_glow.png",
              priority = "high",
              line_length = 1,
              frame_count = 1,
              animation_speed = 0.25,
              width = 960,
              height = 480,
              shift = util.by_pixel(56, 0),
              scale = 0.15,
              draw_as_glow = true,
              tint = {1,1,1,0.5}
            },
          }
        },
        south_animation = {
          layers = {
            {
              filename = "__TFMG-assets-0__/buildings/small-radiator/panel_south_glow.png",
              priority = "high",
              line_length = 1,
              frame_count = 1,
              animation_speed = 0.25,
              width = 480,
              height = 960,
              shift = util.by_pixel(0, 56),
              scale = 0.15,
              draw_as_glow = true,
              tint = {1,1,1,0.5}
            },
          }
        },
        west_animation = {
          layers = {
            {
              filename = "__TFMG-assets-0__/buildings/small-radiator/panel_west_glow.png",
              priority = "high",
              line_length = 1,
              frame_count = 1,
              animation_speed = 0.25,
              width = 960,
              height = 480,
              shift = util.by_pixel(-56, 0),
              scale = 0.15,
              draw_as_glow = true,
              tint = {1,1,1,0.5}
            },
          }
        },
      }}
    },
    crafting_categories = {"special"},
    fixed_recipe = "small-radiator-radiation",
    crafting_speed = 1,
    energy_source =
    {
      type = "heat",
      max_temperature = 1000, --this has to be a big number or a thermal system could lock up and be unable to cool down
      min_working_temperature = 15,
      default_temperature = 15,
      specific_heat = "1MJ",
      max_transfer = "1GW",
      connections =
      {--north connection is not real and cannot hurt me.
        {
          position = {0, 0},
          direction = defines.direction.south
        },
      },
    },
    energy_usage = "5000kW",--5mw should be enough for 5 assembling machines per radiator. I do wonder if this will be a bit tight with more advanced machines/beacons.
    placeable_position_visualization =
    {
      filename = "__core__/graphics/cursor-boxes-32x32.png",
      priority = "extra-high-no-scale",
      width = 64,
      height = 64,
      scale = 0.5,
      x = 3*64
    },
  },
})
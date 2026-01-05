local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")
local TFMG = require("__TFMG__.util.TFMG")

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

local underground_pipe_picture = {
    north =
    {
      filename = "__base__/graphics/entity/pipe-to-ground/pipe-to-ground-up.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5,
      shift = {0,1}
    },
    east =
    {
      filename = "__base__/graphics/entity/pipe-to-ground/pipe-to-ground-right.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5,
      shift = {-1,0}
    },
    south =
    {
      filename = "__base__/graphics/entity/pipe-to-ground/pipe-to-ground-down.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5,
      shift = {0,-1}
    },
    west =
    {
      filename = "__base__/graphics/entity/pipe-to-ground/pipe-to-ground-left.png",
      priority = "extra-high",
      width = 128,
      height = 128,
      scale = 0.5,
      shift = {1,0}
    },
  }

--small radiator
local small_radiator = data.raw["assembling-machine"]["small-radiator"]
  small_radiator.hidden = false
  small_radiator.energy_source.specific_heat = "250kJ"
  small_radiator.energy_usage = "2MW"
  small_radiator.surface_conditions = TFMG.conditions.space
--ground radiator
local ground_radiator = data.raw["assembling-machine"]["ground-radiator"]
  ground_radiator.hidden = false
  ground_radiator.energy_source.specific_heat = "250kJ"
  ground_radiator.energy_usage = "6MW"
  --ground_radiator.surface_conditions ={{property = "gravity",min = 0.01}}
  ground_radiator.fluid_boxes = {{
    production_type = "input",
    pipe_picture = underground_pipe_picture,
    pipe_covers = pipecoverspictures(),
    volume = 100,
    pipe_connections = {
      { flow_direction = "input-output", direction = defines.direction.north, position = {1, -1} },
      { flow_direction = "input-output", direction = defines.direction.south, position = {-1, 1} },
    },
    render_layer = "object",
    secondary_draw_orders = { north = -1, west = -1, east = -1}
  }}
  ground_radiator.fixed_recipe = "evaporation-cooling"
  ground_radiator.forced_symmetry = "horizontal"

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
  {--TFMG logo (a radiator)
    type = "assembling-machine",
    name = "TFMG-logo-11-tiles",
    icon = "__TFMG-thermal__/graphics/radiator-ground/radiator-ground-icon.png",
    hidden = true,
    flags = {"placeable-neutral","player-creation","not-rotatable","hide-alt-info"},
    minable = {mining_time = 0.2, result = "TFMG-logo-11-tiles"},
    max_health = 3,
    circuit_wire_max_distance = assembling_machine_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions["assembling-machine"],
    collision_box = {{-5.5, -1}, {5.5, 1}},
    selection_box = {{-5.5, -1}, {5.5, 1}},
    collision_mask = {layers = {}},
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
    graphics_set =
    {
      animation =
      {
        layers =
        {
          {
            filename = "__TFMG-assets-0__/entity/TFMG-logo/colour.png",
            priority = "high",
            line_length = 1,
            frame_count = 1,
            animation_speed = 0.25,
            width = 832,
            height = 256,
            scale = 0.5
          },
        }
      },
      working_visualisations = {{
        fadeout = true,
        effect = "uranium-glow",
        light = {intensity = 2, size = 50, shift = {0, 0}, color = {0.3, 1, 0}},
        animation = {
          filename = "__TFMG-assets-0__/entity/TFMG-logo/glow.png",
          priority = "high",
          width = 832,
          height = 256,
          scale = 0.5,
          blend_mode = "additive",
        },
      }},
    },
    crafting_categories = {"radiator"},
    fixed_recipe = "TFMG-heat-radiation",
    crafting_speed = 256,
    energy_usage = "1W",
    energy_source =
    {
      type = "heat",
      max_temperature = 1000,
      min_working_temperature = 15,
      default_temperature = 15,
      specific_heat = "1MJ",
      max_transfer = "1GW",
      connections =
      {--north connection is not real and cannot hurt me.
        { position = {4, -0.5}, direction = defines.direction.north},
        { position = {2, -0.5}, direction = defines.direction.north},
        { position = {0, -0.5}, direction = defines.direction.north},
        { position = {-2, -0.5}, direction = defines.direction.north},
        { position = {-4, -0.5}, direction = defines.direction.north},
        { position = {4, 0.5}, direction = defines.direction.south},
        { position = {2, 0.5}, direction = defines.direction.south},
        { position = {0, 0.5}, direction = defines.direction.south},
        { position = {-2, 0.5}, direction = defines.direction.south},
        { position = {-4, 0.5}, direction = defines.direction.south},
      },
      heat_picture = {
        layers = {
          {
            filename = "__TFMG-assets-0__/entity/TFMG-logo/heat-glow.png",
            priority = "high",
            width = 832,
            height = 256,
            scale = 0.5,
            draw_as_glow = true,
            blend_mode = "additive-soft",
          },
        }
      }
    }
  }
})
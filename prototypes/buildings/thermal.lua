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
})
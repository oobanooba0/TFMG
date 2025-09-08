local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")
--local # = require("__base__.prorotypes.never.forger")

data:extend({
  {--small radiator
    type = "assembling-machine",
    name = "small-radiator",
    icon = "__base__/graphics/icons/offshore-pump.png",
    flags = {"placeable-neutral","placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = "small-radiator"},
    max_health = 400,
    corpse = "offshore-pump-remnants",
    dying_explosion = "offshore-pump-explosion",
    circuit_wire_max_distance = assembling_machine_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions["assembling-machine"],
    collision_box = {{-0.6, -1.05}, {0.6, 0.3}},
    selection_box = {{-0.6, -1.49}, {0.6, 0.49}},
    tile_height = 1,
    tile_width = 1,
    surface_conditions =
    {
      {
        property = "pressure",
        min = 0,
        max = 0
      }
    },
    collision_mask = {layers={train=true, is_object=true, is_lower_object=true}}, -- collide just with object-layer and train-layer which don't collide with water, this allows us to build on 1 tile wide ground
    tile_buildability_rules =--build on the edge of space.
    {
      {area = {{-0.4, -0.4}, {0.4, 0.4}}, required_tiles = {layers={ground_tile=true}}, colliding_tiles = {layers={empty_space=true}}, remove_on_collision = true},
      {area = {{-0.4, -4}, {0.4, -1}}, required_tiles = {layers={empty_space=true}}, colliding_tiles = {layers={}}},--all those braces and its empty.
    },
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
    graphics_set =--pumpcore
    {
      animation =
      {
        north =
        {
          layers =
          {
            {
              filename = "__base__/graphics/entity/offshore-pump/offshore-pump_North.png",
              priority = "high",
              line_length = 8,
              frame_count = 32,
              animation_speed = 0.25,
              width = 90,
              height = 162,
              shift = util.by_pixel(-1, -15),
              scale = 0.5
            },
            {
              filename = "__base__/graphics/entity/offshore-pump/offshore-pump_North-shadow.png",
              priority = "high",
              line_length = 8,
              frame_count = 32,
              animation_speed = 0.25,
              width = 150,
              height = 134,
              shift = util.by_pixel(13, -7),
              draw_as_shadow = true,
              scale = 0.5
            }
          }
        },
        east =
        {
          layers =
          {
            {
              filename = "__base__/graphics/entity/offshore-pump/offshore-pump_East.png",
              priority = "high",
              line_length = 8,
              frame_count = 32,
              animation_speed = 0.25,
              width = 124,
              height = 102,
              shift = util.by_pixel(15, -2),
              scale = 0.5
            },
            {
              filename = "__base__/graphics/entity/offshore-pump/offshore-pump_East-shadow.png",
              priority = "high",
              line_length = 8,
              frame_count = 32,
              animation_speed = 0.25,
              width = 180,
              height = 66,
              shift = util.by_pixel(27, 8),
              draw_as_shadow = true,
              scale = 0.5
            }
          }
        },
        south =
        {
          layers =
          {
            {
              filename = "__base__/graphics/entity/offshore-pump/offshore-pump_South.png",
              priority = "high",
              line_length = 8,
              frame_count = 32,
              animation_speed = 0.25,
              width = 92,
              height = 192,
              shift = util.by_pixel(-1, 0),
              scale = 0.5
            },
            {
              filename = "__base__/graphics/entity/offshore-pump/offshore-pump_South-shadow.png",
              priority = "high",
              line_length = 8,
              frame_count = 32,
              animation_speed = 0.25,
              width = 164,
              height = 128,
              shift = util.by_pixel(15, 23),
              draw_as_shadow = true,
              scale = 0.5
            }
          }
        },
        west =
        {
          layers =
          {
            {
              filename = "__base__/graphics/entity/offshore-pump/offshore-pump_West.png",
              priority = "high",
              line_length = 8,
              frame_count = 32,
              animation_speed = 0.25,
              width = 124,
              height = 102,
              shift = util.by_pixel(-15, -2),
              scale = 0.5
            },
            {
              filename = "__base__/graphics/entity/offshore-pump/offshore-pump_West-shadow.png",
              priority = "high",
              line_length = 8,
              frame_count = 32,
              animation_speed = 0.25,
              width = 172,
              height = 66,
              shift = util.by_pixel(-3, 8),
              draw_as_shadow = true,
              scale = 0.5
            }
          }
        }
      },
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
          direction = defines.direction.east
        },
        {
          position = {0, 0},
          direction = defines.direction.south
        },
        {
          position = {0, 0},
          direction = defines.direction.west
        }
      }
    },
    energy_usage = "5000kW",--5mw should be enough for assembling machines per radiator. I do wonder if this will be a bit tight with more advanced machines/beacons.
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
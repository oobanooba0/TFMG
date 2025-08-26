local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")
--local # = require("__base__.prorotypes.never.forger")

data:extend({
    --small radiator wont work as heat interface prototype because heat interface prototype cannot be rotated, try re-implementing it as a fluid pump or something similar instaid.
  {--Small Radiator, attempt 2: electric boogaloo
    type = "offshore-pump",
    name = "small-radiator",
    icon = "__base__/graphics/icons/offshore-pump.png",
    flags = {"placeable-neutral", "player-creation", "filter-directions"},
    surface_conditions =
    {
      {
        property = "pressure",
        min = 0,
        max = 0,
      }
    },
    collision_mask = {layers={train=true, is_object=true, is_lower_object=true}}, -- collide just with object-layer and train-layer which don't collide with water, this allows us to build on 1 tile wide ground
    tile_buildability_rules =--build on the edge of space.
    {
      {area = {{-0.4, -0.4}, {0.4, 0.4}}, required_tiles = {layers={ground_tile=true}}, colliding_tiles = {layers={empty_space=true}}, remove_on_collision = true},
      {area = {{-1, -2}, {1, -1}}, required_tiles = {layers={empty_space=true}}, colliding_tiles = {layers={}}},--all those braces and its empty.
    },
    minable = {mining_time = 0.1, result = "small-radiator"},
    max_health = 150,--at some point i actually need to decide what hp this shit gonna have
    corpse = "offshore-pump-remnants",
    dying_explosion = "offshore-pump-explosion",
    fluid_source_offset = {0, -1},
    resistances =
    {
      {
        type = "fire",--in case of fire, in space.
        percent = 70
      },
      {
        type = "impact",--this is impact damage against vehicles. I have no idea what damage type asteroids do, probably psychic, to me.
        percent = 30
      }
    },
    collision_box = {{-0.6, -1.05}, {0.6, 0.3}},
    selection_box = {{-0.6, -1.49}, {0.6, 0.49}},
    damaged_trigger_effect = hit_effects.entity(),
    fluid_box =
    {
      volume = 100,
      filter = "heat",
      pipe_covers = pipecoverspictures(),
      production_type = "none",
      pipe_connections =
      {
        {
          position = {0, 0},
          direction = defines.direction.south,
          flow_direction = "output"
        }
      }
    },
    energy_source =
    {
      type = "heat",
      max_temperature = 100000, --this has to be a big number or a thermal system could lock up and be unable to cool down
      specific_heat = "1MJ",
      max_transfer = "1GW",
      connections =
      {--a north connection is not real and cannot happen.
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
    energy_usage = "10000kW",
    pumping_speed = 1,--why isnt it possible?
    tile_width = 1,
    tile_height = 1,
    impact_category = "metal",--clonk
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    working_sound =
    {
      sound = sound_variations("__base__/sound/nuclear-reactor", 2, 0.55, volume_multiplier("main-menu", 0.8)),
      max_sounds_per_prototype = 3,
      fade_in_ticks = 4,
      fade_out_ticks = 20,
      match_volume_to_activity = true,
    },
    perceived_performance = {minimum = 0.5},
    always_draw_fluid = true,
    graphics_set =
    {
      underwater_layer_offset = 15,
      base_render_layer = "ground-patch",
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
      fluid_animation =
      {
        north =
        {
          filename = "__base__/graphics/entity/offshore-pump/offshore-pump_North-fluid.png",
          apply_runtime_tint = true,
          line_length = 8,
          frame_count = 32,
          animation_speed = 0.25,
          width = 40,
          height = 40,
          shift = util.by_pixel(-1, -22),
          scale = 0.5
        },
        east =
        {
          filename = "__base__/graphics/entity/offshore-pump/offshore-pump_East-fluid.png",
          apply_runtime_tint = true,
          line_length = 8,
          frame_count = 32,
          animation_speed = 0.25,
          width = 38,
          height = 50,
          shift = util.by_pixel(6, -11),
          scale = 0.5
        },
        south =
        {
          filename = "__base__/graphics/entity/offshore-pump/offshore-pump_South-fluid.png",
          apply_runtime_tint = true,
          line_length = 8,
          frame_count = 32,
          animation_speed = 0.25,
          width = 36,
          height = 14,
          shift = util.by_pixel(-1, -4),
          scale = 0.5
        },
        west =
        {
          filename = "__base__/graphics/entity/offshore-pump/offshore-pump_West-fluid.png",
          apply_runtime_tint = true,
          line_length = 8,
          frame_count = 32,
          animation_speed = 0.25,
          width = 36,
          height = 50,
          shift = util.by_pixel(-7, -11),
          scale = 0.5
        }
      },
      glass_pictures =
      {
        north =
        {
          filename = "__base__/graphics/entity/offshore-pump/offshore-pump_North-glass.png",
          width = 36,
          height = 40,
          shift = util.by_pixel(-2, -22),
          scale = 0.5
        },
        east =
        {
          filename = "__base__/graphics/entity/offshore-pump/offshore-pump_East-glass.png",
          width = 30,
          height = 32,
          shift = util.by_pixel(5, -13),
          scale = 0.5
        },
        south =
        {
          filename = "__base__/graphics/entity/offshore-pump/offshore-pump_South-glass.png",
          width = 40,
          height = 24,
          shift = util.by_pixel(-1, -6),
          scale = 0.5
        },
        west =
        {
          filename = "__base__/graphics/entity/offshore-pump/offshore-pump_West-glass.png",
          width = 30,
          height = 32,
          shift = util.by_pixel(-6, -14),
          scale = 0.5
        }
      },
      base_pictures =
      {
        north =
        {
          filename = "__base__/graphics/entity/offshore-pump/offshore-pump_North-legs.png",
          width = 114,
          height = 106,
          shift = util.by_pixel(-1, -5),
          scale = 0.5
        },
        east =
        {
          filename = "__base__/graphics/entity/offshore-pump/offshore-pump_East-legs.png",
          width = 106,
          height = 60,
          shift = util.by_pixel(4, 13),
          scale = 0.5
        },
        south =
        {
          filename = "__base__/graphics/entity/offshore-pump/offshore-pump_South-legs.png",
          width = 110,
          height = 108,
          shift = util.by_pixel(-2, 6),
          scale = 0.5
        },
        west =
        {
          filename = "__base__/graphics/entity/offshore-pump/offshore-pump_West-legs.png",
          width = 108,
          height = 64,
          shift = util.by_pixel(-6, 12),
          scale = 0.5
        }
      },
      underwater_pictures =
      {
        north =
        {
          filename = "__base__/graphics/entity/offshore-pump/offshore-pump_North-underwater.png",
          width = 98,
          height = 36,
          shift = util.by_pixel(-1, -32),
          scale = 0.5
        },
        east =
        {
          filename = "__base__/graphics/entity/offshore-pump/offshore-pump_East-underwater.png",
          width = 40,
          height = 72,
          shift = util.by_pixel(39, 17),
          scale = 0.5
        },
        south =
        {
          filename = "__base__/graphics/entity/offshore-pump/offshore-pump_South-underwater.png",
          width = 98,
          height = 48,
          shift = util.by_pixel(-1, 49),
          scale = 0.5
        },
        west =
        {
          filename = "__base__/graphics/entity/offshore-pump/offshore-pump_West-underwater.png",
          width = 40,
          height = 72,
          shift = util.by_pixel(-40, 17),
          scale = 0.5
        }
      }
    },
    placeable_position_visualization =
    {
      filename = "__core__/graphics/cursor-boxes-32x32.png",
      priority = "extra-high-no-scale",
      width = 64,
      height = 64,
      scale = 0.5,
      x = 3*64
    },
    circuit_connector = circuit_connector_definitions["offshore-pump"],
    circuit_wire_max_distance = default_circuit_wire_max_distance,
    water_reflection =
    {
      pictures =
      {
        filename = "__base__/graphics/entity/offshore-pump/offshore-pump-reflection.png",
        priority = "extra-high",
        width = 132,
        height = 156,
        shift = util.by_pixel(0, 19),
        variation_count = 4,
        scale = 1
      },
      rotate = false,
      orientation_to_variation = true
    }
  },
})
--- Easy belt speed tuning here.

local belt_1_speed = 16/480

local meld = require("meld")
local hit_effects = require ("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")
local belt_1_animation_set =
{
  animation_set =
  {
    filename = "__base__/graphics/entity/transport-belt/transport-belt.png",
    priority = "extra-high",
    size = 128,
    scale = 0.5,
    frame_count = 16,
    direction_count = 20
  },
}

belt_reader_gfx = -- not local
{
  belt_reader =
  {
    {
      sprites = util.sprite_load("__base__/graphics/entity/transport-belt/belt-reader-top",
      {
        priority = "low",
        scale = 0.5,
        frame_count = 4,
        direction_count = 4
      }),
      render_layer = "object"
    },
    {
      sprites = util.sprite_load("__base__/graphics/entity/transport-belt/belt-reader-base",
      {
        priority = "low",
        scale = 0.5,
        frame_count = 4,
        direction_count = 4
      }),
      render_layer = "transport-belt-reader"
    },
    {
      sprites = util.sprite_load("__base__/graphics/entity/transport-belt/belt-reader-middle",
      {
        priority = "low",
        scale = 0.5,
        frame_count = 4,
        direction_count = 4
      }),
      render_layer = "floor-mechanics"
    },
    {
      sprites = util.sprite_load("__base__/graphics/entity/transport-belt/belt-reader-under-middle",
      {
        priority = "low",
        scale = 0.5,
        frame_count = 4,
        direction_count = 4
      }),
      render_layer = "transport-belt-endings"
    },
    {
      sprites = util.sprite_load("__base__/graphics/entity/transport-belt/belt-reader-bottom",
      {
        priority = "low",
        scale = 0.5,
        frame_count = 4,
        direction_count = 4
      }),
      render_layer = "floor"
    },
    {
      sprites = util.sprite_load("__base__/graphics/entity/transport-belt/belt-reader-shadow",
      {
        priority = "low",
        scale = 0.5,
        frame_count = 4,
        direction_count = 4,
      }),
      render_layer = "floor"
    },
    -- More belt reader layers (with possibly different render layer) should go here
  }
}
meld(belt_1_animation_set, belt_reader_gfx)

data:extend
{
  {--transport belt 1
    type = "transport-belt",
    name = "transport-belt-1",
    icon = "__base__/graphics/icons/transport-belt.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "transport-belt-1"},
    max_health = 150,
    corpse = "transport-belt-remnants",
    dying_explosion = "transport-belt-explosion",
    resistances =
    {
      {
        type = "fire",
        percent = 90
      }
    },
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    damaged_trigger_effect = hit_effects.entity(),
    open_sound = sounds.transport_belt_open,
    close_sound = sounds.transport_belt_close,
    working_sound =
    {
      sound = { filename = "__base__/sound/transport-belt.ogg", volume = 0.17 },
      persistent = true
    },
    animation_speed_coefficient = 32,
    belt_animation_set = belt_1_animation_set,
    fast_replaceable_group = "transport-belt",
    related_underground_belt = "underground-belt-1",
    --next_upgrade = "fast-transport-belt",
    speed = belt_1_speed,
    connector_frame_sprites = transport_belt_connector_frame_sprites,
    circuit_connector = circuit_connector_definitions["belt"],
    circuit_wire_max_distance = transport_belt_circuit_wire_max_distance
  },
  {--unerground belt 1
    type = "underground-belt",
    name = "underground-belt-1",
    icon = "__base__/graphics/icons/underground-belt.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "underground-belt-1"},
    max_health = 150,
    corpse = "underground-belt-remnants",
    dying_explosion = "underground-belt-explosion",
    max_distance = 5,
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    working_sound =
    {
      sound = {filename = "__base__/sound/underground-belt.ogg", volume = 0.2, audible_distance_modifier = 0.5},
      max_sounds_per_prototype = 2,
      persistent = true,
      use_doppler_shift = false
    },
    underground_sprite =
    {
      filename = "__core__/graphics/arrows/underground-lines.png",
      priority = "high",
      width = 64,
      height = 64,
      x = 64,
      scale = 0.5
    },
    resistances =
    {
      {
        type = "fire",
        percent = 60
      },
      {
        type = "impact",
        percent = 30
      }
    },
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    damaged_trigger_effect = hit_effects.entity(),
    animation_speed_coefficient = 32,
    belt_animation_set = belt_1_animation_set,
    fast_replaceable_group = "transport-belt",
    --next_upgrade = "fast-underground-belt",
    speed = belt_1_speed,
    structure =
    {
      direction_in =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/underground-belt/underground-belt-structure.png",
          priority = "extra-high",
          width = 192,
          height =192,
          y = 192,
          scale = 0.5
        }
      },
      direction_out =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/underground-belt/underground-belt-structure.png",
          priority = "extra-high",
          width = 192,
          height = 192,
          scale = 0.5
        }

      },
      direction_in_side_loading =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/underground-belt/underground-belt-structure.png",
          priority = "extra-high",
          width = 192,
          height = 192,
          y = 192*3,
          scale = 0.5
        }
      },
      direction_out_side_loading =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/underground-belt/underground-belt-structure.png",
          priority = "extra-high",
          width = 192,
          height = 192,
          y= 192*2,
          scale = 0.5
        }

      },
      back_patch =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/underground-belt/underground-belt-structure-back-patch.png",
          priority = "extra-high",
          width = 192,
          height = 192,
          scale = 0.5
        }
      },
      front_patch =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/underground-belt/underground-belt-structure-front-patch.png",
          priority = "extra-high",
          width = 192,
          height = 192,
          scale = 0.5
        }
      }
    }

  },
  {--splitter 1
    type = "splitter",
    name = "splitter-1",
    icon = "__base__/graphics/icons/splitter.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "splitter-1"},
    max_health = 170,
    corpse = "splitter-remnants",
    dying_explosion = "splitter-explosion",
    resistances =
    {
      {
        type = "fire",
        percent = 60
      }
    },
    collision_box = {{-0.9, -0.4}, {0.9, 0.4}},
    selection_box = {{-0.9, -0.5}, {0.9, 0.5}},
    damaged_trigger_effect = hit_effects.entity(),
    animation_speed_coefficient = 32,
    structure_animation_speed_coefficient = 0.7,
    structure_animation_movement_cooldown = 10,
    icon_draw_specification = {scale = 0.5},
    fast_replaceable_group = "transport-belt",
    --next_upgrade = "fast-splitter",
    speed = belt_1_speed,
    belt_animation_set = belt_1_animation_set,
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    working_sound = sounds.splitter,
    related_transport_belt = "transport-belt",
    structure =
    {
      north =
      {
        filename = "__base__/graphics/entity/splitter/splitter-north.png",
        frame_count = 32,
        line_length = 8,
        priority = "extra-high",
        width = 160,
        height = 70,
        shift = util.by_pixel(7, 0),
        scale = 0.5
      },
      east =
      {
        filename = "__base__/graphics/entity/splitter/splitter-east.png",
        frame_count = 32,
        line_length = 8,
        priority = "extra-high",
        width = 90,
        height = 84,
        shift = util.by_pixel(4, 13),
        scale = 0.5
      },
      south =
      {
        filename = "__base__/graphics/entity/splitter/splitter-south.png",
        frame_count = 32,
        line_length = 8,
        priority = "extra-high",
        width = 164,
        height = 64,
        shift = util.by_pixel(4, 0),
        scale = 0.5
      },
      west =
      {
        filename = "__base__/graphics/entity/splitter/splitter-west.png",
        frame_count = 32,
        line_length = 8,
        priority = "extra-high",
        width = 90,
        height = 86,
        shift = util.by_pixel(6, 12),
        scale = 0.5
      }
    },
    structure_patch =
    {
      north = util.empty_sprite(),
      east =
      {
        filename = "__base__/graphics/entity/splitter/splitter-east-top_patch.png",
        frame_count = 32,
        line_length = 8,
        priority = "extra-high",
        width = 90,
        height = 104,
        shift = util.by_pixel(4, -20),
        scale = 0.5
      },
      south = util.empty_sprite(),
      west =
      {
        filename = "__base__/graphics/entity/splitter/splitter-west-top_patch.png",
        frame_count = 32,
        line_length = 8,
        priority = "extra-high",
        width = 90,
        height = 96,
        shift = util.by_pixel(6, -18),
        scale = 0.5
      }
    }
  },
  {--loader 1
    type = "loader",
    name = "loader-1",
    icon = "__base__/graphics/icons/loader.png",
    flags = {"placeable-neutral", "player-creation"},
    hidden = true,
    minable = {mining_time = 0.1, result = "loader-1"},
    max_health = 170,
    filter_count = 5,
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    working_sound = sounds.loader,
    corpse = "small-remnants",
    resistances =
    {
      {
        type = "fire",
        percent = 60
      }
    },
    collision_box = {{-0.4, -0.9}, {0.4, 0.9}},
    selection_box = {{-0.5, -1}, {0.5, 1}},
    animation_speed_coefficient = 32,
    icon_draw_specification = {scale = 0.7},
    belt_animation_set = belt_1_animation_set,
    fast_replaceable_group = "loader",
    speed = belt_1_speed,
    structure_render_layer = "lower-object",
    structure =
    {
      direction_in =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/loader/loader-structure.png",
          priority = "extra-high",
          width = 64,
          height = 64
        }
      },
      direction_out =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/loader/loader-structure.png",
          priority = "extra-high",
          width = 64,
          height = 64,
          y = 64
        }
      }
    },
    circuit_connector = circuit_connector_definitions["loader-1x2"],
    circuit_wire_max_distance = transport_belt_circuit_wire_max_distance,
  },
}
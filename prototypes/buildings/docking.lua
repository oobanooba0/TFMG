
  local pixel = 1/32
--docking port
  local docking_port = table.deepcopy(data.raw["constant-combinator"]["constant-combinator"])
  docking_port.name = "docking-port"
  docking_port.sprites =
    make_4way_animation_from_spritesheet({ layers =
      {
        {
          scale = 0.5,
          filename = "__TFMG-assets-0__/buildings/supercomputer/supercomputer-input.png",
          width = 114,
          height = 102,
        },
        {
          scale = 0.5,
          filename = "__base__/graphics/entity/combinator/constant-combinator-shadow.png",
          width = 98,
          height = 66,
          shift = util.by_pixel(8.5, 1.5),
          draw_as_shadow = true
        }
      }
    })
  data:extend{docking_port}


data:extend({
  {--docking belt
    type = "linked-belt",
    name = "docking-belt",
    icon = "__base__/graphics/icons/linked-belt.png",
    flags = {"placeable-neutral", "player-creation"},
    hidden = true,
    minable = {mining_time = 0.1, result = "docking-belt"},
    max_health = 160,
    corpse = "underground-belt-remnants",
    dying_explosion = "underground-belt-explosion",
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    working_sound = data.raw["underground-belt"]["underground-belt"].working_sound,
    resistances = data.raw["underground-belt"]["underground-belt"].resistances,
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    damaged_trigger_effect = hit_effects.entity(),
    animation_speed_coefficient = 32,
    belt_animation_set = basic_belt_animation_set,
    fast_replaceable_group = "docking-belts",
    speed = 0.03125,
    structure_render_layer = "object",
    structure =
    {
      direction_in =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/linked-belt/linked-belt-structure.png",
          priority = "extra-high",
          width = 192,
          height = 192,
          y = 192,
          scale = 0.5
        }
      },
      direction_out =
      {
        sheet =
        {
          filename = "__base__/graphics/entity/linked-belt/linked-belt-structure.png",
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
          filename = "__base__/graphics/entity/linked-belt/linked-belt-structure.png",
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
          filename = "__base__/graphics/entity/linked-belt/linked-belt-structure.png",
          priority = "extra-high",
          width = 192,
          height = 192,
          y = 192*2,
          scale = 0.5
        }
      },
      back_patch = data.raw["underground-belt"]["underground-belt"].structure.back_patch,
      front_patch = data.raw["underground-belt"]["underground-belt"].structure.front_patch,
    },
    -- clone/blueprint connection work only if both input and output have them and they are contained in the same blueprint/clone
    allow_clone_connection = true,
    allow_blueprint_connection = true,
    allow_side_loading = false
  },
})

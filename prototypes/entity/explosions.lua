--booom! :)

local explosion_animations = require("__space-age__.prototypes.entity.explosion-animations")
local ferric_asteroids_sounds = require ("__TFMG__.prototypes.entity.sounds")

--asteroid explosions
data:extend({
  {
    type = "explosion",
    name = "ferric-asteroid-explosion-1",
    icon = "__TFMG__/graphics/icons/ferric-asteroid-chunk.png",
    flags = {"not-on-map"},
    hidden = true,
    height = 0,
    animations = explosion_animations.asteroid_explosion_chunk({tint = {0.6118, 0.4980, 0.4745, 1}}),
    sound = ferric_asteroids_sounds.asteroid_collision_ferric_small,
    created_effect = {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-trivial-smoke",
            repeat_count = 6,
            probability = 1,
            smoke_name = "asteroid-smoke-ferric-chunk",
            offset_deviation = { { -0.1, -0.1 }, { 0.1, 0.1 } },
            initial_height = -0.2,
            speed_from_center = 0.01,
            speed_from_center_deviation = 0.01
          },
          {
            type = "create-particle",
            repeat_count = 4,
            particle_name = "ferric-asteroid-chunk-particle-small",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.2,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.05,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 2,
            particle_name = "ferric-asteroid-chunk-particle-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.2,
            initial_height_deviation = 0.44,
            initial_vertical_speed = 0.036,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.02,
            speed_from_center_deviation = 0.046
          },
        }
      }
    }
  },
   --ferric small
  {
    type = "explosion",
    name = "ferric-asteroid-explosion-2",
    icon = "__TFMG__/graphics/icons/small-ferric-asteroid.png",
    flags = {"not-on-map"},
    hidden = true,
    height = 0,
    animations = explosion_animations.asteroid_explosion_small({tint = {0.6118, 0.4980, 0.4745, 1}}),
    sound = ferric_asteroids_sounds.asteroid_damage_ferric_small,
    created_effect = {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-trivial-smoke",
            repeat_count = 15,
            smoke_name = "asteroid-smoke-ferric-small",
            offset_deviation = { { -0.4, -0.4 }, { 0.4, 0.4 } },
            initial_height = 0,
            speed_from_center = 0.01,
            speed_from_center_deviation = 0.04
          },
          {
            type = "create-particle",
            repeat_count = 8,
            particle_name = "ferric-asteroid-particle-small",
            offset_deviation = { { -1, -1 }, { 1, 1 } },
            initial_height = 0,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.088,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05,
            movement_multiplier = 1,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 4,
            particle_name = "ferric-asteroid-particle-medium",
            offset_deviation = { { -1, -1 }, { 1, 1 } },
            initial_height = 0,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.088,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05,
            movement_multiplier = 1,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 2,
            particle_name = "ferric-asteroid-particle-big",
            offset_deviation = { { -1, -1 }, { 1, 1 } },
            initial_height = 0,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.088,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.05,
            movement_multiplier = 1,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 2,
            particle_name = "ferric-asteroid-particle-top-small",
            offset_deviation = { { -0.25, -0.25 }, { 0.25, 0.25 } },
            initial_height = 0,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.02,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.01,
            speed_from_center_deviation = 0.01,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 1,
            particle_name = "ferric-asteroid-particle-top-big",
            offset_deviation = { { -0.15, -0.15 }, { 0.15, 0.15 } },
            initial_height = 0,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.02,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.01,
            speed_from_center_deviation = 0.01,
            only_when_visible = true
          }
        }
      }
    }
  },
  --ferric-medium
  {
    type = "explosion",
    name = "ferric-asteroid-explosion-3",
    icon = "__TFMG__/graphics/icons/medium-ferric-asteroid.png",
    flags = {"not-on-map"},
    hidden = true,
    height = 0,
    animations = explosion_animations.asteroid_explosion_medium({tint = {0.6118, 0.4980, 0.4745, 1}}),
    sound = ferric_asteroids_sounds.asteroid_damage_ferric_medium,
    created_effect = {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-trivial-smoke",
            repeat_count = 25,
            smoke_name = "asteroid-smoke-ferric-medium",
            offset_deviation = { { -0.8, -0.8 }, { 0.8, 0.8 } },
            initial_height = 0,
            speed_from_center = 0.011,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 10,
            particle_name = "ferric-asteroid-particle-small",
            offset_deviation = { { -1.5, -1.5 }, { 1.5, 1.5 } },
            initial_height = 0,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.088,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.07,
            movement_multiplier = 1,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 8,
            particle_name = "ferric-asteroid-particle-medium",
            offset_deviation = { { -1.5, -1.5 }, { 1.5, 1.5 } },
            initial_height = 0,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.088,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.07,
            movement_multiplier = 1,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 4,
            particle_name = "ferric-asteroid-particle-big",
            offset_deviation = { { -1.5, -1.5 }, { 1.5, 1.5 } },
            initial_height = 0,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.088,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.07,
            movement_multiplier = 1,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 4,
            particle_name = "ferric-asteroid-particle-top-small",
            offset_deviation = { { -0.45, -0.45 }, { 0.45, 0.45 } },
            initial_height = 0.1,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.02,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.01,
            speed_from_center_deviation = 0.01,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 2,
            particle_name = "ferric-asteroid-particle-top-big",
            offset_deviation = { { -0.3, -0.3 }, { 0.3, 0.3 } },
            initial_height = 0.1,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.02,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.01,
            speed_from_center_deviation = 0.01,
            only_when_visible = true
          }
        }
      }
    }
  },
  --ferric-big
  {
    type = "explosion",
    name = "ferric-asteroid-explosion-4",
    icon = "__TFMG__/graphics/icons/big-ferric-asteroid.png",
    flags = {"not-on-map"},
    hidden = true,
    height = 0,
    animations = explosion_animations.asteroid_explosion_big({tint = {0.6118, 0.4980, 0.4745, 1}}),
    sound = ferric_asteroids_sounds.asteroid_damage_ferric_big,
    created_effect = {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-trivial-smoke",
            repeat_count = 50,
            smoke_name = "asteroid-smoke-ferric-big",
            offset_deviation = { { -1.3, -1.3 }, { 1.3, 1.3 } },
            initial_height = 0,
            speed_from_center = 0.014,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-trivial-smoke",
            repeat_count = 20,
            smoke_name = "asteroid-smoke-ferric-big",
            offset_deviation = { { 2.3, -1.3 }, { -1.3, -2.3 } },
            initial_height = 0,
            speed_from_center = 0.013,
            speed_from_center_deviation = 0.04
          },
          {
            type = "create-particle",
            repeat_count = 18,
            particle_name = "ferric-asteroid-particle-small",
            offset_deviation = { { -3.5, -3.5 }, { 3.5, 3.5 } },
            initial_height = 0,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.088,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.1,
            movement_multiplier = 1,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 12,
            particle_name = "ferric-asteroid-particle-medium",
            offset_deviation = { { -3.5, -3.5 }, { 3.5, 3.5 } },
            initial_height = 0,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.088,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.1,
            movement_multiplier = 1,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 6,
            particle_name = "ferric-asteroid-particle-big",
            offset_deviation = { { -3.5, -3.5 }, { 3.5, 3.5 } },
            initial_height = 0,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.088,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.03,
            speed_from_center_deviation = 0.1,
            movement_multiplier = 1,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 6,
            particle_name = "ferric-asteroid-particle-top-small",
            offset_deviation = { { -1.2, -1.2 }, { 1.2, 1.2 } },
            initial_height = 0.2,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.02,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.01,
            speed_from_center_deviation = 0.01,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 3,
            particle_name = "ferric-asteroid-particle-top-big",
            offset_deviation = { { -0.8, -0.8 }, { 0.8, 0.8 } },
            initial_height = 0.2,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.02,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.01,
            speed_from_center_deviation = 0.01,
            only_when_visible = true
          }
        }
      }
    }
  },
  --ferric-huge
  {
    type = "explosion",
    name = "ferric-asteroid-explosion-5",
    icon = "__TFMG__/graphics/icons/huge-ferric-asteroid.png",
    flags = {"not-on-map"},
    hidden = true,
    height = 0,
    animations = explosion_animations.asteroid_explosion_huge({tint = {0.6118, 0.4980, 0.4745, 1}}),
    sound = ferric_asteroids_sounds.asteroid_damage_ferric_huge,
    created_effect = {
      type = "direct",
      action_delivery = {
        type = "instant",
        target_effects = {
          {
            type = "create-trivial-smoke",
            repeat_count = 120,
            smoke_name = "asteroid-smoke-ferric-huge",
            offset_deviation = { { -3.5, -3.5 }, { 3.5, 3.5 } },
            initial_height = 0,
            speed_from_center = 0.018,
            speed_from_center_deviation = 0.06
          },
          {
            type = "create-trivial-smoke",
            repeat_count = 60,
            smoke_name = "asteroid-smoke-ferric-big",
            offset_deviation = { { 2, 2 }, { 4, -2 } },
            initial_height = 0,
            speed_from_center = 0.012,
            speed_from_center_deviation = 0.04
          },
          {
            type = "create-particle",
            repeat_count = 48,
            particle_name = "ferric-asteroid-particle-small",
            offset_deviation = { { -5.5, -5.5 }, { 5.5, 5.5 } },
            initial_height = 0,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.088,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.2,
            tail_length = 2,
            tail_width = 3,
            tail_length_deviation = 4,
            movement_multiplier = 1,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 34,
            particle_name = "ferric-asteroid-particle-medium",
            offset_deviation = { { -5.5, -5.5 }, { 5.5, 5.5 } },
            initial_height = 0,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.088,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.2,
            tail_length = 2,
            tail_width = 3,
            tail_length_deviation = 4,
            movement_multiplier = 1,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 16,
            particle_name = "ferric-asteroid-particle-big",
            offset_deviation = { { -5.5, -5.5 }, { 5.5, 5.5 } },
            initial_height = 0,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.088,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.2,
            movement_multiplier = 1,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 10,
            particle_name = "ferric-asteroid-particle-top-small",
            offset_deviation = { { -3.1, -3.1 }, { 3.1, 3.1 } },
            initial_height = 0.6,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.02,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.01,
            speed_from_center_deviation = 0.01,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 5,
            particle_name = "ferric-asteroid-particle-top-big",
            offset_deviation = {{ -2.1, -2.1 }, { 2.1, 2.1 }},
            initial_height = 0.6,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.02,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.01,
            speed_from_center_deviation = 0.01,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 3,
            particle_name = "ferric-asteroid-particle-top-huge",
            offset_deviation = { { -1.5, -1.5 }, { 1.5, 1.5 } },
            initial_height = 0.6,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.02,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.01,
            speed_from_center_deviation = 0.01,
            only_when_visible = true
          }
        }
      }
    }
  }
})

local item_sounds = require("__base__.prototypes.item_sounds")
local sounds = require("__base__.prototypes.entity.sounds")
local space_age_item_sounds = require("__space-age__.prototypes.item_sounds")
local second = 60
local minute = 3600
local TFMG = require("util.TFMG")

--pistol trolling
  local pistol = data.raw.gun["pistol"]
  pistol.stack_size = 4294967295
  pistol.weight = 4294967295
  pistol.icon = nil
  pistol.icons = {{
    icon = "__base__/graphics/icons/pistol.png",
    scale = 0.6,
    shift = {4, -8},
    floating = true
  }}
  pistol.attack_parameters = {
      type = "projectile",
      ammo_category = "bullet",
      cooldown = 0,
      movement_slow_down_factor = 2,
      damage_modifier = 4294967295,
      shell_particle = {
        name = "shell-particle",
        direction_deviation = 1,
        speed = 0.1,
        speed_deviation = 1,
        center = {0, 0.1},
        creation_distance = -0.5,
        starting_frame_speed = 0.4,
        starting_frame_speed_deviation = 0.1
      },
      projectile_creation_distance = 1.125,
      range = 15000,
      sound = sounds.nuclear_explosion(10)
    }
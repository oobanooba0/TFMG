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

--hidden, special and debug items
data:extend({
  {
    type = "item",
    name = "kraken-uber-fuel",
    icon = "__base__/graphics/icons/nuclear-fuel.png",
    flags = {"hide-from-fuel-tooltip"},
    pictures =
    {
      layers =
      {
        {
          size = 64,
          filename = "__base__/graphics/icons/nuclear-fuel.png",
          scale = 0.5,
          mipmap_count = 4
        },
        {
          draw_as_light = true,
          size = 64,
          filename = "__base__/graphics/icons/nuclear-fuel-light.png",
          scale = 0.5
        }
      }
    },
    fuel_category = "chemical",
    fuel_value = "1000000000GJ",
    fuel_acceleration_multiplier = 10,
    fuel_top_speed_multiplier = 100,
    -- fuel_glow_color = {r = 0.1, g = 1, b = 0.1},
    subgroup = "uranium-processing",
    order = "r[uranium-processing]-e[nuclear-fuel]",
    inventory_move_sound = item_sounds.fuel_cell_inventory_move,
    pick_sound = item_sounds.fuel_cell_inventory_pickup,
    drop_sound = item_sounds.fuel_cell_inventory_move,
    stack_size = 100,
    weight = TFMG.rocket_capacity(1000),
    hidden = true,
    hidden_in_factoriopedia = true,
  },

})
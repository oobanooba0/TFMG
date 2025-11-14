local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")
--radar
  local radar = data.raw['radar']['radar']
  radar.energy_usage = "1MW"
  radar.energy_per_nearby_scan = "1MJ"
  radar.max_distance_of_nearby_sector_revealed = 4
  radar.max_distance_of_sector_revealed = 4
--laser turret
  local laser_turret = data.raw["electric-turret"]["laser-turret"]
  laser_turret.max_health = 1000
  laser_turret.rotation_speed = 0.05--laser turret should be very quick and nimble, but have low damage output.
  laser_turret.attack_parameters.cooldown = 5


data:extend({
  {--scout radar
    type = "radar",
    name = "scout-radar",
    icon = "__base__/graphics/icons/radar.png",
    flags = {"placeable-player", "player-creation"},
    minable = {mining_time = 0.1, result = "scout-radar"},
    fast_replaceable_group = "radar",
    max_health = 500,
    corpse = "radar-remnants",
    dying_explosion = "radar-explosion",
    resistances =
    {
      {
        type = "fire",
        percent = 70
      },
      {
        type = "impact",
        percent = 30
      }
    },
    collision_box = {{-2.2, -2.2}, {2.2, 2.2}},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    damaged_trigger_effect = hit_effects.entity(),
    energy_per_sector = "50MJ",
    max_distance_of_sector_revealed = 25,
    max_distance_of_nearby_sector_revealed = 0,
    energy_per_nearby_scan = "10MJ",
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input"
    },
    energy_usage = "10MW",
    integration_patch =
    {
      filename = "__base__/graphics/entity/radar/radar-integration.png",
      priority = "low",
      width = 238,
      height = 216,
      shift = util.by_pixel(1.5, 4.0),
      scale = 0.8
    },
    pictures =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/radar/radar.png",
          priority = "low",
          width = 196,
          height = 254,
          apply_projection = false,
          direction_count = 64,
          line_length = 8,
          shift = util.by_pixel(1.0, -16.0),
          scale = 0.8
        },
        {
          filename = "__base__/graphics/entity/radar/radar-shadow.png",
          priority = "low",
          width = 336,
          height = 170,
          apply_projection = false,
          direction_count = 64,
          line_length = 8,
          shift = util.by_pixel(39.0, 6.0),
          draw_as_shadow = true,
          scale = 0.8
        }
      }
    },
    impact_category = "metal",
    working_sound =
    {
      sound = {filename = "__base__/sound/radar.ogg", volume = 0.8, modifiers = volume_multiplier("main-menu", 2.0)},
      max_sounds_per_prototype = 3,
      use_doppler_shift = false
    },
    radius_minimap_visualisation_color = {0.059, 0.092, 0.235, 0.275},
    rotation_speed = 0.01,
    water_reflection =
    {
      pictures =
      {
        filename = "__base__/graphics/entity/radar/radar-reflection.png",
        priority = "extra-high",
        width = 28,
        height = 32,
        shift = util.by_pixel(5, 35),
        variation_count = 1,
        scale = 5
      },
      rotate = false,
      orientation_to_variation = false
    },
    is_military_target = false,
    circuit_connector = circuit_connector_definitions["radar"],
    circuit_wire_max_distance = default_circuit_wire_max_distance
  },
})
local particle_animations = require("__TFMG__/prototypes/particle-animations")

local water_trigger_effect = data.raw["optimized-particle"]["metallic-asteroid-chunk-particle-small"].ended_in_water_trigger_effect

local make_particle = function(params)

  if not params then error("No params given to make_particle function") end
  local name = params.name or error("No name given")

  return {
    type = "optimized-particle",
    name = name,

    life_time = params.life_time or (60 * 15),
    fade_away_duration = params.fade_away_duration,

    render_layer = params.render_layer or "projectile",
    render_layer_when_on_ground = params.render_layer_when_on_ground or "corpse",

    regular_trigger_effect_frequency = params.regular_trigger_effect_frequency or 2,
    regular_trigger_effect = params.regular_trigger_effect,
    ended_in_water_trigger_effect = water_trigger_effect,

    pictures = params.pictures,
    shadows = params.shadows,
    draw_shadow_when_on_ground = params.draw_shadow_when_on_ground,

    movement_modifier_when_on_ground = params.movement_modifier_when_on_ground,
    movement_modifier = params.movement_modifier,
    vertical_acceleration = params.vertical_acceleration,

    mining_particle_frame_speed = params.mining_particle_frame_speed
  }
end

local particles = {
  make_particle{
    name = "ferric-asteroid-chunk-particle-small",
    life_time = 25,
    pictures = particle_animations.get_ferric_asteroid_particle_small_pictures(),
    shadows = particle_animations.get_ferric_asteroid_particle_small_pictures({tint=shadowtint(), shift=util.by_pixel(1,0)}),
    regular_trigger_effect = nil,
    render_layer_when_on_ground = "lower-object-above-shadow"
  },
  make_particle{
    name = "ferric-asteroid-chunk-particle-medium",
    life_time = 45,
    pictures = particle_animations.get_ferric_asteroid_particle_medium_pictures(),
    shadows = particle_animations.get_ferric_asteroid_particle_medium_pictures({tint=shadowtint(), shift=util.by_pixel(1,0)}),
    regular_trigger_effect = nil,
    render_layer_when_on_ground = "lower-object-above-shadow"
  },
  make_particle{
    name = "ferric-asteroid-particle-top-small",
    life_time = 82,
    pictures = particle_animations.get_ferric_asteroid_particle_top_small_pictures(),
    shadows = particle_animations.get_ferric_asteroid_particle_top_small_pictures({tint=shadowtint(), shift=util.by_pixel(1,0)}),
    regular_trigger_effect = nil,
    render_layer = "air-object",
    render_layer_when_on_ground = "lower-object-above-shadow",
    movement_modifier = 0.1
  },

  make_particle{
    name = "ferric-asteroid-particle-top-big",
    life_time = 78,
    pictures = particle_animations.get_ferric_asteroid_particle_top_big_pictures(),
    shadows = particle_animations.get_ferric_asteroid_particle_top_big_pictures({tint=shadowtint(), shift=util.by_pixel(1,0)}),
    regular_trigger_effect = nil,
    render_layer = "air-object",
    render_layer_when_on_ground = "lower-object-above-shadow",
    movement_modifier = 0.1
  },

  make_particle{
    name = "ferric-asteroid-particle-top-huge",
    life_time = 64,
    pictures = particle_animations.get_ferric_asteroid_particle_top_big_pictures({scale = 1}),
    shadows = particle_animations.get_ferric_asteroid_particle_top_big_pictures({tint=shadowtint(), shift=util.by_pixel(1,0)}),
    regular_trigger_effect = nil,
    render_layer = "air-object",
    render_layer_when_on_ground = "lower-object-above-shadow",
    movement_modifier = 0.1
  },
  make_particle{
    name = "ferric-asteroid-particle-small",
    life_time = 120,
    pictures = particle_animations.get_ferric_asteroid_particle_small_pictures(),
    shadows = particle_animations.get_ferric_asteroid_particle_small_pictures({tint=shadowtint(), shift=util.by_pixel(1,0)}),
    regular_trigger_effect = nil,
    render_layer_when_on_ground = "lower-object-above-shadow",
    movement_modifier = 0.1
  },
  make_particle{
    name = "ferric-asteroid-particle-medium",
    life_time = 200,
    pictures = particle_animations.get_ferric_asteroid_particle_medium_pictures(),
    shadows = particle_animations.get_ferric_asteroid_particle_medium_pictures({tint=shadowtint(), shift=util.by_pixel(1,0)}),
    regular_trigger_effect = nil,
    render_layer_when_on_ground = "lower-object-above-shadow",
    movement_modifier = 0.1
  },
  make_particle{
    name = "ferric-asteroid-particle-big",
    life_time = 160,
    pictures = particle_animations.get_ferric_asteroid_particle_big_pictures(),
    shadows = particle_animations.get_ferric_asteroid_particle_big_pictures({tint=shadowtint(), shift=util.by_pixel(1,0)}),
    regular_trigger_effect = nil,
    render_layer_when_on_ground = "lower-object-above-shadow",
    movement_modifier = 0.1
  },
}

data:extend(particles)

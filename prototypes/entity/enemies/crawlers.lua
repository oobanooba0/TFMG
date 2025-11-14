local sounds = require ("__base__.prototypes.entity.sounds")
local hit_effects = require ("__base__.prototypes.entity.hit-effects")

small_crawler_scale = 0.5
small_crawler_tint1 = {0.60, 0.58, 0.51, 1}
small_crawler_tint2 = {0.62, 0.55, 0.2, 0.7}


local make_unit_melee_ammo_type = function(damage_value)
  return
  {
    target_type = "entity",
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          type = "damage",
          damage = { amount = damage_value , type = "physical"}
        }
      }
    }
  }
end

data:extend({
  {
    type = "unit",
    name = "small-crawler",
    icon = "__base__/graphics/icons/small-biter.png",
    flags = {"placeable-player", "placeable-enemy", "placeable-off-grid", "not-repairable", "breaths-air"},
    max_health = 100,
    order = "b-a-a",
    subgroup = "enemies",
    --factoriopedia_simulation = simulations.factoriopedia_small_biter,
    resistances = {},
    --healing_per_tick = -0.01,
    collision_box = {{-0.2, -0.2}, {0.2, 0.2}},
    selection_box = {{-0.4, -0.7}, {0.4, 0.4}},
    damaged_trigger_effect = hit_effects.biter(),
    attack_parameters =
    {
      type = "projectile",
      range = 0.5,
      cooldown = 35,
      cooldown_deviation = 0.15,
      ammo_category = "melee",
      ammo_type = make_unit_melee_ammo_type(20),
      sound = sounds.biter_roars(0.35),
      animation = biterattackanimation(small_crawler_scale, small_crawler_tint1, small_crawler_tint2),
      range_mode = "bounding-box-to-bounding-box"
    },
    impact_category = "organic",
    vision_distance = 30,
    movement_speed = 0.2,
    distance_per_frame = 0.125,
    distraction_cooldown = 300,
    min_pursue_time = 10 * 60,
    max_pursue_distance = 50,
    corpse = "small-biter-corpse",
    dying_explosion = "small-biter-die",
    dying_sound = sounds.biter_dying(0.5),
    working_sound = sounds.biter_calls(0.4, 0.75),
    run_animation = biterrunanimation(small_crawler_scale, small_crawler_tint1, small_crawler_tint2),
    running_sound_animation_positions = {2,},
    walking_sound = sounds.biter_walk(0, 0.3),
    ai_settings = biter_ai_settings,
    water_reflection = biter_water_reflection(small_biter_scale)
  },
  add_biter_die_animation(small_crawler_scale, small_crawler_tint1, small_crawler_tint2,
  {
    type = "corpse",
    name = "small-biter-corpse",
    icon = "__base__/graphics/icons/small-biter-corpse.png",
    selection_box = {{-0.8, -0.8}, {0.8, 0.8}},
    selectable_in_game = false,
    hidden_in_factoriopedia = true,
    subgroup="corpses",
    order = "c[corpse]-a[biter]-a[small]",
    flags = {"placeable-neutral", "placeable-off-grid", "building-direction-8-way", "not-repairable", "not-on-map"}
  }),
})
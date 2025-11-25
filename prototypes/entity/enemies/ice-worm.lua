local space_age_sounds = require("__TFMG__.prototypes.entity.sounds")
local function ice_worm_spritesheet(file_name, is_shadow, scale)
  is_shadow = is_shadow or false
  return util.sprite_load("__space-age__/graphics/entity/lavaslug/lavaslug-" .. file_name,
  {
    direction_count = 128,
    dice = 0, -- dicing is incompatible with sprite alpha masking, do not attempt
    draw_as_shadow = is_shadow,
    scale = scale,
    multiply_shift = scale * 2,
    surface = "vulcanus",
    usage = "enemy"
  })
end
local ice_worm_overkill_fraction = 0.2
local ice_worm_segment_scales ={
  1.09,
  1.27,
  1.36,
  1.36,
  1.36,
  1.36,
  1.33,
  1.30,
  1.37,
  1.52,
  1.52,
  1.40,
  1.41,
  1.28,
  1.28,
  1.17,
  1.10,
  1.08,
  1.08,
  1.09,
  1.20,
  1.20,
  1.10,
  1.10,
  0.99,
  0.99,
  0.99,
  0.87,
  0.87,
  0.97,
  0.87,
  0.97,
  0.99,
  0.87,
  0.87,
  0.87,
  0.87,
  0.77,
  0.77,
  0.65,
  0.64,
}
local ice_worm_resistances = {}
local ice_worm_body_resistances = {}
local ice_worm_cloud_duration = 60 * 5
local ice_worm_cloud_repeats = 2
local ice_worm_expanding_cloud_steps = 30
local ice_worm_expanding_cloud_interval = 10

local ice_worm_map_colour = {0.5,0.5,0.8,0.1}

local ice_worm_enraged_attack = {{
  time_cooldown = 5,
  effect = {
    {
      type = "script",
      effect_id = "spawn-hatchling",
      probability = 0.05,
    },
  }
  }}

function make_segment_name(base_name, scale)
  return base_name.."-x"..string.gsub(tostring(scale), "%.", "_")
end

function make_ice_worm_ash_cloud_update_effect(base_name)
  local effects = {}

  table.insert(effects,
  {
    type = "nested-result",
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        source_effects =
        {
          type = "create-entity",
          entity_name = "big-demolisher-expanding-ash-cloud-1",
        }
      }
    }
  })

  for i = 2, ice_worm_expanding_cloud_steps do
    table.insert(effects,
    {
      type = "nested-result",
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "delayed",
          delayed_trigger = "big-demolisher-expanding-ash-cloud-delay-" .. i
        }
      }
    })
  end
  table.insert(effects,
  {
    type = "nested-result",
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "delayed",
        delayed_trigger = "big-demolisher-ash-cloud-delay"
      }
    }
  })

  return {
    time_cooldown = ice_worm_expanding_cloud_interval * ice_worm_expanding_cloud_steps + (1 + ice_worm_cloud_repeats) * ice_worm_cloud_duration,
    effect = effects
  }
end

function make_ice_worm_head(base_name, order, scale, damage_multiplier, health, regen, speed_multiplier, sounds)
  local effect_multiplier = 2 * scale

  return
  {
    name = base_name,
    type = "segmented-unit",
    icon = "__space-age__/graphics/icons/big-demolisher.png",
    flags = {"placeable-player", "placeable-neutral", "placeable-off-grid", "not-repairable"},
    selectable_in_game = false,
    created_effect = {--pain in the ass, but the trigger needs to be delayed so we can get the segmented unit. Which doesnt exist until after the trigger happens normally.
      type = "direct",
      action_delivery = {
        type = "delayed",
        delayed_trigger = "ice-worm-created-delay"
      }
    },
    map_color = ice_worm_map_colour,
    max_health = health,
    order = order,
    subgroup = "enemies",
    resistances = ice_worm_resistances,
    impact_category = "organic",
    healing_per_tick = regen,
    collision_box = {{-3 * scale, -3 * scale}, {3 * scale, 3 * scale}},
    selection_box = {{-3 * scale, -3 * scale}, {3 * scale, 3 * scale}},
    collision_mask = {layers = {}},
    drawing_box_vertical_extension = 4.0 * scale,
    is_military_target = true,
    overkill_fraction = ice_worm_overkill_fraction,
    vision_distance = 0,
    ticks_per_scan = 99999,
    territory_radius = (1.5*scale)+1,
    enraged_duration = 0,--must be zero since this messes with attack scripts
    patrolling_speed = 2.0 * speed_multiplier / 60,
    investigating_speed = 6.0 * speed_multiplier / 60, 
    attacking_speed = 5.0 * speed_multiplier / 60, 
    enraged_speed = 5.0 * speed_multiplier / 60, 
    acceleration_rate = 1 * speed_multiplier / 60 / 60, -- 1 tile per second per second
    turn_radius = (12 * scale) + 20 , -- tiles
    patrolling_turn_radius = (32*scale)+60, -- tiles--current result great
    turn_smoothing = 0, -- fraction of the total turning range (based on turning radius)
    roar = sounds.roar,
    roar_probability = sounds.roar_probability,
    hurt_roar = sounds.hurt_roar,
    hurt_thresholds = sounds.hurt_thresholds,
    working_sound =
    {
      sound = {
        filename = "__space-age__/sound/world/semi-persistent/distant-rumble-2.ogg", 
        volume = 1, 
        audible_distance_modifier = 0.8,
        speed = 1
    },
      max_sounds_per_prototype = 1,
      match_volume_to_activity = true
    },
    backward_padding = -2.5 * scale, -- tiles
    render_layer = "higher-object-under",
    update_effects ={{
      distance_cooldown = 4 * scale,
      effect ={{
          type = "create-smoke",
          entity_name = "big-demolisher-ash-cloud-trail",
          show_in_tooltip = false
        }}
      }},
    update_effects_while_enraged = ice_worm_enraged_attack,
    segment_engine =
    {
      segments = make_ice_worm_segment_specifications(base_name, ice_worm_segment_scales, scale)
    },
  }
end


function make_ice_worm_segment(base_name, scale, damage_multiplier, health, sounds)
  local effect_multiplier = 2 * scale

  return
  {
    name = make_segment_name(base_name.."-segment", scale),
    type = "segment",
    selectable_in_game = false,
    map_color = ice_worm_map_colour,
    --map_color = {0,0,0,0.5},--this ones for debug
    localised_name = {"entity-name.ice_worm-segment", {"entity-name."..base_name}},
    hidden = true,
    flags = {"not-repairable", "not-in-kill-statistics"},
    max_health = health,
    impact_category = "organic",
    resistances = ice_worm_body_resistances,
    collision_box = {{-3 * scale, -3 * scale}, {3 * scale, 3 * scale}},
    selection_box = {{-3 * scale, -3 * scale}, {3 * scale, 3 * scale}},
    collision_mask = {layers = {}},
    drawing_box_vertical_extension = 4.0 * scale,
    is_military_target = true,
    overkill_fraction = ice_worm_overkill_fraction,
    forward_overlap = 2,
    forward_padding = -0.5 * scale, -- tiles
    backward_padding = 1.5 * scale, -- tiles
    render_layer = "higher-object-under",
    working_sound = sounds.segment_working_sound,
    dying_sound_volume_modifier = sounds.dying_sound_volume_modifier,

    update_effects =
    {
      --rocks
      {
        distance_cooldown = 1 / effect_multiplier,
        effect =
        {
          {
            type = "create-particle",
            repeat_count = 3 * effect_multiplier,
            particle_name = "vulcanus-stone-particle-small",
            offset_deviation = {{-2.15 * effect_multiplier, -2.15 * effect_multiplier}, {2.15 * effect_multiplier, 2.15 * effect_multiplier}},
            initial_height = 0,
            initial_vertical_speed = 0.05,
            initial_vertical_speed_deviation = 0.02,
            speed_from_center = 0.02,
            speed_from_center_deviation = 0.01,
            only_when_visible = true,
            rotate_offsets = true
          },
          {
            type = "create-particle",
            repeat_count = 4 * effect_multiplier,
            particle_name = "vulcanus-stone-particle-medium",
            offset_deviation = {{-2.15 * effect_multiplier, -2.15 * effect_multiplier}, {2.15 * effect_multiplier, 2.15 * effect_multiplier}},
            initial_height = 0,
            initial_vertical_speed = 0.05,
            initial_vertical_speed_deviation = 0.02,
            speed_from_center = 0.02,
            speed_from_center_deviation = 0.01,
            only_when_visible = true,
            rotate_offsets = true
          },
          {
            type = "create-particle",
            repeat_count = math.max(1, effect_multiplier),
            particle_name = "vulcanus-stone-particle-big",
            offset_deviation = {{-2.15 * effect_multiplier, -2.15 * effect_multiplier}, {2.15 * effect_multiplier, 2.15 * effect_multiplier}},
            initial_height = 0,
            initial_vertical_speed = 0.05,
            initial_vertical_speed_deviation = 0.02,
            speed_from_center = 0.02,
            speed_from_center_deviation = 0.01,
            only_when_visible = true,
            rotate_offsets = true
          }
        }
      },
    },
    update_effects_while_enraged = ice_worm_enraged_attack,
  }
end

function make_ice_worm_tail(base_name, scale, damage_multiplier, health, sounds)
  return
  {
    name = make_segment_name(base_name.."-tail", scale),
    type = "segment",
    selectable_in_game = false,
    localised_name = {"entity-name.ice_worm-tail", {"entity-name."..base_name}},
    hidden = true,
    flags = {"not-repairable", "not-in-kill-statistics"},
    map_color = ice_worm_map_colour,
    collision_mask = {layers = {}},
    max_health = health,
    impact_category = "organic",
    resistances = ice_worm_body_resistances,
    collision_box = {{-3 * scale, -3 * scale}, {3 * scale, 3 * scale}},
    selection_box = {{-3 * scale, -3 * scale}, {3 * scale, 3 * scale}},
    drawing_box_vertical_extension = 4.0 * scale,
    is_military_target = true,
    overkill_fraction = ice_worm_overkill_fraction,
    --animation =
    --{
    --  layers =
    --  {
    --    ice_worm_spritesheet("tail-shadow", true, 0.5 * scale),
    --  },
    --},
    forward_overlap = 2,
    forward_padding = -2.75 * scale, -- tiles
    render_layer = "higher-object-under",
    working_sound = sounds.tail_working_sound,
  }
end

function make_ice_worm_segment_specifications(base_name, segment_scales, scale)
  local specifications = {}
  local num_segments = #segment_scales
  for i = 1,num_segments do
    local segment_scale = segment_scales[i] * scale
    if i < num_segments then
      specifications[i] = { segment = make_segment_name(base_name.."-segment", segment_scale) }
    else
      specifications[i] = { segment = make_segment_name(base_name.."-tail", segment_scale) }
    end
  end
  return specifications
end

function make_ice_worm_segments(base_name, segment_scales, scale, damage_multiplier, health, sounds)
  local existing = {}
  local prototypes = {}
  local num_segments = #segment_scales
  for i = 1,num_segments do
    local segment_scale = segment_scales[i] * scale
    if i < num_segments then
      if not existing[make_segment_name(base_name.."-segment", segment_scale)] then
        existing[make_segment_name(base_name.."-segment", segment_scale)] = true
        table.insert(prototypes, make_ice_worm_segment(base_name, segment_scale, damage_multiplier, health, sounds))
      end
    else
      if not existing[make_segment_name(base_name.."-tail", segment_scale)] then
        existing[make_segment_name(base_name.."-tail", segment_scale)] = true
        table.insert(prototypes, make_ice_worm_tail(base_name, segment_scale, damage_multiplier, health, sounds))
      end
    end
  end
  return prototypes
end

function make_ice_worm(base_name, order, scale, damage_multiplier, health, regen, speed_multiplier, sounds)
  data:extend({make_ice_worm_head(base_name, order, scale, damage_multiplier, health, regen, speed_multiplier, sounds)})
  data:extend(make_ice_worm_segments(base_name, ice_worm_segment_scales, scale, damage_multiplier, health, sounds))
end

-- With a few damage and rate of fire upgrades the engineer can easily be at 60 DPS if Vulcanus is the first new planet.
make_ice_worm("small-ice-worm", "a-a", 0.8, 1, 8000000, 1000, 0.5, space_age_sounds.demolisher.small)
make_ice_worm("medium-ice-worm", "a-b", 2, 1.5, 50000000, 1000, 0.7, space_age_sounds.demolisher.medium)
make_ice_worm("big-ice-worm", "a-c", 5, 2.5, 1000000000, 1000, 1, space_age_sounds.demolisher.big)

data:extend({
  {--ice worm creation delayed trigger
    type = "delayed-active-trigger",
    name = "ice-worm-created-delay",
    action = {
      type = "direct",
      action_delivery = {
        type = "instant",
        target_effects = {
          type = "script",
          effect_id = "ice-worm-created"
        }
      }
    },
    delay = 1,
    cancel_when_source_is_destroyed = true,
  },

})
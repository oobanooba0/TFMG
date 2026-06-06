local sound_util = require("__TFMG__/util/sound-util")

--playback speeds of the sounds based on worm size
local small_worm_speed = 1.25
local medium_worm_speed = 1
local big_worm_speed = 0.75
--multiplies the playback speed of worm movement sounds. Ice worms are BIG, so a very deep rumble feels more "right"
local movement_speed_multiplier = 0.25

local seconds = 60


--sound prototypes, for use by runtime scripting.
--because of the panned sound trick, and the need to maintian consistency on what sound different players hear, I think i need to create a sound prototype for each sound clip.

sound_util.extend_panned_sound_with_variations("__TFMG-assets-0__/sounds/enemy/ice-worm","ice-worm-roar",10,2)

data:extend({
  {
    type = "sound",
    name = "ice-worm-roar",
    category = "enemy",
    variations = sound_util.sound_variations_with_speed("__TFMG-assets-0__/sounds/enemy/ice-worm/center/ice-worm-roar", 10, 1,nil,1),
    advanced_volume_control =
    {
      attenuation = "exponential",
      fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 40.0}, to = {2.0, 100.0 }}},
    },
    audible_distance_modifier = 5,
  }
})




--sound definitions for use by other prototypes

local ice_worm_sounds = {}

ice_worm_sounds =
{
  small =
  {
    roar =
    {
      category = "enemy",
      variations = sound_util.sound_variations_with_speed("__TFMG-assets-0__/sounds/enemy/ice-worm/center/ice-worm-roar", 10, 1,nil,small_worm_speed),
      advanced_volume_control =
      {
        attenuation = "exponential",
        fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 40.0}, to = {2.0, 100.0 }}},
      },
      audible_distance_modifier = 10,
    },
    roar_probability = sound_util.average_wait(120,seconds),
    hurt_roar =
    {
      variations = sound_util.sound_variations_with_speed("__TFMG-assets-0__/sounds/enemy/ice-worm/center/ice-worm-hurt", 1, 1,nil,small_worm_speed),
      advanced_volume_control =
      {
        attenuation = "exponential",
        fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 40.0}, to = {2.0, 100.0 }}},
      },
      audible_distance_modifier = 6.25,
    },
    hurt_thresholds = {0.9, 0.75, 0.5, 0.25, 0.1},

    segment_working_sound =
    {
      sound =
      {
        category = "enemy",
        filename = "__space-age__/sound/enemies/demolisher/demolisher-moves.ogg",
        speed = small_worm_speed * movement_speed_multiplier,
        volume = 0.25,
        advanced_volume_control = {attenuation = "exponential"},
      },
      max_sounds_per_prototype = 4,
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },

    tail_working_sound =
    {
      sound =
      {
        category = "enemy",
        filename = "__space-age__/sound/enemies/demolisher/demolisher-tail-rumble.ogg", volume = 0.3,
        speed = small_worm_speed * movement_speed_multiplier,
        advanced_volume_control =
        {
          attenuation = "exponential",
          fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 20.0}, to = {2.0, 100.0 }}},
        },
      },
      max_sounds_per_prototype = 2,
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },

    dying_sound_volume_modifier = 0.6,
  },
  medium =
  {
    roar =
    {
      category = "enemy",
      variations = sound_util.sound_variations_with_speed("__TFMG-assets-0__/sounds/enemy/ice-worm/center/ice-worm-roar", 10, 1,nil,medium_worm_speed),
      advanced_volume_control =
      {
        attenuation = "exponential",
        fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 50.0}, to = {2.0, 100.0 }}},
      },
      audible_distance_modifier = 15,
    },
    roar_probability = sound_util.average_wait(120,seconds),
    hurt_roar =
    {
      variations = sound_util.sound_variations_with_speed("__TFMG-assets-0__/sounds/enemy/ice-worm/center/ice-worm-hurt", 1, 1,nil,medium_worm_speed),
      advanced_volume_control =
      {
        attenuation = "exponential",
        fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 50.0}, to = {2.0, 100.0 }}},
      },
      audible_distance_modifier = 6.25,
    },
    hurt_thresholds = {0.9, 0.75, 0.5, 0.25, 0.1},

    segment_working_sound =
    {
      sound =
      {
        category = "enemy",
        filename = "__space-age__/sound/enemies/demolisher/demolisher-moves.ogg",
        speed = medium_worm_speed * movement_speed_multiplier,
        volume = 0.6,
        advanced_volume_control = {attenuation = "exponential"},
      },
      max_sounds_per_prototype = 4,
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },

    tail_working_sound =
    {
      sound =
      {
        category = "enemy",
        filename = "__space-age__/sound/enemies/demolisher/demolisher-tail-rumble.ogg", volume = 0.3,
        speed = medium_worm_speed * movement_speed_multiplier,
        advanced_volume_control =
        {
          attenuation = "exponential",
          fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 20.0}, to = {2.0, 100.0 }}},
        },
      },
      max_sounds_per_prototype = 2,
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },

    dying_sound_volume_modifier = 0.8,
  },
  big =
  {
    roar =
    {
      category = "enemy",
      variations = sound_util.sound_variations_with_speed("__TFMG-assets-0__/sounds/enemy/ice-worm/center/ice-worm-roar", 10, 1,nil,big_worm_speed),
      advanced_volume_control =
      {
        attenuation = "exponential",
        fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 60.0}, to = {2.0, 100.0 }}},
      },
      audible_distance_modifier = 40,
    },
    roar_probability = sound_util.average_wait(120,seconds),
    hurt_roar =
    {
      variations = sound_util.sound_variations_with_speed("__TFMG-assets-0__/sounds/enemy/ice-worm/center/ice-worm-hurt", 1, 1,nil,big_worm_speed),
      advanced_volume_control =
      {
        attenuation = "exponential",
        fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 60.0}, to = {2.0, 100.0 }}},
      },
      audible_distance_modifier = 6.25,
    },
    hurt_thresholds = {0.9, 0.75, 0.5, 0.25, 0.1},

    segment_working_sound =
    {
      sound =
      {
        category = "enemy",
        filename = "__space-age__/sound/enemies/demolisher/demolisher-moves.ogg",
        speed = big_worm_speed * movement_speed_multiplier,
        volume = 1,
        advanced_volume_control = {attenuation = "exponential"},
      },
      max_sounds_per_prototype = 4,
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },

    tail_working_sound =
    {
      sound =
      {
        category = "enemy",
        filename = "__space-age__/sound/enemies/demolisher/demolisher-tail-rumble.ogg", volume = 0.3,
        speed = big_worm_speed * movement_speed_multiplier,
        advanced_volume_control =
        {
          attenuation = "exponential",
          fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 20.0}, to = {2.0, 100.0 }}},
        },
      },
      max_sounds_per_prototype = 2,
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },

    dying_sound_volume_modifier = 1.0,
  }
}



return ice_worm_sounds
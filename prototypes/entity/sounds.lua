require("__TFMG__/prototypes/entity/sound-util")
local sounds = {}
--ferric asteroid sounds

sounds.asteroid_collision_ferric_small = {
  category = "game-effect",
  variations = sound_variations("__space-age__/sound/entity/asteroid/asteroid-collision-metallic-small", 7, 0.3),
  aggregation = {max_count = 3, remove = true, count_already_playing = true},
  audible_distance_modifier = 0.75
}
sounds.asteroid_damage_ferric_small = {
  category = "game-effect",
  variations = sound_variations("__space-age__/sound/entity/asteroid/asteroid-damage-metallic-small", 6, 0.5),
  aggregation = {max_count = 3, remove = true, count_already_playing = true},
  audible_distance_modifier = 0.75
}
sounds.asteroid_damage_ferric_medium = {
  category = "game-effect",
  variations = sound_variations("__space-age__/sound/entity/asteroid/asteroid-damage-metallic-medium", 5, 0.45),
  aggregation = {max_count = 3, remove = true, count_already_playing = true},
}
sounds.asteroid_damage_ferric_big = {
  category = "game-effect",
  variations = sound_variations("__space-age__/sound/entity/asteroid/asteroid-damage-metallic-big", 7, 0.5),
  aggregation = {max_count = 2, remove = true, count_already_playing = true},
}
sounds.asteroid_damage_ferric_huge = {
  category = "game-effect",
  variations = sound_variations("__space-age__/sound/entity/asteroid/asteroid-damage-metallic-huge", 3, 0.7),
  aggregation = {max_count = 2, remove = true, count_already_playing = true},
  audible_distance_modifier = 2
}
--crystalline asteroid sounds
  sounds.asteroid_damage_crystalline_small =
  {
    category = "game-effect",
    variations = sound_variations("__space-age__/sound/entity/asteroid/asteroid-damage-interstellar-small", 7, 0.3),
    aggregation = {max_count = 3, remove = true, count_already_playing = true},
    audible_distance_modifier = 0.5
  }
  sounds.asteroid_damage_crystalline_medium =
  {
    category = "game-effect",
    variations = sound_variations("__space-age__/sound/entity/asteroid/asteroid-damage-interstellar-medium", 6, 0.5),
    aggregation = {max_count = 3, remove = true, count_already_playing = true},
  }
  sounds.asteroid_damage_crystalline_big =
  {
    category = "game-effect",
    variations = sound_variations("__space-age__/sound/entity/asteroid/asteroid-damage-interstellar-big", 6, 0.5),
    aggregation = {max_count = 2, remove = true, count_already_playing = true},
  }
  sounds.asteroid_damage_crystalline_huge =
  {
    category = "game-effect",
    variations = sound_variations("__space-age__/sound/entity/asteroid/asteroid-damage-interstellar-huge", 4, 0.9),
    aggregation = {max_count = 2, remove = true, count_already_playing = true},
    audible_distance_modifier = 4
  }


local small_worm_speed = 0.4
local medium_worm_speed = 0.25
local big_worm_speed = 0.15

sounds.demolisher =
{
  small =
  {
    roar =
    {
      category = "enemy",
      variations = sound_variations_with_speed("__space-age__/sound/enemies/demolisher/demolisher-roar", 10, 1,volume_multiplier("main-menu", 2),small_worm_speed),
      advanced_volume_control =
      {
        attenuation = "exponential",
        fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 40.0}, to = {2.0, 100.0 }}},
      },
      audible_distance_modifier = 10,
    },
    roar_probability = 1 / (60 * 600), -- average pause between roars is 600 seconds
    hurt_roar =
    {
      variations = sound_variations("__space-age__/sound/enemies/demolisher/demolisher-hurt-roar", 5, 1.0),
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
        speed = small_worm_speed,
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
        speed = small_worm_speed,
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
      variations = sound_variations_with_speed("__space-age__/sound/enemies/demolisher/demolisher-roar", 10, 1,nil, medium_worm_speed),
      advanced_volume_control =
      {
        attenuation = "exponential",
        fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 50.0}, to = {2.0, 100.0 }}},
      },
      audible_distance_modifier = 15,
    },
    roar_probability = 1 / (60 * 600), -- average pause between roars is 600 seconds
    hurt_roar =
    {
      variations = sound_variations("__space-age__/sound/enemies/demolisher/demolisher-hurt-roar", 5, 1.0),
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
        speed = medium_worm_speed,
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
        speed = medium_worm_speed,
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
      variations = sound_variations_with_speed("__space-age__/sound/enemies/demolisher/demolisher-roar", 10, 1,nil,big_worm_speed),
      advanced_volume_control =
      {
        attenuation = "exponential",
        fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 60.0}, to = {2.0, 100.0 }}},
      },
      audible_distance_modifier = 40,
    },
    roar_probability = 1 / (60 * 600), -- average pause between roars is 600 seconds
    hurt_roar =
    {
      variations = sound_variations("__space-age__/sound/enemies/demolisher/demolisher-hurt-roar", 5, 1.0),
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
        speed = big_worm_speed,
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
        speed = big_worm_speed,
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

return sounds
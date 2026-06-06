local sound_util = {}

  ---@param filename_string #name of file, without the -1.ogg at the end
  ---| string
  ---@param variations #number of variations
  ---| int
  ---@param volume_parameter #multiplier to the volume of the sound
  ---| int
  ---@param modifiers_parameter #modifiers to apply to the sound
  ---| any
  ---@param speed_parameter #multiplier to the playback speed of the sound
  ---| int
  function sound_util.sound_variations_with_speed(filename_string, variations, volume_parameter, modifiers_parameter, speed_parameter)
    --this function is somewhat clunky, you'll probably be catching me rewriting this function at some point.
    local result = {}
    for i = 1,variations do
      result[i] = { filename = filename_string .. "-" .. i .. ".ogg", volume = volume_parameter or 0.5, speed = speed_parameter or 1}
      if modifiers_parameter then
        result[i].modifiers = modifiers_parameter
      end
    end
    return result
  end

  function sound_util.extend_panned_sound_with_variations(path,name,variations,volume)
    for i = 1,variations do
      local name_with_variation = name.."-"..i
      sound_util.extend_panned_sound(path,name_with_variation,volume)
    end
  end

  function sound_util.extend_panned_sound(path,name,volume)
    local left_sound = {
      type = "sound",
      name = name.."-l",
      category = "enemy",
      filename = path.."/left/"..name..".ogg",
      volume = volume,
    }
    local right_sound = {
      type = "sound",
      name = name.."-r",
      category = "enemy",
      filename = path.."/right/"..name..".ogg",
      volume = volume,
    }
    data:extend({left_sound,right_sound})
  end
  
  function sound_util.average_wait(t,unit) --this function seems too small to be meaningful, but it does help code readability a tiny bit.
    local chance = 1 / (t * unit)
  return chance end

return sound_util

function sound_variations_with_speed(filename_string, variations, volume_parameter, modifiers_parameter, speed_parameter)
  local result = {}
  for i = 1,variations do
    result[i] = { filename = filename_string .. "-" .. i .. ".ogg", volume = volume_parameter or 0.5, speed = speed_parameter}
    if modifiers_parameter then
      result[i].modifiers = modifiers_parameter
    end
  end
  return result
end
local asteroid_functions = {}

asteroid_functions.standard_speed = 1 * meter/second

asteroid_functions.weighted_average = function(A, B, weight)
  local result = A + ((B-A)*weight)
  return result
end

asteroid_functions.chunk_angle = 1
asteroid_functions.small_angle = 0.7
asteroid_functions.medium_angle = 0.6
asteroid_functions.big_angle = 0.5
asteroid_functions.huge_angle = 0.4

--locational asteroid definitions
  --arrival
    asteroid_functions.arrival_ratio = {0.8 , 0.2, 0}
    asteroid_functions.arrival_chunks = 0.01
    asteroid_functions.arrival_small = 0
  --near void
    asteroid_functions.near_void_ratio = {0.5 , 0.5}
    asteroid_functions.near_void_chunks = 0
    asteroid_functions.near_void_small = 0
  --limit
    asteroid_functions.limit_ratio = {0.6 , 0.4 , 0.5}
    asteroid_functions.limit_chunks = 0.012
    asteroid_functions.limit_small = 0.006



asteroid_functions.arrival_near_void =
{
  probability_on_range_chunk =
  {
    {position = 0.1, probability = asteroid_functions.arrival_chunks, angle_when_stopped = asteroid_functions.chunk_angle},
    {position = 0.9, probability = asteroid_functions.near_void_chunks, angle_when_stopped = asteroid_functions.chunk_angle},
  },
  type_ratios =
  {
    {position = 0.1, ratios = asteroid_functions.arrival_ratio},
    {position = 0.9, ratios = asteroid_functions.near_void_ratio},
  }
}

asteroid_functions.arrival_limit =
{
  probability_on_range_chunk =
  {
    {position = 0.1, probability = asteroid_functions.arrival_chunks, angle_when_stopped = asteroid_functions.chunk_angle},
    {position = 0.9, probability = asteroid_functions.limit_chunks, angle_when_stopped = asteroid_functions.chunk_angle},
  },
  probability_on_range_small =
  {
    {position = 0.1, probability = asteroid_functions.arrival_small, angle_when_stopped = asteroid_functions.small_angle},
    {position = 0.9, probability = asteroid_functions.limit_small, angle_when_stopped = asteroid_functions.small_angle},
  },
  type_ratios =
  {
    {position = 0.1, ratios = asteroid_functions.arrival_ratio},
    {position = 0.9, ratios = asteroid_functions.limit_ratio},
  }
}

asteroid_functions.search_in_table = function(table, key)
  local found = false
  for k, entry in pairs(table) do
    if entry == key then
      found = true
      return found
    end
  end
  return found
end

asteroid_functions.find_lower_point = function(position, data)
  local position_data = {position = 0}
  for k, data_point in pairs(data) do
    if data_point.position <= position and data_point.position > position_data.position then
      position_data = data_point
    end
  end
  return position_data
end

asteroid_functions.find_higher_point = function(position, data)
  local position_data = {position = 1}
  for k, data_point in pairs(data) do
    if data_point.position >= position then
      if data_point.position < position_data.position then
        position_data = data_point
      end
    end
  end
  return position_data
end

asteroid_functions.interpolate_points = function(pointA, pointB, position)
  if pointA.position == pointB.position then
    return pointA.probability, pointA.angle_when_stopped or 1
  end
  local range = pointB.position - pointA.position
  local position_in_range = (position - pointA.position) / range
  local probability_difference = pointB.probability - pointA.probability
  local interpolated_probability = pointA.probability + position_in_range * probability_difference
  local angle_a = (pointA.angle_when_stopped or 1)
  local angle_b = (pointB.angle_when_stopped or 1)
  local angle_difference = angle_b - angle_a
  local interpolated_angle = angle_a + position_in_range * angle_difference
  return interpolated_probability, interpolated_angle
end

asteroid_functions.normalize_ratio = function(ratio)
  local r = {}
  local max = 0
  for k, v in pairs(ratio) do
    if v > max then
      max = v
    end
  end
  for k, v in pairs(ratio) do
    table.insert(r, v/max)
  end
  return r
end

asteroid_functions.interpolate_point_ratio = function(pointA, pointB, position)
  local interpolated_data = {position = position, ratios = {1,1,1,1}}
  for k, r in pairs(pointA.ratios) do
    local interpolated_probability, interpolated_angle = asteroid_functions.interpolate_points(
      {position = pointA.position, probability = asteroid_functions.normalize_ratio(pointA.ratios)[k]},
      {position = pointB.position, probability = asteroid_functions.normalize_ratio(pointB.ratios)[k]},
      position
    )
    interpolated_data.ratios[k] = interpolated_probability
  end
  return interpolated_data.ratios
end

asteroid_functions.asteroid_spawn_point = function(asteroid_type, ratio_data, probability_data, planet)
  -- get significant positions
  local significant_positions = {}
  for k, point in pairs(ratio_data) do
    table.insert(significant_positions, point.position)
  end

  for k, point in pairs(probability_data) do
    local point_is_already_in_table = asteroid_functions.search_in_table(significant_positions, point.position)
    if point_is_already_in_table == false then
      table.insert(significant_positions, point.position)
    end
  end

  table.sort(significant_positions)

  local spawn_points = {}
  -- fill every significant position with data and add it to spawn points
  for k, significant_position in pairs(significant_positions) do
    if planet == nil or planet == significant_position then
      local ratio_lower_point  = asteroid_functions.find_lower_point(significant_position, ratio_data)
      local ratio_higher_point = asteroid_functions.find_higher_point(significant_position, ratio_data)
      local interpolated_ratio = asteroid_functions.interpolate_point_ratio(ratio_lower_point, ratio_higher_point, significant_position)

      local probability_lower_point  = asteroid_functions.find_lower_point(significant_position, probability_data)
      local probability_higher_point = asteroid_functions.find_higher_point(significant_position, probability_data)
      local interpolated_probability, interpolated_angle = asteroid_functions.interpolate_points(probability_lower_point, probability_higher_point, significant_position)

      local spawn_point = {}
      if planet == nil then
        spawn_point = {distance = significant_position, probability = interpolated_probability * interpolated_ratio[asteroid_type], speed = asteroid_functions.standard_speed, angle_when_stopped = interpolated_angle}
      else
        spawn_point = {probability = interpolated_probability * interpolated_ratio[asteroid_type], speed = asteroid_functions.standard_speed, angle_when_stopped = interpolated_angle}
      end

      table.insert(spawn_points, spawn_point)
    end
  end

  return spawn_points
end

asteroid_functions.are_all_zero = function(table)
  local are_all_zero = true
  if table ~= nil then
    for k, v in pairs(table) do
      if v.probability ~= 0 then
        are_all_zero = false
      end
    end
  end
  return are_all_zero
end

asteroid_functions.spawn_definitions = function(data, planet)
  local asteroid_spawn_definitions = {}
  local asteroid_sizes = {"chunk", "small", "medium", "big", "huge"}
  local asteroid_types = {"ferric","crystalline","volatile"}
  for k, asteroid_size in pairs(asteroid_sizes) do
    for k, asteroid_type in pairs(asteroid_types) do
      local asteroid_name = ""
      if asteroid_size == "chunk" then
        asteroid_name = asteroid_type .. "-asteroid-chunk"
      else
        asteroid_name = asteroid_size .. "-" .. asteroid_type .. "-asteroid"
      end

      local asteroid_id = 0
      if asteroid_type == "ferric" then
        asteroid_id = 1
      elseif asteroid_type == "crystalline" then
        asteroid_id = 2
      elseif asteroid_type == "volatile" then
        asteroid_id = 3
      end

      local probability_data = {}
      if asteroid_size == "chunk" then
        probability_data = data.probability_on_range_chunk or {{position = 0.1, probability = 0, angle_when_stopped = asteroid_functions.chunk_angle}, {position = 0.9, probability = 0, angle_when_stopped = asteroid_functions.chunk_angle}}
      elseif asteroid_size == "small" then
        probability_data = data.probability_on_range_small or {{position = 0.1, probability = 0, angle_when_stopped = asteroid_functions.small_angle}, {position = 0.9, probability = 0, angle_when_stopped = asteroid_functions.small_angle}}
      elseif asteroid_size == "medium" then
        probability_data = data.probability_on_range_medium or {{position = 0.1, probability = 0, angle_when_stopped = asteroid_functions.medium_angle}, {position = 0.9, probability = 0, angle_when_stopped = asteroid_functions.medium_angle}}
      elseif asteroid_size == "big" then
        probability_data = data.probability_on_range_big or {{position = 0.1, probability = 0, angle_when_stopped = asteroid_functions.big_angle}, {position = 0.9, probability = 0, angle_when_stopped = asteroid_functions.big_angle}}
      elseif asteroid_size == "huge" then
        probability_data = data.probability_on_range_huge or {{position = 0.1, probability = 0, angle_when_stopped = asteroid_functions.huge_angle}, {position = 0.9, probability = 0, angle_when_stopped = asteroid_functions.huge_angle}}
      end

      if asteroid_functions.are_all_zero(probability_data) == false and planet == nil then
        local asteroid_definition =
        {
          asteroid = asteroid_name,
          spawn_points = asteroid_functions.asteroid_spawn_point(asteroid_id, data.type_ratios, probability_data, planet)
        }
        if asteroid_size == "chunk" then
          asteroid_definition.type = "asteroid-chunk"
        end
        table.insert(asteroid_spawn_definitions, asteroid_definition)
      end
      if planet ~= nil then
        -- if it's specifying a planet, only care about the probability on that planet, not along the whole route
        local planet_probability = asteroid_functions.asteroid_spawn_point(asteroid_id, data.type_ratios, probability_data, planet)[1].probability
        if planet_probability then
          if planet_probability > 0 then
            local asteroid_definition =
            {
              asteroid = asteroid_name,
              probability = planet_probability,
              speed = asteroid_functions.standard_speed,
              angle_when_stopped = asteroid_functions[asteroid_size.."_angle"]
            }
            if asteroid_size == "chunk" then
              asteroid_definition.type = "asteroid-chunk"
            end
            table.insert(asteroid_spawn_definitions, asteroid_definition)
          end
        end
      end
    end
  end

  return asteroid_spawn_definitions
end

return asteroid_functions

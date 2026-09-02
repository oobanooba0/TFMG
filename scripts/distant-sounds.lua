--this will be a collection of functions and utilities to simulate distant sounds

local distant_sounds = {}

function distant_sounds.play_sound_panned(data)
  local variation = data.variation
  local left_path = data.path.."-"..variation.."-l"
  local right_path = data.path.."-"..variation.."-r"

  local players = game.connected_players
  for _, player in pairs(players) do
    local player_sound_data = {
      player = player,
      surface = data.surface,
      left_path = left_path,
      right_path = right_path,
      position = data.position or {0,0},
      volume_modifier = data.volume_modifier or 1,
      max_distance = data.max_distance or 100,
      min_distance = data.min_distance or 50, --minimum distance defines the distance at which volume can start to drop off and sound panning happens.
    }
    distant_sounds.play_panned_sound_for_player(player_sound_data)
  end
end

function distant_sounds.play_panned_sound_for_player(data)
  --TFMG.block(data)
  local player = data.player
  if not player.valid or not player.connected then return end
  if player.surface ~= data.surface then return end --dont bother with anything else if theyre not on the right surface.

  local left_path = data.left_path
  if not helpers.is_valid_sound_path(left_path) then game.print(left_path.."was not a valid path") return end
  local right_path = data.right_path
  if not helpers.is_valid_sound_path(right_path) then game.print(right_path.."was not a valid path") return end
  
  --gather muh variables
  local player_position = player.position
  local volume_modifier = data.volume_modifier or 1
  local max_distance = data.max_distance or 100
  local min_distance = data.min_distance or 50
  local sound_origin = data.position

  --distance factor
  local distance = util.distance(player_position,sound_origin)
  if distance > max_distance then return end --skip out on any more calculations if the player wont hear the sound anyway.
  local distance_factor = math.min((max_distance - distance)/(max_distance - min_distance),1)
  
  --now we gotta calculate the panning factor
  local player_x = player_position.x
  local sound_x = sound_origin.x or sound_origin[1]
  local panning_factor = ((((sound_x - player_x)/(distance)) * (1 - (distance_factor^3))) * 0.5) + 0.5--panning factor is a value from 0 to 1 corresponding to left ear/right ear.
  --using a cubic on the distance factor means that when the player is close to the sound origin, it gets panned less agressively, but quickly becomes significantly panned as they leave the minimum sound distance.
  --multiply all the volume modifiers together to get an overal volume multiplier
  local left_volume = volume_modifier * distance_factor * (1 - panning_factor )
  local right_volume = volume_modifier * distance_factor * ( panning_factor )
  --It shouldnt be possible for the volume modifier to fall outside the range 0-1 but I'm bad at math so i'll clamp em anyway.
  player.play_sound({ path = left_path, volume_modifier = util.clamp(left_volume,0,1)})
  player.play_sound({ path = right_path, volume_modifier = util.clamp(right_volume,0,1)})
end


--no longer used, failed experement, but who knows, the code could be useful as refrence.


function distant_sounds.play_sound_circle(data)
  if not data.path then return end

  local players = game.connected_players
  for _,player in pairs(players) do
    local player_sound_data = {
      player = player,
      surface = data.surface,
      path = data.path,
      position = data.position or {0,0}
    }
    distant_sounds.play_sound_for_player(player_sound_data)
  end
end

function distant_sounds.play_sound_for_player(data)
  game.print(serpent.block(data))
  local player = data.player
  if not player.valid or not player.connected then return end
  if player.surface ~= data.surface then return end
  local path = data.path
  if not helpers.is_valid_sound_path(path) then return game.print(path.."was not a valid path") end
  local volume_modifier = data.volume_modifier or 1
  local sound_origin = data.position
  local player_position = player.position
  local play_position = distant_sounds.snap_sound_to_circle(player_position,sound_origin)
  player.play_sound({
    path = path,
    position = play_position,
    volume_modifier = volume_modifier,
  })
end



function distant_sounds.snap_sound_to_circle(player_position,sound_origin)
  local circle_radius = 25
  local theta = TFMG.direction(player_position,sound_origin)
  --using a direction i can find the sin and cos of theta and that should get me the x and y coordinates on the unit circle I am looking for
  local sound_x = (math.cos(theta) * circle_radius) + player_position.x
  local sound_y = (math.sin(theta) * circle_radius) + player_position.y
  local play_position = {x = sound_x, y = sound_y}
return play_position end

return distant_sounds

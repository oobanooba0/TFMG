local ice_worm = {}

function ice_worm.rocket_launched(event)
  local silo = event.rocket_silo
  if silo.surface.name ~= "nauvis" then return end
  local recent_count = storage.worms.recent_launch_count
  recent_count = recent_count + 1
  --game.print(recent_count)
  if recent_count == 1 then --if we have one recently launched rocket, we send a worm.
    ice_worm.find_close_worm(silo)
  end
end

function ice_worm.find_close_worm(silo)
  local worms = game.surfaces["nauvis"].get_segmented_units()
  if not worms[1] then return end --if there are no worms in the game, end the script
  --set up some variables to help us find the closest worm.
  local silo_position = silo.position
  local closest = 100000 --max distance to search.
  local worm_index
  for index , worm in pairs(worms) do
    local wormai = worm.get_ai_state()
    if wormai.type == 0 then
      local worm_distance = util.distance(worm.segments[1].position,silo_position)
      if worm_distance < closest then
        closest = worm_distance
        worm_index = index
      end
    end
  end
  if worm_index == nil then game.print("no close worms") return end --no worm index
  local closest_worm = worms[worm_index]
  --local closest_worm = random_table_entry(worms)
  ice_worm.send_to_silo(closest_worm,silo)
end

function ice_worm.send_to_silo(closest_worm,silo)
  TFMG.block(closest_worm)
  local ai_state = {
    type = defines.segmented_unit_ai_state.investigating,
    destination = silo.position,
  }
  closest_worm.set_ai_state(ai_state)
  table.insert(storage.worms.active_worms,{worm = closest_worm,silo = silo,order = "find silo"})
  --TFMG.block(storage.worms.active_worms)
end

function ice_worm.attack_silo(active_worm,_)
  local silo = active_worm.silo
  if not silo.valid then ice_worm.forget_worm(_) return end --if the silo is gone, we forget the worm, theyll eventually make their way back home.
  
  local worm = active_worm.worm
  local ai_state = {
    type = defines.segmented_unit_ai_state.enraged_at_nothing,
    destination = silo.position,
    last_damage_time = game.tick + 2*3600 --hang around for this long
  }
  worm.set_ai_state(ai_state)
  active_worm.order = "attack silo"
end

function ice_worm.forget_worm(_)
  --game.print("done")
  storage.worms.active_worms[_] = nil
end

function ice_worm.check_active_worms()
  local active_worms = storage.worms.active_worms
  for _,active_worm in pairs(active_worms) do
    local ai_state = active_worm.worm.get_ai_state().type
    if active_worm.order == "find silo" and ai_state == 0 then
      ice_worm.attack_silo(active_worm,_)
    elseif active_worm.order == "attack silo" then
      if ai_state == 0 then --we're done, lets forget about this worm
        ice_worm.forget_worm(_)
      end
    end
  end
end

function ice_worm.spawn_hatchling(event)
  local surface = game.surfaces[event.surface_index]
  local position = event.source_entity.position
  local rand_position = {
    position.x + math.random(-10,10),
    position.y + math.random(-10,10)
  }
  local spawn_position = surface.find_non_colliding_position("crawler-explosion",rand_position,16,1,true)
  if not spawn_position then --if we cant find a safe spot, we spawn our entity anyway. (maybe destroy the concrete? is that possible)
    spawn_position = rand_position
  end 
  local segment = event.source_entity
  local worm = segment.segmented_unit
  local target = worm.get_ai_state().destination
  local distance = util.distance(spawn_position,target)
  if 64 > distance and distance > 16 then
    local hatchling = surface.create_entity{name = "small-crawler", position = spawn_position}
    if not hatchling then return end
    surface.create_entity{name = "crawler-explosion", position = spawn_position}
    --I cant yet decide what order makes the most sense, so whatever.
    hatchling.commandable.set_command({type = defines.command.go_to_location, destination = target, distraction = defines.distraction.none, pathfind_flags = {cache = true}})
  end
end

return ice_worm
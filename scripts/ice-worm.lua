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

function ice_worm.order_units(active_worm,_)
  local silo = active_worm.silo
  if not silo.valid then ice_worm.forget_worm(_) return end
  game.surfaces["nauvis"].set_multi_command{
    command = {type = defines.command.attack,target = silo},
    unit_count = 999,
    unit_search_distance = 400,
  }
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
      ice_worm.order_units(active_worm,_)
      if ai_state == 0 then --we're done, lets forget about this worm
        ice_worm.forget_worm(_)
      end
    end
  end
end

function ice_worm.spawn_hatchling(event)
  local surface = game.surfaces[event.surface_index]
  local position = event.source_entity.position
  surface.create_entity{name = "small-wriggler-pentapod-premature", position = position}
  --TFMG.block(event)
end

return ice_worm
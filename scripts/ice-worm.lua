local ice_worm = {}

function ice_worm.rocket_launched(event)
  local silo = event.rocket_silo
  if silo.surface.name ~= "nauvis" then return end
  storage.worms.recent_launch_count = storage.worms.recent_launch_count + 1 
  local recent_count = storage.worms.recent_launch_count --the quantity of rockets launched over the past 10 min
  local active_worm_count = #storage.worms.active_worms --the amount of worms currently being ordered around
  local max_worm_count = recent_count^0.5 --our maximum quantity of worms.
  local max_size = 1
  if active_worm_count < max_worm_count then --if we have more slots open than worms, we can send another
    local sent_worm = ice_worm.find_close_worm(silo,max_size)
    if not storage.story.handlers.rocket_launched and sent_worm then
      story.worm_warning(sent_worm,silo)
      storage.story.handlers.rocket_launched = true
    end
  end
end

function ice_worm.meets_size_requirement(worm,max_size)
  
  if 2 >= max_size then
    if worm.prototype.name == "big-ice-worm" then return false end
  end
  if
   1 >= max_size then if worm.prototype.name == "medium-ice-worm" then return false end 
  end
return true end

function ice_worm.find_close_worm(silo,max_size)
  local worms = game.surfaces["nauvis"].get_segmented_units()
  if not worms[1] then return end --if there are no worms in the game, end the script
  --set up some variables to help us find the closest worm.
  local silo_position = silo.position
  local max_distance = 2000 --max distance to search.
  local close_worms = {}
  for index , worm in pairs(worms) do
    local wormai = worm.get_ai_state()
    if wormai.type == 0 then
      if ice_worm.meets_size_requirement(worm,max_size) then
        if util.distance(worm.segments[1].position,silo_position) <= max_distance then
          table.insert(close_worms,worm)
        end
      end
    end
  end
  if #close_worms == 0 then game.print("no close worms") return end --no worm index
  local worm_to_send = TFMG.random_table_entry(close_worms)
  ice_worm.send_to_silo(worm_to_send,silo)
  --TFMG.block(worm_to_send)
  return worm_to_send
end

function ice_worm.send_to_silo(worm_to_send,silo)
  local ai_state = {
    type = defines.segmented_unit_ai_state.investigating,
    destination = silo.position,
  }
  worm_to_send.set_ai_state(ai_state)
  table.insert(storage.worms.active_worms,{worm = worm_to_send,silo = silo,order = "find silo"})
end

function ice_worm.attack_silo(active_worm,_)
  local silo = active_worm.silo
  if not silo.valid then ice_worm.forget_worm(_) return end --if the silo is gone, we forget the worm, theyll eventually make their way back home.
  local order_end_tick = game.tick + 2*3600
  local worm = active_worm.worm
  local ai_state = {
    type = defines.segmented_unit_ai_state.enraged_at_nothing,
    destination = silo.position,
    last_damage_time = order_end_tick, --hang around for this long
  }
  worm.set_ai_state(ai_state)
  active_worm.order = "attack silo"
  active_worm.order_end_tick = order_end_tick
end

function ice_worm.continue_attack_silo(active_worm,_)--idk why ice worms randomly decide to deviate from their target
  local silo = active_worm.silo
  if not silo.valid then ice_worm.forget_worm(_) return end --if the silo is gone, we forget the worm, theyll eventually make their way back home.
  local worm = active_worm.worm
  local order_end_tick = active_worm.order_end_tick
  local ai_state = {
    type = defines.segmented_unit_ai_state.enraged_at_nothing,
    destination = silo.position,
    last_damage_time = order_end_tick, --hang around for this long
  }
  worm.set_ai_state(ai_state)
end

function ice_worm.forget_worm(_)
  --game.print("done")
  if storage.worms.active_worms[_] then
    storage.worms.active_worms[_] = nil
  end
end

function ice_worm.check_active_worms()
  local active_worms = storage.worms.active_worms
  for _,active_worm in pairs(active_worms) do
    if not active_worm.worm.valid then 
      active_worm = nil --clear the entry if its borked
    else 
      local ai_state = active_worm.worm.get_ai_state().type
      if active_worm.order == "find silo" and ai_state == 0 then
        ice_worm.attack_silo(active_worm,_)
      elseif active_worm.order == "attack silo" then
        if ai_state == 4 then
          ice_worm.continue_attack_silo(active_worm,_)
        end
        if ai_state == 0 then --we're done, lets forget about this worm
          ice_worm.forget_worm(_)
        end
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
  local spawn_position = surface.find_non_colliding_position("crawler-explosion",rand_position,24,1,true)
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
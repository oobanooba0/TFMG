local gameplay = {}
--scout o tron deployment doesnt exist anymore
--create platform
  function gameplay.create_self()--self is the name of the space platform, I just thought it was funny.
    local force = game.forces["player"]
    local platform = force.create_space_platform({ name = "SELF", planet = "nauvis", starter_pack = "space-platform-starter-pack" })
    platform.apply_starter_pack()
    platform.space_location = "near-void"
    platform.space_connection = "nauvis-near-void"
    platform.paused = false
    platform.schedule = {current = 1, records = {{station = "nauvis"}}}
    platform.distance = 0.314159
    storage.platform = platform

  	force.lock_space_location("nauvis")--Locks nauvis lol.
    force.lock_space_location("near-void")
  end

  function gameplay.give_starting_items()
    if storage.platform.hub then
      if settings.global["SELF-has-extra-stuff"].value then -- get debug item collection
        storage.platform.hub.insert({ name = "space-platform-foundation", count = 1000})
        storage.platform.hub.insert({ name = "electric-energy-interface", count = 50})
        storage.platform.hub.insert({ name = "heat-interface", count = 50})
        storage.platform.hub.insert({ name = "stack-inserter", count = 100})
        storage.platform.hub.insert({ name = "matter-reconstructor", count = 10})
        storage.platform.hub.insert({ name = "small-radiator", count = 50})
        storage.platform.hub.insert({ name = "pipe", count = 100})
        storage.platform.hub.insert({ name = "pipe-to-ground", count = 100})
        storage.platform.hub.insert({ name = "infinity-chest", count = 10})
        storage.platform.hub.insert({ name = "infinity-pipe", count = 10})
        storage.platform.hub.insert({ name = "heat-pipe", count = 250})
        storage.platform.hub.insert({ name = "asteroid-collector", count = 10})
        storage.platform.hub.insert({ name = "scout-o-tron-pod", count = 2})
      else--do normal items
        storage.platform.hub.insert({ name = "asteroid-collector", count = 2})
        storage.platform.hub.insert({ name = "proton-decay-thermoelectric-generator", count = 1})
        storage.platform.hub.insert({ name = "inserter", count = 10})
        storage.platform.hub.insert({ name = "matter-reconstructor", count = 1})
        storage.platform.hub.insert({ name = "small-radiator", count = 2})
        storage.platform.hub.insert({ name = "heat-pipe", count = 50})
        storage.platform.hub.insert({ name = "space-platform-foundation", count = 490})
      end
    end
  end

-- Player permissions

function gameplay.create_permission_group()--hopefully prevents players from goign to surface
 	local group = game.permissions.create_group("players")
 	if group then
		group.set_allows_action(defines.input_action.land_at_planet, false)
	end
end

function gameplay.on_vital_building_built(entity)
  entity.destructible = false
end

function gameplay.softlock_detection()
  local platform = storage.platform
  for _, v in ipairs(platform.ejected_items) do
    if v.item.name.name == "matter-reconstructor" or v.item.name.name == "proton-decay-thermoelectric-generator" then
      game.set_win_ending_info{
        title = {"story-event.reject-purpose-ending-title"},
        message = {"story-event.reject-purpose-ending-message"},
        final_message = {"story-event.reject-purpose-ending-final-message"},
        image_path = "__TFMG-assets-0__/ui/victory-screen/ultrathumbsup.png"
      }
      game.set_game_state{
        game_finished= true,
        player_won= true,
        can_continue= false
      }
    end
  end
end

function gameplay.research_finished(event)
  if event.research.name == "contemplate-mind" then --basically, we're gonna stop doing the softlock detection once we can make AI processors
    script.on_nth_tick(256,nil)
    storage.story.handlers.no_more_softlock = true
  elseif event.research.name == "consider-your-potential" then
    gameplay.self_arrive()
  end
  storage.story.tech_progress = storage.story.tech_progress + 1
end

function gameplay.research_removed(event) --remove our tech progress incase techs have been removed
  storage.story.tech_progress = storage.story.tech_progress - 1
end

function gameplay.self_control()--this script runs in the platform phase to make sure we do not arrive too early.
  local SELF = storage.platform
  if not SELF then return end
  local progression = storage.story.tech_progress
  if SELF.distance <= 0.0005 then SELF.distance = 0.01 end
  SELF.speed = (progression + 1)/3
end

function gameplay.self_arrive()
  local SELF = storage.platform
  if not SELF then return end
  script.on_nth_tick(1,nil)
  SELF.speed = 6
  SELF.distance = 0.001
  storage.story.handlers.no_more_self_control = true
end

return gameplay
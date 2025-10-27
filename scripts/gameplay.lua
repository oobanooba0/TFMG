---Scout'o'tron deploy script. (hopefully)
local gameplay = {}

function gameplay.deploy_scout_o_tron(event)
  local player_storage = storage.players[event.player_index]
  local hub_location = player_storage.hub.surface.platform.space_location--Find which planet we orbit
  if hub_location == nil then--make sure we orbit a planet
    game.print("platform must be in orbit of a planet to deploy spidertron")
  return end
  local spider = player_storage.hub.get_inventory(1).find_item_stack("scout-o-tron-pod")
  if spider == nil then -- check if no spider
    game.print("Space platform contains no scout'o'tron pod to deploy")--turn this into one of those floating text errors, or grey out the box somehow.
  return end
  if game.get_surface(hub_location.name) == nil then
    game.planets['arrival'].create_surface() -- this is important, because arrival isnt generated before now.
  end
  local surface = game.get_surface(hub_location.name) --this has to be done after we make sure a surface actually exists.
  if surface == nil then
    game.print("deployment surface is nil, this shouldnt happen, report bug to oobanooba.")
  return end
  local spider_entity = surface.create_entity({name = "scout-o-tron", position = { math.random(-10,10) , math.random(-10,10) }, force = "player"})--adding item = spider allows it to deploy with inventory contents but unfortunately i lack a means to actually load its inventory properly
  spider.clear()
  spider_entity.grid.put{name = "solar-cell-equipment"}
  spider_entity.grid.put{name = "solar-cell-equipment"}
  spider_entity.grid.put{name = "roboport-1-equipment"}
  spider_entity.insert({name = "construction-robot", count = 8})
  game.get_player(event.player_index).unlock_achievement ("spiders")
  game.print({"spider-ui.scout-o-tron-deploy-message",spider_entity.gps_tag}) -- :)
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
  SELF.speed = 10
  SELF.distance = 0.0001
end


return gameplay
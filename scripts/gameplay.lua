
---Scout'o'tron deploy script. (hopefully)
local gameplay = {}

function gameplay.deploy_scout_o_tron(event)
  local player_storage = storage.players[event.player_index]
  local scout_o_tron_quantity = player_storage.hub.get_item_count("scout-o-tron")
  local hub_location = player_storage.hub.surface.platform.space_location--Find which planet we orbit
  if scout_o_tron_quantity == 0 then
  game.print("Space platform contains no scout'o'tron to deploy")--turn this into one of those floating text errors, or grey out the box somehow.
  elseif scout_o_tron_quantity >= 1 then
    if hub_location == nil then
      game.print("platform must be in orbit of a planet to deploy spidertron")
    elseif hub_location ~= nil then
      if game.get_surface(hub_location.name) == nil then --check that the surface exists. This is important because Arrival isnt generated at game start.
        game.planets['arrival'].create_surface()
      end
      local surface = game.get_surface(hub_location.name) --this has to be done after we make sure a surface actually exists.
      player_storage.hub.remove_item({ name = "scout-o-tron", count=1 })
      surface.create_entity({ name = "scout-o-tron", position = { 0 , 0 }, force = "player" })
      local cargo_pod = player_storage.hub.create_cargo_pod()
      cargo_pod.cargo_pod_destination = {
        type = 3,
        surface = "nauvis"
      }
      game.print("Deployed Scout'o'tron.")
    end
  end
end

function gameplay.on_vital_building_built(entity)
  entity.destructible = false
end


function gameplay.softlock_detection()
  local platform = storage.platform
  for _, v in ipairs(platform.ejected_items) do
    --game.print(v.item.name.name)
    if v.item.name.name == "matter-reconstructor" or v.item.name.name == "proton-decay-thermoelectric-generator" then
      game.set_win_ending_info{
        title = {"story-event.reject-purpose-ending-title"},
        message = {"story-event.reject-purpose-ending-message"},
        final_message = {"story-event.reject-purpose-ending-final-message"},
        image_path = "__TFMG__/graphics/ui/victory-screen/ultrathumbsup.png"
      }
      game.set_game_state{
        game_finished= true,
        player_won= true,
        can_continue= false
      }
    end
  end
end
return gameplay
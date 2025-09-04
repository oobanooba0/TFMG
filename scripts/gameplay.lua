---Scout'o'tron deploy script. (hopefully)
local gameplay = {}

function gameplay.deploy_scout_o_tron(event)
  local player_storage = storage.players[event.player_index]
  local scout_o_tron_quantity = player_storage.hub.get_item_count("scout-o-tron")
  local hub_location = player_storage.hub.surface.platform.space_location--Find which planet we orbit
  local surface = game.get_surface(hub_location.name)--get the actual surface name
  if scout_o_tron_quantity == 0 then
  game.print("Space platform contains no scout'o'tron to deploy")--turn this into one of those floating text errors, or grey out the box somehow.
  elseif scout_o_tron_quantity >= 1 then
    if hub_location == nil then
      game.print("platform must be in orbit of a planet to deploy spidertron")
    elseif hub_location ~= nil then
      player_storage.hub.remove_item({ name = "scout-o-tron", count=1 })
      surface.create_entity({ name = "scout-o-tron", position = { 0 , 0 }, force = "player" })
      local cargo_pod = player_storage.hub.create_cargo_pod()
      cargo_pod.cargo_pod_destination = {
        type = 3,
        surface = "nauvis"}
        game.print("Deployed Scout'o'tron.")
    end
  end
end

return gameplay
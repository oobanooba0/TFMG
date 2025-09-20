script.on_init(function(e)--Code shamelessly plagerised from Platformer by Corlin and Xiroc
  disable_cutsceene()--Necessary for player to be teleported and imprisoned    
  create_self()--Create starting space platform
  give_starting_items()
  refresh_data_storage()
  create_permission_group()
end)

script.on_configuration_changed(function()
  refresh_data_storage()
  game.forces.player.set_surface_hidden(game.surfaces.nauvis, true)
  game.forces.player.lock_space_location("nauvis")
end)


function disable_cutsceene()--apparently, the cutscene prevents the player from being teleported.
  if remote.interfaces.freeplay then
    if remote.interfaces.freeplay.set_disable_crashsite then
      remote.call("freeplay", "set_disable_crashsite", true)
    end
  end
end

function create_self()--self is the name of the space platform, I just thought it was funny.
  local force = game.forces["player"]
  platform = force.create_space_platform({
  name = "Self",
  planet = "arrival",
  starter_pack = "space-platform-starter-pack"
  })
  platform.apply_starter_pack()
  storage.platform = platform
	force.lock_space_location("nauvis")--Locks nauvis lol.
  game.forces.player.set_surface_hidden(game.surfaces.nauvis, true)
	--game.planets['arrival'].create_surface()
end

function give_starting_items()
  if storage.platform.hub then
    storage.platform.hub.insert({ name = "asteroid-collector", count = 2})
    storage.platform.hub.insert({ name = "proton-decay-thermoelectric-generator", count = 1})
    storage.platform.hub.insert({ name = "inserter-1", count = 10})
    storage.platform.hub.insert({ name = "matter-reconstructor", count = 1})
    storage.platform.hub.insert({ name = "small-radiator", count = 2})
    storage.platform.hub.insert({ name = "heat-pipe", count = 50})
    storage.platform.hub.insert({ name = "space-platform-foundation", count = 500})
  end
end

-- Player permissions

function create_permission_group()--hopefully prevents players from goign to surface
 	local group = game.permissions.create_group("players")
 	if group then
		group.set_allows_action(defines.input_action.land_at_planet, false)
	end
end

function refresh_data_storage()--This should allow new storages to be added without the creation of a new world
  if storage.matter_reconstructor_thermal == nil then
    storage.matter_reconstructor_thermal = {} end
  if storage.assembling_machine_thermal == nil then
    storage.assembling_machine_thermal = {} end
  if storage.furnace_thermal == nil then
    storage.furnace_thermal = {} end
  if storage.players == nil then
    storage.players = {} end
  if storage.supercomputer == nil then
    storage.supercomputer = {} end
    if storage.neural_node_thermal == nil then
  storage.neural_node_thermal = {} end
end


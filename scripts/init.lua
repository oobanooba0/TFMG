

script.on_init(function(e)--Code shamelessly plagerised from Platformer by Corlin and Xiroc
  disable_cutsceene()--Necessary for player to be teleported and imprisoned    
  create_self()--Create starting space platform
  give_starting_items()
  create_data_storage()
  create_permission_group()
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
	--game.planets['arrival'].create_surface()
end

function give_starting_items()
  if storage.platform.hub then
    storage.platform.hub.insert({ name = "asteroid-collector", count = 2})
    storage.platform.hub.insert({ name = "proton-decay-thermoelectric-generator", count = 1})
    storage.platform.hub.insert({ name = "inserter-1", count = 10})
    storage.platform.hub.insert({ name = "matter-reconstructor", count = 1})
    storage.platform.hub.insert({ name = "small-radiator", count = 1})
    storage.platform.hub.insert({ name = "heat-pipe", count = 15})
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

function create_data_storage()
	storage.assembling_machine_thermal = {}
  storage.furnace_thermal = {}
  storage.players = {}
end
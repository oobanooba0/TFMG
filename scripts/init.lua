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
    force.unlock_space_location("arrival")
    force.lock_space_location("nauvis")--Locks nauvis lol.
end

function give_starting_items()
    if storage.platform.hub then
        storage.platform.hub.insert({ name = "asteroid-collector", count = 1})
        storage.platform.hub.insert({ name = "proton-decay-thermoelectric-generator", count = 1})
        storage.platform.hub.insert({ name = "inserter-1", count = 10})
        storage.platform.hub.insert({ name = "matter-reconstructor", count = 1})
        storage.platform.hub.insert({ name = "small-radiator", count = 1})
        storage.platform.hub.insert({ name = "heat-pipe", count = 50})
        storage.platform.hub.insert({ name = "space-platform-foundation", count = 90})
        --storage.platform.hub.insert({ name = , count = 1})
    end
end

function create_permission_group()--hopefully prevents players from goign to surface
    local group = game.permissions.create_group("players")
    if group then
        group.set_allows_action(defines.input_action.land_at_planet, false)
    end
end

function create_data_storage()
	storage.assembling_machine_thermal = {}
    storage.furnace_thermal = {}
end

-- Upon player joins

script.on_event(defines.events.on_player_created, function(e)--Ngl I have no idea what the e means, but the code doesn't work without it.
    local player = game.players[e.player_index]
    player.teleport({ x = 0, y = 0 }, storage.platform.surface.name)
    player.enter_space_platform (platform)
    local group = game.permissions.get_group("players")
    if group then
        group.add_player(player)
    end

end)
script.on_init(function(e)--Code shamelessly plagerised from Platformer by Corlin and Xiroc
    create_self()--Create starting space platform
    disable_cutsceene()--Necessary for player to be teleported and imprisoned
end)

function create_self()
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

script.on_event(defines.events.on_player_created, function(e)--Ngl I have no idea what the e means, but the code doesn't work without it.
    local player = game.players[e.player_index]
    player.teleport({ x = 0, y = 0 }, storage.platform.surface.name)
    player.enter_space_platform (platform)
end)

function disable_cutsceene()--apparently, the cutscene prevents the player from being teleported?
    if remote.interfaces.freeplay then
        if remote.interfaces.freeplay.set_disable_crashsite then
            remote.call("freeplay", "set_disable_crashsite", true)
        end
    end
end
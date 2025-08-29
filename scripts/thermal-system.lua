storage.TFMG = storage.TFMG or {}


script.on_event(defines.events.on_script_trigger_effect, function(event)
    if event.effect_id ~= "assembling-machine" then return end
    local assembler = event.source_entity
    local assemblerinterface = game.get_surface(event.surface_index).create_entity{
        name = "assembling-machine-heat-interface",
        position = assembler.position,
        force = assembler.force
    }
    destructible = false
    local key = script.register_on_object_destroyed(assembler)
    storage.TFMG[key] = assemblerinterface
end)

script.on_event(defines.events.on_object_destroyed, function(event)
    local key = event.registration_number
    if not storage.TFMG[key] then return end
    storage.TFMG[key].destroy()
    storage.TFMG[key] = nil
end)

local heat_system = {}

function heat_system.on_tick()

end

return heat_system
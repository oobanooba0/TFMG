
local simple_compound = {}

--with unscripted compound entities, the destruction process should be pretty simple.

function simple_compound.on_destroyed(event)
  local id = event.useful_id
  local compound = storage.simple_compound[id]
  if not compound then return end
  for _,entity in pairs(compound) do --just destroy each subcomponent, quick and simple
    if entity.valid then
      entity.destroy()
    end
  end
  storage.simple_compound[id] = nil
end


--each compound entity still needs its individual construction method.

function simple_compound.on_built_chemical_reactor(event)
  local entity = event.entity
  if not entity or not entity.valid then return end
  local _reg_number, unit_number, _type = script.register_on_object_destroyed(entity)
  local surface = entity.surface
  local reactor = surface.create_entity({
    name = "chemical-reactor-reactor",
    force = entity.force,
    position = entity.position,
  })
  reactor.destructible = false
  TFMG.force_storage({"simple_compound",unit_number},{entity,reactor})
  TFMG.block(entity.fluidbox[1])
  entity.fluidbox.add_linked_connection(1,reactor,1)



end

return simple_compound
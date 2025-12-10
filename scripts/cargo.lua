local cargo = {}
--heavily plagerised from cargo bay limit research mod

  function cargo.hub_expansion_researched()
    --While i could simply count + 1 each time, checking the number of techs each time might be more resistent to shenanigans
    local level = 0
    local techs = game.forces["player"].technologies
    if techs["hub-expansion"] then level = level + 1 end
    storage.gameplay.hub_expansion_level = level
  end


  function cargo.on_bay_built(event)
    local entity = event.entity
    if not entity or not entity.valid then return end
    local limit = storage.gameplay.hub_expansion_level or 0
    local connected_bays = cargo.find_connected_bays(entity)
    if table_size(connected_bays) > (limit + 1) then --+1 needed to compensate for hub/landing pad counting
      cargo.block_build(entity,event)
    end
  end


  function cargo.find_connected_bays(entity,connected_bays)--doesnt explode, i promise.
    local connected_bays = connected_bays or {}
    local found = cargo.find_neighbor_bays(entity)
    for _,bay in pairs(found) do
      local unit_number = bay.unit_number
      if not connected_bays[unit_number] then
        table.insert(connected_bays,bay.unit_number,bay)
        cargo.find_connected_bays(bay,connected_bays) --we call the function itself, but this time with the additional information from all the previous times this function was called
      end
    end
  return connected_bays end

  function cargo.find_neighbor_bays(entity)
    local box = entity.bounding_box
    local area = {{box.left_top.x-1,box.left_top.y-1},{box.right_bottom.x+1,box.right_bottom.y+1}}
    found = entity.surface.find_entities_filtered{--search regular cargo bays
      area = area,
      name = {"cargo-bay","cargo-landing-pad", "space-platform-hub"},
    }
    found_2 = entity.surface.find_entities_filtered{
      area = area,
      type = "entity-ghost",
      ghost_name = {"cargo-bay","cargo-landing-pad", "space-platform-hub"},
    }
    TFMG.append(found,found_2)
  return found end

  function cargo.block_build(entity, event)
    local build_method = event.name
    local limit = storage.gameplay.hub_expansion_level or 0
    if not entity or not entity.valid then return end
    if entity.type == "entity-ghost" then
      entity.destroy()
    else
      if build_method == defines.events.on_built_entity then --should never occur in TFMG but whatever
        local player = game.get_player(event.player_index)
        if player then
          player.insert{name = "cargo-bay", count = 1}
          player.print("Cannot place hub expansion: Hub expansion limit of "..limit.." has been reached.")
          entity.destroy()
        else
          cargo.drop_bay(entity) --this shit is indicative of messy code
          game.print(print("Cannot place hub expansion: Hub expansion limit of "..limit.." has been reached."))
        end
      else
        cargo.drop_bay(entity)
        game.print("Cannot place hub expansion: Hub expansion limit of "..limit.." has been reached.")
      end
    end
  end

  function cargo.drop_bay(entity)
    local surface = entity.surface
      local dropped_hub = surface.create_entity{
        name = "item-on-ground",
        position = entity.position,
        stack = {name = "cargo-bay", count = 1},
      }
      entity.destroy()
      dropped_hub.order_deconstruction(game.forces["player"]) --lets find out lads
  end

return cargo
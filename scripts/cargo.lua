local cargo = {}
--heavily plagerised from cargo bay limit research mod
--in hindsight, barely. I redid pretty much everything, too much handling edge cases of the api instaid of just diy-ing a better search function.

--event triggered functions

  function cargo.hub_expansion_researched()
    --While i could simply count + 1 each time, checking the number of techs each time might be more resistent to shenanigans
    local level = 0
    local techs = game.forces["player"].technologies
    if techs["hub-expansion"] then level = level + 4 end
    storage.gameplay.hub_expansion_level = level
  end


  function cargo.on_bay_built(event)
    local entity = event.entity
    if not entity or not entity.valid then return end
    local limit = storage.gameplay.hub_expansion_level or 4
    local connected_bays = cargo.find_connected_bays(entity)

    if table_size(connected_bays) > (limit + 1) then --+1 needed to compensate for hub/landing pad counting
      --if we exceed our limit, block the build.
      cargo.block_build(entity,event)

    else
      --else, we should create our hub proxy, and register our deconstruction event, so we can remove it.
      if entity.valid and entity.type ~= "entity-ghost" then --if not a ghost.
        local _reg_number, unit_number, _type = script.register_on_object_destroyed(entity) --register destruction event, so we can remove the proxy when the time comes
        local surface = entity.surface
        local proxy = surface.create_entity({
          name = "cargo-bay-proxy",
          force = entity.force,
          position = entity.position,
        })
        proxy.destructible = false
        local connected_non_ghosts = cargo.find_connected_bays(entity,nil,true) --find non ghost, connected bays
        --TFMG.block(connected_non_ghosts)
        local hub = cargo.get_hub(connected_non_ghosts)
        if not storage.cargo_bays then storage.cargo_bays = {} end
        storage.cargo_bays[unit_number] = {
          proxy = proxy,
          hub = hub,
        }
        cargo.update_proxies(connected_non_ghosts,hub)--we have to update all of them, cause a bunch of new bays might just have become connected
      end
    end
  end

  function cargo.on_bay_destroyed(event)
    local id = event.useful_id
    if storage.cargo_bays and storage.cargo_bays[id] and storage.cargo_bays[id].proxy.valid then --the cargo bay registry contains the proxy container connected, we just need to destroy that.
      local proxy = storage.cargo_bays[id].proxy
      local hub = storage.cargo_bays[id].hub
      local connected_non_ghosts = cargo.find_connected_bays(proxy,nil,true) --we're gonna leverage the find script to find all bays that are linked to the proxy. since it still exists for now.
      cargo.disconnect_proxies(connected_non_ghosts,hub) --disconnect proxies which no longer link to the parent
      proxy.destroy()
    end
    --i need some way of finding out if we've split a hub group in two, and updating the proxies of all connected hubs appropriately.
  end

--functions that find, like, the entire multiblock, because the vanilla function doesnt work with ghosts nor does it work on the same tick that an entity is built.

  function cargo.find_connected_bays(entity,connected_bays,exclude_ghosts)--doesnt explode, i promise.
    local connected_bays = connected_bays or {}
    local found = cargo.find_neighbor_bays(entity,exclude_ghosts)
    for _,bay in pairs(found) do
      local unit_number = bay.unit_number
      if not connected_bays[unit_number] then
        table.insert(connected_bays,bay.unit_number,bay)
        cargo.find_connected_bays(bay,connected_bays,exclude_ghosts) --we call the function itself, but this time with the additional information from all the previous times this function was called
      end
    end
  return connected_bays end

  function cargo.find_neighbor_bays(entity,exclude_ghosts)
    local box = entity.bounding_box
    local area = {{box.left_top.x-1,box.left_top.y-1},{box.right_bottom.x+1,box.right_bottom.y+1}}
    local names = {"cargo-bay","cargo-landing-pad", "space-platform-hub"} --this does leave corner connections open but like holy shit who cares?
    found = entity.surface.find_entities_filtered{--search regular cargo bays
      area = area,
      name = names,
    }
    if not exclude_ghosts then --if ghosts are excluded, we dont run this.
      found_2 = entity.surface.find_entities_filtered{
        area = area,
        type = "entity-ghost",
        ghost_name = names,
      }
      TFMG.append(found,found_2)
    end
  return found end

--proxy updating functions

  function cargo.get_hub(connected_bays)
    for _,entity in pairs(connected_bays) do
      if entity.valid and entity.name == "cargo-landing-pad" or entity.name == "space-platform-hub" then return entity end
    end
  end

  function cargo.update_proxies(connected_bays,hub)
    for _,entity in pairs(connected_bays) do
      if entity.valid and storage.cargo_bays[entity.unit_number] and storage.cargo_bays[entity.unit_number].proxy.valid then --big stack that sums up to, does this entity have a proxy attatched to it? + some saftey checks.
        local proxy = storage.cargo_bays[entity.unit_number].proxy
        cargo.update_proxy(proxy,hub)
      end
    end
  end

  function cargo.disconnect_proxies(connected_bays,hub)
    for _,entity in pairs(connected_bays) do
      if entity.valid and storage.cargo_bays[entity.unit_number] and storage.cargo_bays[entity.unit_number].proxy.valid then --big stack that sums up to, does this entity have a proxy attatched to it? + some saftey checks.
        if entity.type == "cargo-bay" then
          local proxy = storage.cargo_bays[entity.unit_number].proxy
          cargo.update_proxy(proxy,entity.cargo_bay_connection_owner)
        end
      end
    end
  end

  function cargo.update_proxy(proxy,hub) --update one proxy
    proxy.proxy_target_entity = hub --should pass nil if no hub. lets see.
    proxy.proxy_target_inventory = defines.inventory.hub_main
  end

--block build functions

  function cargo.block_build(entity, event)
    local build_method = event.name
    local limit = storage.gameplay.hub_expansion_level or 0
    if not entity or not entity.valid then return end
    if entity.type == "entity-ghost" then
      entity.destroy()
      game.print("Cannot place hub expansion: Hub expansion limit of "..limit.." has been reached.")
    else
      if build_method == defines.events.on_built_entity then --should never occur in TFMG but whatever
        local player = game.get_player(event.player_index)
        if player then
          player.insert{name = "cargo-bay", count = 1}
          player.print("Cannot place hub expansion: Hub expansion limit of "..limit.." has been reached.")
          entity.destroy()
        else
          cargo.drop_bay(entity) --this shit is indicative of messy code
          game.print("Cannot place hub expansion: Hub expansion limit of "..limit.." has been reached.")
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
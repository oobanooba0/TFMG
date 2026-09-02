local function collide_on_unstable(prototype_class,exclude_list)
  for _,prototype in pairs(data.raw[prototype_class]) do
    if not exclude_list or not exclude_list[prototype.name] then
      if not prototype.collision_mask then --make sure the collision masks truely exist by now, so i can edit them.
        prototype.collision_mask = data.raw["utility-constants"]["default"].default_collision_masks[prototype_class]
      end
      if prototype.collision_mask.layers and prototype.collision_mask.layers.object == true then --if this entity collides with objects, then we'll add the additional collsion.
        prototype.collision_mask["layers"]["unstable"] = true
      end
    end
  end
end

collide_on_unstable("pipe-to-ground")
collide_on_unstable("underground-belt")
collide_on_unstable("splitter")

collide_on_unstable("accumulator")
collide_on_unstable("agricultural-tower")
collide_on_unstable("ammo-turret")
collide_on_unstable("arithmetic-combinator")
collide_on_unstable("artillery-turret")
collide_on_unstable("assembling-machine")
collide_on_unstable("asteroid-collector")
collide_on_unstable("beacon")
collide_on_unstable("boiler")
collide_on_unstable("burner-generator")
collide_on_unstable("cargo-bay")
collide_on_unstable("cargo-landing-pad")
collide_on_unstable("constant-combinator")
collide_on_unstable("container")
collide_on_unstable("decider-combinator")
collide_on_unstable("display-panel")
collide_on_unstable("electric-turret")
collide_on_unstable("fluid-turret")
collide_on_unstable("furnace")
collide_on_unstable("fusion-generator")
collide_on_unstable("fusion-reactor")
collide_on_unstable("gate")
collide_on_unstable("generator")
collide_on_unstable("inserter")
collide_on_unstable("lab")
collide_on_unstable("logistic-container")
collide_on_unstable("power-switch")
collide_on_unstable("radar")
collide_on_unstable("reactor")
collide_on_unstable("roboport")
collide_on_unstable("rocket-silo")
collide_on_unstable("selector-combinator")
collide_on_unstable("solar-panel")
collide_on_unstable("space-platform-hub")
collide_on_unstable("storage-tank")
collide_on_unstable("thruster")
collide_on_unstable("turret")
collide_on_unstable("wall")


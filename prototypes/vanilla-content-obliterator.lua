--this is the part where I murder the game, Thanks to Rseding91's fourm comments which helped me do this.
	data.raw ["technology"] = {}
	data.raw ["tips-and-tricks-item"] = {}
	data.raw ["utility-constants"]["default"].main_menu_simulations = {}
	data.raw ["space-connection"] = {}
--Due to the removal of vanilla techs, shortcuts dependant on them must be modified.
	data.raw ["shortcut"]["undo"].technology_to_unlock = nil
	data.raw ["shortcut"]["redo"].technology_to_unlock = nil
	data.raw ["shortcut"]["copy"].technology_to_unlock = nil
	data.raw ["shortcut"]["cut"].technology_to_unlock = nil
	data.raw ["shortcut"]["paste"].technology_to_unlock = nil
	data.raw ["shortcut"]["import-string"].technology_to_unlock = nil
	data.raw ["shortcut"]["give-blueprint"].technology_to_unlock = nil
	data.raw ["shortcut"]["give-blueprint-book"].technology_to_unlock = nil
	data.raw ["shortcut"]["give-deconstruction-planner"].technology_to_unlock = nil
	data.raw ["shortcut"]["give-upgrade-planner"].technology_to_unlock = nil
	data.raw ["shortcut"]["toggle-personal-roboport"].technology_to_unlock = nil
	data.raw ["shortcut"]["toggle-equipment-movement-bonus"].technology_to_unlock = nil
	data.raw ["shortcut"]["give-copper-wire"].technology_to_unlock = "consider-the-self"
	data.raw ["shortcut"]["give-red-wire"].technology_to_unlock = "consider-the-self"
	data.raw ["shortcut"]["give-green-wire"].technology_to_unlock = "consider-the-self"
	data.raw ["shortcut"]["give-spidertron-remote"].technology_to_unlock = "consider-your-potential"
	data.raw ["shortcut"]["give-discharge-defense-remote"].technology_to_unlock = nil
	data.raw ["shortcut"]["give-artillery-targeting-remote"].technology_to_unlock = nil
	data.raw ["shortcut"]["undo"].unavailable_until_unlocked = nil
	data.raw ["shortcut"]["redo"].unavailable_until_unlocked = nil
	data.raw ["shortcut"]["copy"].unavailable_until_unlocked = nil
	data.raw ["shortcut"]["cut"].unavailable_until_unlocked = nil
	data.raw ["shortcut"]["paste"].unavailable_until_unlocked = nil
	data.raw ["shortcut"]["import-string"].unavailable_until_unlocked = nil
	data.raw ["shortcut"]["give-blueprint"].unavailable_until_unlocked = nil
	data.raw ["shortcut"]["give-blueprint-book"].unavailable_until_unlocked = nil
	data.raw ["shortcut"]["give-deconstruction-planner"].unavailable_until_unlocked = nil
	data.raw ["shortcut"]["give-upgrade-planner"].unavailable_until_unlocked = nil
	data.raw ["shortcut"]["toggle-personal-roboport"].unavailable_until_unlocked = true
	data.raw ["shortcut"]["toggle-equipment-movement-bonus"].unavailable_until_unlocked = true
	data.raw ["shortcut"]["give-discharge-defense-remote"].unavailable_until_unlocked = true
	data.raw ["shortcut"]["give-artillery-targeting-remote"].unavailable_until_unlocked = true

--hide vanilla content from game, this seems easier than outright removing certain things due to dependancies.

	local removed_recipes = {"stone-brick","space-platform-foundation","small-lamp","constant-combinator","selector-combinator","arithmetic-combinator","decider-combinator","decider-combinator","power-switch","programmable-speaker","display-panel","repair-pack","construction-robot","logistic-robot","electric-mining-drill","pumpjack","pipe","pipe-to-ground","pump","storage-tank","rail","cargo-wagon","fluid-wagon","rail-signal","rail-chain-signal","train-stop","locomotive","radar","cargo-landing-pad","speed-module","efficiency-module","transport-belt","fast-transport-belt","underground-belt","fast-underground-belt","splitter","fast-splitter","toolbelt-equipment","rocket-silo","rocket-part","iron-chest","basic-oil-processing","advanced-oil-processing","simple-coal-liquefaction","coal-liquefaction","heavy-oil-cracking","light-oil-cracking","solid-fuel-from-petroleum-gas","solid-fuel-from-light-oil","solid-fuel-from-heavy-oil","acid-neutralisation","steam-condensation","ice-melting","iron-plate","copper-plate","steel-plate","plastic-bar","coal-synthesis","carbon","explosives","battery","sulfur","iron-gear-wheel","iron-stick","copper-cable","sulfuric-acid","thruster-fuel","advanced-thruster-fuel","thruster-oxidizer","advanced-thruster-oxidizer","concrete","concrete-from-molten-iron","hazard-concrete","refined-concrete","refined-hazard-concrete","barrel","cliff-explosives","inserter","long-handed-inserter","beacon","thruster","productivity-module","space-platform-starter-pack"}

--grand hide list
	local hide_list = {"stone-brick","wood","coal","stone","iron-ore","copper-ore","uranium-ore","spoilage","pistol","ice","iron-plate","copper-plate","steel-plate","solid-fuel","plastic-bar","sulfur","battery","explosives","carbon","iron-gear-wheel","iron-stick","copper-cable","crude-oil","petroleum-gas","light-oil","heavy-oil","lubricant","sulfuric-acid","molten-iron","molten-copper","holmium-solution","electrolyte","ammoniacal-solution","ammonia","fluorine","fluoroketone-hot","flouroketone-cold","lithium-brine","wooden-chest","iron-chest","express-transport-belt","turbo-transport-belt","express-underground-belt","turbo-underground-belt","express-splitter","turbo-splitter","burner-inserter","fast-inserter","bulk-inserter","stack-inserter","small-electric-pole","medium-electric-pole","big-electric-pole","substation","rail-ramp","rail-support","artillery-wagon","car","tank","spidertron","landfill","artificial-yumako-soil","overgrowth-yumako-soil","refined-concrete","refined-hazard-concrete","artificial-jellynut-soil","overgrowth-jellynut-soil","ice-platform","foundation","boiler","steam-engine","solar-panel","accumulator","nuclear-reactor","heat-exchanger","steam-turbine","fusion-reactor","fusion-generator","burner-mining-drill","big-mining-drill","offshore-pump","stone-furnace","steel-furnace","electric-furnace","foundry","recycler","agricultural-tower","biochamber","captive-biter-spawner","assembling-machine-1","assembling-machine-2","assembling-machine-3","oil-refinery","chemical-plant","centrifuge","electromagnetic-plant","cryogenic-plant","lab","biolab","lightning-rod","lightning-collector","heating-tower","speed-module-2","speed-module-3","efficiency-module-2","efficiency-module-3","productivity-module-2","productivity-module-3","quality-module","quality-module-2","quality-module-3","electronic-circuit","raw-fish","pistol","firearm-magazine","light-armor","advanced-circuit","processing-unit","engine-unit","electric-engine-unit","flying-robot-frame","low-density-structure","rocket-fuel","uranium-fuel-cell","depleted-uranium-fuel-cell","nuclear-fuel","uranium-235","uranium-238","calcite","tungsten-ore","tungsten-carbide","tungsten-plate","scrap","holmium-ore","holmium-plate","superconductor","supercapacitor","yumako-seed","jellynut-seed","yumako","jellynut","iron-bacteria","copper-bacteria","nutrients","bioflux","yumako-mash","jelly","carbon-fiber","biter-egg","pentapod-egg","tree-seed","lithium","lithium-plate","quantum-processor","fusion-power-cell","automation-science-pack","logistic-science-pack","military-science-pack","chemical-science-pack","production-science-pack","utility-science-pack","space-science-pack","metallurgic-science-pack","agricultural-science-pack","electromagnetic-science-pack","cryogenic-science-pack","promethium-science-pack","cargo-bay","crusher","metallic-asteroid-chunk","carbonic-asteroid-chunk","oxide-asteroid-chunk","promethium-asteroid-chunk","submachine-gun","railgun","teslagun","shotgun","combat-shotgun","rocket-launcher","flamethrower","piercing-rounds-magazine","uranium-rounds-magazine","shotgun-shell","piercing-shotgun-shell","cannon-shell","explosive-cannon-shell","uranium-cannon-shell","explosive-uranium-cannon-shell","artillery-shell","rocket","explosive-rocket","atomic-bomb","capture-robot-rocket","flamethrower-ammo","railgun-ammo","tesla-ammo","grenade","cluster-grenade","poison-capsule","slowdown-capsule","defender-capsule","distractor-capsule","destroyer-capsule","heavy-armor","modular-armor","power-armor","power-armor-mk2","mech-armor","solar-panel-equipment","fission-reactor-equipment","fusion-reactor-equipment","battery-equipment","battery-mk2-equipment","battery-mk3-equipment","belt-immunity-equipment","exoskeleton-equipment","personal-roboport-equipment","personal-roboport-mk2-equipment","night-vision-equipment","energy-shield-equipment","energy-shield-mk2-equipment","personal-laser-defense-equipment","discharge-defense-equipment","stone-wall","gate","land-mine","gun-turret","laser-turret","flamethrower-turret","artillery-turret","rocket-turret","tesla-turret","railgun-turret","stone-path","refined-hazard-concrete-right","refined-hazard-concrete-left","simple-coal-liquefaction","acid-neutralisation","steam-condensation","ice-melting","coal-synthesis","uranium-processing","nuclear-fuel-reprocessing","kovarex-enrichment-process","molten-iron-from-lava","molten-copper-from-lava","casting-iron","casting-copper","casting-steel","casting-iron-gear-wheel","casting-iron-stick","casting-low-density-structure","concrete-from-molten-iron","casting-copper-cable","scrap-recycling","yumako-processing","jellynut-processing","iron-bacteria-cultivation","copper-bacteria-cultivation","nutrients-from-spoilage","nutrients-from-yumako-mash","nutrients-from-bioflux","rocket-fuel-from-jelly","biolubricant","bioplastic","biosulfur","burnt-spoilage","wood-processing","fish-breeding","nutrients-from-fish","nutrients-from-biter-egg","ammoniacal-solution-separation","solid-fuel-from-ammonia","ammonia-rocket-fuel","fluoroketone","fluoroketone-cooling","small-metallic-asteroid","medium-metallic-asteroid","big-metallic-asteroid","huge-metallic-asteroid","small-carbonic-asteroid","medium-carbonic-asteroid","big-carbonic-asteroid","huge-carbonic-asteroid","small-oxide-asteroid","medium-oxide-asteroid","big-oxide-asteroid","huge-oxide-asteroid","small-promethium-asteroid","medium-promethium-asteroid","big-promethium-asteroid","huge-promethium-asteroid","metallic-asteroid-crushing","carbonic-asteroid-crushing","oxide-asteroid-crushing","metallic-asteroid-reprocessing","carbonic-asteroid-reprocessing","oxide-asteroid-reprocessing","advanced-metallic-asteroid-crushing","advanced-carbonic-asteroid-crushing","advanced-oxide-asteroid-crushing","advanced-thruster-fuel","advanced-thruster-oxidizer","vulcanus","gleba","fulgora","aquilo","solar-system-edge","shattered-planet","lava","fluoroketone-cold","fusion-plasma","small-biter","medium-biter","big-biter","behemoth-biter","small-spitter","medium-spitter","big-spitter","behemoth-spitter","small-worm-turret","medium-worm-turret","big-worm-turret","behemoth-worm-turret","biter-spawner","spitter-spawner","small-wriggler-pentapod","small-wriggler-pentapod-premature","medium-wriggler-pentapod","medium-wriggler-pentapod-premature","big-wriggler-pentapod","big-wriggler-pentapod-premature","small-strafer-pentapod","medium-strafer-pentapod","big-strafer-pentapod","small-stomper-pentapod","medium-stomper-pentapod","big-stomper-pentapod","gleba-spawner","gleba-spawner-small","small-demolisher","medium-demolisher","big-demolisher","nauvis-vulcanus","nauvis-gleba","nauvis-fulgora","vulcanus-gleba","gleba-fulgora","gleba-aquilo","fulgora-aquilo","aquilo-solar-system-edge","solar-system-edge-shattered-planet","casting-pipe","casting-pipe-to-ground","defender","distractor","destroyer","discharge-defense-remote","vulcanus_coal","sulfuric_acid_geyser","tungsten_ore","vulcanus_volcanism","gleba_stone","gleba_plants","gleba_enemy_base","gleba_water","gleba_cliff","fulgora_islands","fulgora_cliff","lithium_brine","fluorine_vent","aquilo_crude_oil","trees","enemy-base","rocks","starting_area_moisture","nauvis_cliff","aquilo-solar-system-edge","fulgora-aquilo","gleba-aquilo","gleba-fulgora","nauvis-fulgora","nauvis-gleba","nauvis-vulcanus","soalr-system-edge-shattered-planet","vulcanus-gleba"}

	local hide = {}--the idea is that this should be more efficient than iterating through the entire list for every prototype.

	for k, name in pairs(hide_list) do
		hide[name] = true
	end

	for _, class in pairs(data.raw) do
		for _, prototype in pairs(class) do
			if hide[prototype.next_upgrade] then
				prototype.next_upgrade = nil
			end
			if hide[prototype.name] then
				prototype.hidden = true
				prototype.hidden_in_factoriopedia = true
			end
		end
	end
--remove recipies
	for name, recipe in pairs(data.raw.recipe) do
		for _, hideName in ipairs(removed_recipes) do
			if recipe.name == hideName then
				data.raw.recipe[recipe.name] = nil
			end
		end
	end

--hide water nauvis autoplace control
	data.raw["autoplace-control"]["water"].hidden = true
--disable the nauvis climate controls.
	data.raw["planet"]["nauvis"].map_gen_settings.aux_climate_control = false
	data.raw["planet"]["nauvis"].map_gen_settings.moisture_climate_control = false

--adjust vanilla content
--utility constants --be careful
	local utility_constants = data.raw["utility-constants"]["default"]
	  -- drag_coefficient = width * 0.5
    -- drag = ((1500 * speed * speed + 1500 * abs(speed)) * drag_coefficient + 10000) * sign(speed)
    -- final_thrust = thrust / (1 + weight / 10000000)
    -- acceleration = (final_thrust - drag) / weight / 60
		--"(thrust / (1 + weight / 10000000) - ((1500 * speed * speed + 1500 * abs(speed)) * (width * 0.5) + 10000) * sign(speed)) / weight / 60"
  utility_constants.space_platform_acceleration_expression = "(thrust / (1 + weight / 10000000) - ((1500 * speed * speed + 1500 * abs(speed)) * (width * 0.05) + 10000) * sign(speed)) / weight / 60"

--remove character icon
	data.raw["character"]["character"].icon = "__core__/graphics/empty.png"

--tile adjust
	local tile_collision_masks = require("__base__/prototypes/tile/tile-collision-masks")
	data.raw.tile ["ice-smooth"].collision_mask = tile_collision_masks.ground()
	--tile pollution handling
	for _, tile in pairs(data.raw.tile) do
		tile.absorptions_per_second = nil
	end
	local per_chunk_per_min = 61440

--train wagons
	local KMH = 216
	data.raw ["locomotive"]["locomotive"].energy_source.fuel_categories = {"chemical","electric"}
	data.raw ["locomotive"]["locomotive"].energy_source.fuel_inventory_size = 2
	data.raw ["locomotive"]["locomotive"].energy_source.burnt_inventory_size = 2
	data.raw ["locomotive"]["locomotive"].max_speed = 100 / KMH
	data.raw ["locomotive"]["locomotive"].max_power = "1MW"
	data.raw ["locomotive"]["locomotive"].weight = 25000
	data.raw ["cargo-wagon"]["cargo-wagon"].weight = 5000
	data.raw ["fluid-wagon"]["fluid-wagon"].weight = 5000

--asteroid collector adjust
	data.raw.item ["asteroid-collector"].flags = {"always-show"}

--heat pipe adjust
	data.raw["heat-pipe"]["heat-pipe"].heat_buffer.specific_heat = "250kJ"

--adjust belts

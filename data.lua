--this is the part where I murder the game, Thanks to Rseding91's fourm comments which helped me do this.

data.raw ["technology"] = {}
data.raw ["tips-and-tricks-item"] = {}
data.raw ["utility-constants"]["default"].main_menu_simulations = {}

--vanila recipe deletions

data.raw.item ["asteroid-collector"].flags = {"always-show"}
data.raw.item ["space-platform-foundation"].flags = {"always-show"}
data.raw.item ["space-platform-foundation"].stack_size = 250
data.raw.item ["heat-pipe"].flags = {"always-show"}

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
data.raw ["shortcut"]["toggle-personal-roboport"].unavailable_until_unlocked = nil
data.raw ["shortcut"]["toggle-equipment-movement-bonus"].unavailable_until_unlocked = nil
data.raw ["shortcut"]["give-discharge-defense-remote"].unavailable_until_unlocked = nil
data.raw ["shortcut"]["give-artillery-targeting-remote"].unavailable_until_unlocked = nil

-- hide vanilla content from game, this seems easier than outright removing certain things due to dependancies.
-- expand brain.png if this works.

local hidden_items = {"stone-brick","wood","coal","stone","iron-ore","copper-ore","uranium-ore","spoilage","pistol","ice","iron-plate","copper-plate","steel-plate","solid-fuel","plastic-bar","sulfur","battery","explosives","carbon","iron-gear-wheel","iron-stick","copper-cable",}

local hidden_fluids = {"crude-oil","petroleum-gas","light-oil","heavy-oil","lubricant","sulfuric-acid","molten-iron","molten-copper","holmium-solution","electrolyte","ammoniacal-solution","ammonia","fluorine","fluoroketone-hot","flouroketone-cold","lithium-brine"}

local disabled_recipes = {"wooden-chest","burner-inserter","stone-brick","burner-mining-drill","stone-furnace","iron-plate","copper-plate","iron-gear-wheel","firearm-magazine","light-armor",}

local removed_recipes = {"stone-brick","space-platform-foundation","small-lamp","constant-combinator","selector-combinator","arithmetic-combinator","decider-combinator","decider-combinator","power-switch","programmable-speaker","display-panel","repair-pack","construction-robot","logistic-robot","electric-mining-drill","pumpjack","pipe","pipe-to-ground","pump","storage-tank","rail","cargo-wagon","fluid-wagon","rail-signal","rail-chain-signal","train-stop","locomotive","radar","cargo-landing-pad","speed-module","efficiency-module","transport-belt","fast-transport-belt","underground-belt","fast-underground-belt","splitter","fast-splitter","toolbelt-equipment","rocket-silo","rocket-part","iron-chest","basic-oil-processing","advanced-oil-processing","simple-coal-liquefaction","coal-liquefaction","heavy-oil-cracking","light-oil-cracking","solid-fuel-from-petroleum-gas","solid-fuel-from-light-oil","solid-fuel-from-heavy-oil","acid-neutralisation","steam-condensation","ice-melting","iron-plate","copper-plate","steel-plate","plastic-bar","coal-synthesis","carbon","explosives","battery","sulfur","iron-gear-wheel","iron-stick","copper-cable","sulfuric-acid","thruster-fuel","advanced-thruster-fuel","thruster-oxidizer","advanced-thruster-oxidizer","concrete","concrete-from-molten-iron","hazard-concrete","refined-concrete","refined-hazard-concrete","barrel","cliff-explosives"}

for _, item in pairs(data.raw.item) do
	item.default_import_location = "arrival"
end


--hide items
for name, item in pairs(data.raw.item) do
	for _, hideName in ipairs(hidden_items) do
		if item.name == hideName then
		item.hidden = true
		item.hidden_in_factoriopedia = true
		end
	end
end
--hide fluids
for name, fluid in pairs(data.raw.fluid) do
	for _, hideName in ipairs(hidden_fluids) do
		if fluid.name == hideName then
		fluid.hidden = true
		fluid.hidden_in_factoriopedia = true
		end
	end
end
--disable recipies
for name, recipe in pairs(data.raw.recipe) do
	for _, hideName in ipairs(disabled_recipes) do
		if recipe.name == hideName then
			recipe.enabled = false
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

--i'd like to also hide entites from the factoriopedia.
data.raw.resource["iron-ore"].hidden = true
data.raw.resource["stone"].hidden = true
data.raw.resource["coal"].hidden = true
data.raw.resource["copper-ore"].hidden = true
data.raw.resource["uranium-ore"].hidden = true



--raw fish and the pistol are under a different type, so they have to be handled seperately.
data.raw.capsule ["raw-fish"].hidden = true
data.raw.gun ["pistol"].hidden = true

--adjust vanilla content

local tile_collision_masks = require("__base__/prototypes/tile/tile-collision-masks")
data:extend({{ type = "collision-layer", name = "platform" }})--quick, we have to add an entire collision layer just to unfuck our radiators.

local KMH = 216

data.raw ["locomotive"]["locomotive"].energy_source.fuel_categories = {"chemical","electric"}
data.raw ["locomotive"]["locomotive"].energy_source.fuel_inventory_size = 2
data.raw ["locomotive"]["locomotive"].energy_source.burnt_inventory_size = 2
data.raw ["locomotive"]["locomotive"].max_speed = 100 / KMH
data.raw ["locomotive"]["locomotive"].max_power = "1MW"
data.raw ["locomotive"]["locomotive"].weight = 25000
data.raw ["cargo-wagon"]["cargo-wagon"].weight = 5000
data.raw ["fluid-wagon"]["fluid-wagon"].weight = 5000
data.raw.tile ["ice-smooth"].collision_mask = tile_collision_masks.ground()
data.raw.tile ["space-platform-foundation"].collision_mask = {layers={ground_tile=true,platform=true}}

--this is the part where I add stuff into the game again

--achievements
require("prototypes.achievements")

--buildings
require("prototypes.buildings.belts")
require("prototypes.buildings.containers")
require("prototypes.buildings.crafting")
require("prototypes.buildings.electrical")
require("prototypes.buildings.inserters")
require("prototypes.buildings.labs")
require("prototypes.buildings.military")
require("prototypes.buildings.roboports")
require("prototypes.buildings.thermal")

--categories
require("prototypes.categories.equipment-grid")
require("prototypes.categories.fuel")
require("prototypes.categories.item-groups")
require("prototypes.categories.recipe")

--entities
require("prototypes.entity.asteroid")
require("prototypes.entity.enemies")
require("prototypes.entity.explosions")
require("prototypes.entity.resources")
require("prototypes.entity.smoke")
require("prototypes.entity.spiders")

--equipment
require("prototypes.equipment")
require("prototypes.equipment-grids")

--virtual signals
require("prototypes.virtual-signals")

--items
---buildings
require("prototypes.items.buildings.containers")
require("prototypes.items.buildings.crafting")
require("prototypes.items.buildings.electrical")
require("prototypes.items.buildings.inserters")
require("prototypes.items.buildings.labs")
require("prototypes.items.buildings.military")
require("prototypes.items.buildings.modules-beacons")
require("prototypes.items.buildings.roboports")
require("prototypes.items.buildings.thermal")
---fluids
require("prototypes.items.fluids")
---inventory items
require("prototypes.items.intermediates")
require("prototypes.items.raw-resources")
require("prototypes.items.science")
require("prototypes.items.spiders")

--menu simulations
require("prototypes.menu-simulations.menu-simulations")

--particles
require("prototypes.particles.asteroid-particles")

--planets
require("prototypes.planet.planet")
require("prototypes.planet.arrival-map-gen")

--recipes
require("prototypes.recipes.assembling-machine")
require("prototypes.recipes.charger-discharger")
require("prototypes.recipes.chemistry-plant")
require("prototypes.recipes.furnace")
require("prototypes.recipes.matter-reconstructor")
require("prototypes.recipes.micro-assembler")
require("prototypes.recipes.refinery")
require("prototypes.recipes.small-crusher")
require("prototypes.recipes.special")
require("prototypes.recipes.supercomputer")

--sound
require("sound.ambient.ambient-sounds")
require("sound.utility.sounds")

--technolgoies
require("prototypes.technologies.platform-phase")
require("prototypes.technologies.arrival-phase")
require("prototypes.technologies.extra")

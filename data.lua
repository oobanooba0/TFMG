--this is the part where I murder the game, Thanks to Rseding91's fourm comments which helped me do this.
local tile_collision_masks = require("__base__/prototypes/tile/tile-collision-masks")

data.raw ["technology"] = {}
data.raw ["tips-and-tricks-item"] = {}
data.raw ["utility-constants"]["default"].main_menu_simulations = {}

--adjust vanilla content
local hidden_items = {"wood","coal","stone","iron-ore","copper-ore","uranium-ore","spoilage","pistol",}
local hidden_recipes = {}
local disabled_recipes = {"wooden-chest","iron-chest","transport-belt","burner-inserter","stone-brick","burner-mining-drill","stone-furnace","iron-plate","copper-plate","iron-gear-wheel","firearm-magazine","light-armor",}
--i'd like to also hide entites from the factoriopedia, but i'm not sure how.
--raw fish and the pistol are under a different type, so they have to be handled seperately.
data.raw.capsule ["raw-fish"].hidden = true
data.raw.gun ["pistol"].hidden = true

data.raw.item ["asteroid-collector"].flags = {"always-show"}
data.raw.item ["space-platform-foundation"].flags = {"always-show"}
data.raw.item ["heat-pipe"].flags = {"always-show"}
data.raw.recipe ["space-platform-foundation"] = nil
data.raw.recipe ["small-lamp"] = nil
data.raw.recipe ["constant-combinator"] = nil
data.raw.recipe ["selector-combinator"] = nil
data.raw.recipe ["arithmetic-combinator"] = nil
data.raw.recipe ["decider-combinator"] = nil
data.raw.recipe ["power-switch"] = nil
data.raw.recipe ["programmable-speaker"] = nil
data.raw.recipe ["display-panel"] = nil
data.raw.recipe ["repair-pack"] = nil
data.raw.recipe ["construction-robot"] = nil
data.raw.recipe ["logistic-robot"] = nil
data.raw.recipe ["electric-mining-drill"] = nil
data.raw.recipe ["pumpjack"] = nil
data.raw.recipe ["pipe"] = nil
data.raw.recipe ["pipe-to-ground"] = nil
data.raw.recipe ["pump"] = nil
data.raw.recipe ["storage-tank"] = nil


data.raw.tile ["ice-smooth"].collision_mask = tile_collision_masks.ground()
data.raw["mining-drill"]["electric-mining-drill"].mining_speed = 1
data.raw["mining-drill"]["electric-mining-drill"].energy_usage = "0.5MW"
data.raw["mining-drill"]["pumpjack"].energy_usage = "1MW"


--shortcuts woooooooooo

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
for name, item in pairs(data.raw.item) do
	for _, hideName in ipairs(hidden_items) do
		if item.name == hideName then
		item.hidden = true
		item.hidden_in_factoriopedia = true
		end
	end
end
--hide recipies
for name, recipe in pairs(data.raw.recipe) do
	for _, hideName in ipairs(hidden_recipes) do
		if recipe.name == hideName then
		recipe.hidden = true
		recipe.hidden_in_factoriopedia = true
		end
	end
end
--disable recipies
for name, recipe in pairs(data.raw.recipe) do
	for _, disableName in ipairs(disabled_recipes) do
		if recipe.name == disableName then
			recipe.enabled = false
		end
	end
end

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
require("prototypes.buildings.roboports")
require("prototypes.buildings.thermal")

--categories
require("prototypes.categories.item-groups")
require("prototypes.categories.recipe")
require("prototypes.categories.equipment-grid")

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

--items
---buildings
require("prototypes.items.buildings.belts")
require("prototypes.items.buildings.containers")
require("prototypes.items.buildings.crafting")
require("prototypes.items.buildings.electrical")
require("prototypes.items.buildings.inserters")
require("prototypes.items.buildings.labs")
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
require("prototypes.recipes.chemistry-plant")
require("prototypes.recipes.furnace")
require("prototypes.recipes.matter-reconstructor")
require("prototypes.recipes.refinery")
require("prototypes.recipes.special")
require("prototypes.recipes.supercomputer")

--sound
require("sound.ambient.ambient-sounds")

--technolgoies
require("prototypes.technologies.platform-phase")
require("prototypes.technologies.arrival-phase")

--this is the part where I murder the game, Thanks to Rseding91's fourm comments which helped me do this.

data.raw ["technology"] = {}
data.raw ["shortcuts"] = {}
data.raw ["tips-and-tricks-item"] = {}
data.raw ["research-achievement"] = {}

--adjust vanilla content
local hidden_items = {"wood","coal","stone","iron-ore","copper-ore","uranium-ore","raw-fish","spoilage","pistol",}
local hidden_recipes = {}
local disabled_recipes = {"wooden-cheest","iron-chest","transport-belt","burner-inserter","stone-brick","burner-mining-drill","stone-furnace","iron-plate","copper-plate","iron-gear-wheel","firearm-magazine","light-armor",}
--i'd like to also hide entites from the factoriopedia, but i'm not sure how.
--raw fish and the pistol seem to be immune to being hidden, not sure why.


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

data.raw.recipe ["space-platform-foundation"].enabled = true

--this is the part where I add stuff into the game again

--buildings
require("prototypes.buildings.belts")
require("prototypes.buildings.crafting")
require("prototypes.buildings.generator")
require("prototypes.buildings.inserters")
require("prototypes.buildings.thermal")

--categories
require("prototypes.categories.item-groups")
require("prototypes.categories.recipe")

--entities
require("prototypes.entity.asteroid")
require("prototypes.entity.explosions")
require("prototypes.entity.smoke")
require("prototypes.entity.spiders")

--items
---buildings
require("prototypes.items.buildings.belts")
require("prototypes.items.buildings.crafting")
require("prototypes.items.buildings.generator")
require("prototypes.items.buildings.inserters")
require("prototypes.items.buildings.thermal")
---other items
require("prototypes.items.asteroid-chunks")
require("prototypes.items.intermediates")
require("prototypes.items.spiders")

--menu simulations
require("prototypes.menu-simulations.menu-simulations")

--particles
require("prototypes.particles.asteroid-particles")

--planets
require("prototypes.planet.planet")

--recipes
require("prototypes.recipes.basic-assembling")
require("prototypes.recipes.matter-reconstructor")
require("prototypes.recipes.special")

--technolgoies
require("prototypes.technologies.platformphase")

--shortcuts
require("prototypes.shortcuts")
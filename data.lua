--this is the part where I murder the game, Thanks to Rseding91's fourm comments which helped me do this.

data.raw ["technology"] = {}
data.raw ["shortcuts"] = {}
data.raw ["tips-and-tricks-item"] = {}
data.raw ["research-achievement"] = {}

--this is the part where I add stuff

--buildings
require("prototypes.buildings.belts")
require("prototypes.buildings.crafting")

--categories
require("prototypes.categories.recipe")

--entities
require("prototypes.entity.asteroid")
require("prototypes.entity.explosions")
require("prototypes.entity.smoke")

--items
require("prototypes.items.buildings.belts")
require("prototypes.items.buildings.crafting")
require("prototypes.items.intermediates")
require("prototypes.items.asteroid-chunks")

--particles
require("prototypes.particles.asteroid-particles")

--planets
require("prototypes.planet.planet")

--recipes
require("prototypes.recipes.basic-assembling")
require("prototypes.recipes.matter-reconstructor")

--technolgoies
require("prototypes.technologies.platformphase")

--other stuff
require("prototypes.shortcuts")
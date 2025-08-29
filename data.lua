--this is the part where I murder the game, Thanks to Rseding91's fourm comments which helped me do this.

data.raw ["technology"] = {}
data.raw ["shortcuts"] = {}
data.raw ["tips-and-tricks-item"] = {}
data.raw ["research-achievement"] = {}

--this is the part where I add stuff

--buildings
require("prototypes.buildings.belts")
require("prototypes.buildings.crafting")
require("prototypes.buildings.generator")
require("prototypes.buildings.inserters")
require("prototypes.buildings.thermal")

--categories
require("prototypes.categories.recipe")

--entities
require("prototypes.entity.asteroid")
require("prototypes.entity.explosions")
require("prototypes.entity.smoke")

--items
---buildings
require("prototypes.items.buildings.belts")
require("prototypes.items.buildings.crafting")
require("prototypes.items.buildings.generator")
require("prototypes.items.buildings.inserters")
require("prototypes.items.buildings.thermal")
---other items
require("prototypes.items.intermediates")
require("prototypes.items.asteroid-chunks")

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
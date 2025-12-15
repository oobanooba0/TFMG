-- my utility functions
	require("util.TFMG")
	TFMG = ("util.TFMG")

--end of vanilla
	require("prototypes.vanilla-content-obliterator")

--other mod compat
	require("compat.spider-launcher.prototypes")

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
	require("prototypes.buildings.pipes")
	require("prototypes.buildings.roboports")
	require("prototypes.buildings.thermal")
	require("prototypes.buildings.thrusters")
	require("prototypes.buildings.tiles")

--categories
	require("prototypes.categories.equipment-grid")
	require("prototypes.categories.fuel")
	require("prototypes.categories.item-groups")
	require("prototypes.categories.recipe")

--entities
	require("prototypes.entity.asteroid")
	require("prototypes.entity.enemies.ice-worm")
	require("prototypes.entity.enemies.crawlers")
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
	require("prototypes.items.buildings.pipes")
	require("prototypes.items.buildings.modules-beacons")
	require("prototypes.items.buildings.roboports")
	require("prototypes.items.buildings.thermal")
	require("prototypes.items.buildings.tiles")
---fluids
	require("prototypes.items.fluids")
---inventory items
	require("prototypes.items.intermediates")
	require("prototypes.items.raw-resources")
	require("prototypes.items.science")
	require("prototypes.items.spiders")
	require("prototypes.items.others")

--menu simulations
	require("prototypes.menu-simulations.menu-simulations")

--particles
	require("prototypes.particles.asteroid-particles")

--planets
	require("prototypes.planet.arrival-map-gen")
	require("prototypes.planet.planet")
	require("prototypes.planet.map-gen-presets")

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
	require("prototypes.technologies.space-phase")
	require("prototypes.technologies.extra")

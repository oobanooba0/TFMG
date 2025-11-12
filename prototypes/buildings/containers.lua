local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")

--easy changes

local chest_1_slots = 5


--vanilla chest modifications

local chest_1 = data.raw["container"]["steel-chest"]
chest_1.inventory_size = chest_1_slots
chest_1.surface_conditions = nil

local storage_chest_1 = data.raw["logistic-container"]["storage-chest"]
storage_chest_1.inventory_size = chest_1_slots

local provider_chest_1 = data.raw["logistic-container"]["passive-provider-chest"]
provider_chest_1.inventory_size = chest_1_slots
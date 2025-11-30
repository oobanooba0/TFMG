local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")

--easy changes

local chest_1_slots = 5

local chest_2_slots = 1
local chest_2_stacks = 24


--vanilla chest modifications

local chest_1 = data.raw["container"]["steel-chest"]
chest_1.inventory_size = chest_1_slots
chest_1.surface_conditions = nil

local storage_chest_1 = data.raw["logistic-container"]["storage-chest"]
storage_chest_1.inventory_size = chest_1_slots

local provider_chest_1 = data.raw["logistic-container"]["passive-provider-chest"]
provider_chest_1.inventory_size = chest_1_slots

data:extend({
  {--chest 2
    type = "container",
    name = "chest-2",
    icon = "__Krastorio2Assets__/icons/entities/strongbox.png",
    flags = { "placeable-player", "player-creation" },
    fast_replaceable_group = "container",
    minable = { mining_time = 0.5, result = "chest-2" },
    collision_box = { { -0.8, -0.8 }, { 0.8, 0.8 } },
    selection_box = { { -1, -1 }, { 1, 1 } },
    inventory_type = "with_custom_stack_size",
    inventory_properties = {
      stack_size_multiplier = chest_2_stacks
    },
    inventory_size = chest_2_slots,
    max_health = 1000,
    corpse = "big-remnants",
    damaged_trigger_effect = hit_effects.entity(),
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    vehicle_impact_sound = sounds.generic_impact,
    picture = {
      filename = "__Krastorio2Assets__/buildings/strongbox/strongbox.png",
      priority = "extra-high",
      width = 340,
      height = 340,
      scale = 0.25,
    },
    circuit_connector = circuit_connector_definitions["chest"],
    circuit_wire_connection_point = circuit_connector_definitions["chest"].points,
  },

})
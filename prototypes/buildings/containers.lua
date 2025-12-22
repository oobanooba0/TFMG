local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")

--easy changes

local chest_1_slots = 5

local chest_2_slots = 1
local chest_2_stacks = 24
local chest_2_trash_inventory_size = 10


--vanilla chest modifications

local chest_1 = data.raw["container"]["steel-chest"]
chest_1.inventory_size = chest_1_slots
chest_1.surface_conditions = nil

local storage_chest_1 = data.raw["logistic-container"]["storage-chest"]
storage_chest_1.inventory_size = chest_1_slots

local provider_chest_1 = data.raw["logistic-container"]["passive-provider-chest"]
provider_chest_1.inventory_size = chest_1_slots

data:extend({
  {--cargo bay proxy
    type = "proxy-container",
    name = "cargo-bay-proxy",
    collision_box = {{-1.7, -1.7}, {1.7, 1.7}}, --smaller than the hub by just enough to avoid collisions
    selection_box = {{-2, -2}, {2, 2}},
    build_grid_size = 2,
    collision_mask = {layers = {}},
    draw_inventory_content = false,
    selectable_in_game = false,
    selection_priority = 49,
    flags = {"not-on-map"},
    hidden = true,
    hidden_in_factoriopedia = true,
    --to be removed but it might help with debug.
    --icon = "__Krastorio2Assets__/icons/entities/strongbox.png",
    --picture = {
    --  filename = "__Krastorio2Assets__/buildings/strongbox/strongbox.png",
    --  priority = "extra-high",
    --  width = 340,
    --  height = 340,
    --  scale = 0.5,
    --},
  },




  {--chest 2
    type = "container",
    name = "chest-2",
    icon = "__Krastorio2Assets__/icons/entities/strongbox.png",
    flags = { "placeable-player", "player-creation" },
    fast_replaceable_group = "chest-2",
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
    circuit_wire_max_distance = default_circuit_wire_max_distance,
    custom_tooltip_fields = {{
      name = {"TFMG.multislot-tooltip"},
      value = tostring(chest_2_stacks),
      order = 250,
    }}
  },
  {--passive-provider-chest 2
    type = "logistic-container",
    name = "passive-provider-chest-2",
    icon = "__Krastorio2Assets__/icons/entities/passive-provider-strongbox.png",
    flags = { "placeable-player", "player-creation" },
    fast_replaceable_group = "chest-2",
    minable = { mining_time = 0.5, result = "passive-provider-chest-2" },
    collision_box = { { -0.8, -0.8 }, { 0.8, 0.8 } },
    selection_box = { { -1, -1 }, { 1, 1 } },
    inventory_type = "with_custom_stack_size",
    inventory_properties = {
      stack_size_multiplier = chest_2_stacks
    },
    inventory_size = chest_2_slots,
    logistic_mode = "passive-provider",
    max_health = 1000,
    corpse = "big-remnants",
    damaged_trigger_effect = hit_effects.entity(),
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    vehicle_impact_sound = sounds.generic_impact,
    picture = {
      filename = "__Krastorio2Assets__/buildings/passive-provider-strongbox/passive-provider-strongbox.png",
      priority = "extra-high",
      width = 340,
      height = 340,
      scale = 0.25,
    },
    opened_duration = logistic_chest_opened_duration,
    circuit_connector = circuit_connector_definitions["chest"],
    circuit_wire_connection_point = circuit_connector_definitions["chest"].points,
    circuit_wire_max_distance = default_circuit_wire_max_distance,
    custom_tooltip_fields = {{
      name = {"TFMG.multislot-tooltip"},
      value = tostring(chest_2_stacks),
      order = 250,
    }}
  },
  {--active-provider-chest 2
    type = "logistic-container",
    name = "active-provider-chest-2",
    icon = "__Krastorio2Assets__/icons/entities/active-provider-strongbox.png",
    flags = { "placeable-player", "player-creation" },
    fast_replaceable_group = "chest-2",
    minable = { mining_time = 0.5, result = "active-provider-chest-2" },
    collision_box = { { -0.8, -0.8 }, { 0.8, 0.8 } },
    selection_box = { { -1, -1 }, { 1, 1 } },
    inventory_type = "with_custom_stack_size",
    inventory_properties = {
      stack_size_multiplier = chest_2_stacks
    },
    inventory_size = chest_2_slots,
    logistic_mode = "active-provider",
    max_health = 1000,
    corpse = "big-remnants",
    damaged_trigger_effect = hit_effects.entity(),
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    vehicle_impact_sound = sounds.generic_impact,
    picture = {
      filename = "__Krastorio2Assets__/buildings/active-provider-strongbox/active-provider-strongbox.png",
      priority = "extra-high",
      width = 340,
      height = 340,
      scale = 0.25,
    },
    opened_duration = logistic_chest_opened_duration,
    circuit_connector = circuit_connector_definitions["chest"],
    circuit_wire_connection_point = circuit_connector_definitions["chest"].points,
    circuit_wire_max_distance = default_circuit_wire_max_distance,
    custom_tooltip_fields = {{
      name = {"TFMG.multislot-tooltip"},
      value = tostring(chest_2_stacks),
      order = 250,
    }},
    hidden = true,
  },
  {--storage-chest 2
    type = "logistic-container",
    name = "storage-chest-2",
    icon = "__Krastorio2Assets__/icons/entities/storage-strongbox.png",
    flags = { "placeable-player", "player-creation" },
    fast_replaceable_group = "chest-2",
    minable = { mining_time = 0.5, result = "storage-chest-2" },
    collision_box = { { -0.8, -0.8 }, { 0.8, 0.8 } },
    selection_box = { { -1, -1 }, { 1, 1 } },
    inventory_type = "with_custom_stack_size",
    inventory_properties = {
      stack_size_multiplier = chest_2_stacks
    },
    inventory_size = chest_2_slots,
    logistic_mode = "storage",
    max_logistic_slots = 1,
    max_health = 1000,
    corpse = "big-remnants",
    damaged_trigger_effect = hit_effects.entity(),
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    vehicle_impact_sound = sounds.generic_impact,
    picture = {
      filename = "__Krastorio2Assets__/buildings/storage-strongbox/storage-strongbox.png",
      priority = "extra-high",
      width = 340,
      height = 340,
      scale = 0.25,
    },
    opened_duration = logistic_chest_opened_duration,
    circuit_connector = circuit_connector_definitions["chest"],
    circuit_wire_connection_point = circuit_connector_definitions["chest"].points,
    circuit_wire_max_distance = default_circuit_wire_max_distance,
    custom_tooltip_fields = {{
      name = {"TFMG.multislot-tooltip"},
      value = tostring(chest_2_stacks),
      order = 250,
    }}
  },
  {--buffer-chest 2
    type = "logistic-container",
    name = "buffer-chest-2",
    icon = "__Krastorio2Assets__/icons/entities/buffer-strongbox.png",
    flags = { "placeable-player", "player-creation" },
    fast_replaceable_group = "chest-2",
    minable = { mining_time = 0.5, result = "buffer-chest-2" },
    collision_box = { { -0.8, -0.8 }, { 0.8, 0.8 } },
    selection_box = { { -1, -1 }, { 1, 1 } },
    inventory_type = "with_custom_stack_size",
    inventory_properties = {
      stack_size_multiplier = chest_2_stacks
    },
    inventory_size = chest_2_slots,
    trash_inventory_size = chest_2_trash_inventory_size,
    logistic_mode = "buffer",
    max_health = 1000,
    corpse = "big-remnants",
    damaged_trigger_effect = hit_effects.entity(),
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    vehicle_impact_sound = sounds.generic_impact,
    picture = {
      filename = "__Krastorio2Assets__/buildings/buffer-strongbox/buffer-strongbox.png",
      priority = "extra-high",
      width = 340,
      height = 340,
      scale = 0.25,
    },
    opened_duration = logistic_chest_opened_duration,
    circuit_connector = circuit_connector_definitions["chest"],
    circuit_wire_connection_point = circuit_connector_definitions["chest"].points,
    circuit_wire_max_distance = default_circuit_wire_max_distance,
    custom_tooltip_fields = {{
      name = {"TFMG.multislot-tooltip"},
      value = tostring(chest_2_stacks),
      order = 250,
    }},
    hidden = true,
  },
  {--requester-chest 2
    type = "logistic-container",
    name = "requester-chest-2",
    icon = "__Krastorio2Assets__/icons/entities/requester-strongbox.png",
    flags = { "placeable-player", "player-creation" },
    fast_replaceable_group = "chest-2",
    minable = { mining_time = 0.5, result = "requester-chest-2" },
    collision_box = { { -0.8, -0.8 }, { 0.8, 0.8 } },
    selection_box = { { -1, -1 }, { 1, 1 } },
    inventory_type = "with_custom_stack_size",
    inventory_properties = {
      stack_size_multiplier = chest_2_stacks
    },
    inventory_size = chest_2_slots,
    logistic_mode = "requester",
    trash_inventory_size = chest_2_trash_inventory_size,
    max_health = 1000,
    corpse = "big-remnants",
    damaged_trigger_effect = hit_effects.entity(),
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    vehicle_impact_sound = sounds.generic_impact,
    picture = {
      filename = "__Krastorio2Assets__/buildings/requester-strongbox/requester-strongbox.png",
      priority = "extra-high",
      width = 340,
      height = 340,
      scale = 0.25,
    },
    opened_duration = logistic_chest_opened_duration,
    circuit_connector = circuit_connector_definitions["chest"],
    circuit_wire_connection_point = circuit_connector_definitions["chest"].points,
    circuit_wire_max_distance = default_circuit_wire_max_distance,
    custom_tooltip_fields = {{
      name = {"TFMG.multislot-tooltip"},
      value = tostring(chest_2_stacks),
      order = 250,
    }},
    hidden = true,
  },

})
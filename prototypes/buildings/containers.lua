local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")
local container_1_stacks = 5
local container_1_slots = 1
  data:extend({
  {
    type = "container",
    name = "container-1",
    icon = "__base__/graphics/icons/iron-chest.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.2, result = "container-1"},
    max_health = 200,
    corpse = "iron-chest-remnants",
    dying_explosion = "iron-chest-explosion",
    open_sound = sounds.metallic_chest_open,
    close_sound = sounds.metallic_chest_close,
    resistances =
    {
      {
        type = "fire",
        percent = 80
      },
      {
        type = "impact",
        percent = 30
      }
    },
    collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    damaged_trigger_effect = hit_effects.entity(),
    fast_replaceable_group = "container",
    inventory_type = "with_custom_stack_size",
    inventory_size = container_1_slots,
    inventory_properties = {stack_size_multiplier = container_1_stacks},
    impact_category = "metal",
    icon_draw_specification = {scale = 0.7},
    picture =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/iron-chest/iron-chest.png",
          priority = "extra-high",
          width = 66,
          height = 76,
          shift = util.by_pixel(-0.5, -0.5),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/iron-chest/iron-chest-shadow.png",
          priority = "extra-high",
          width = 110,
          height = 50,
          shift = util.by_pixel(10.5, 6),
          draw_as_shadow = true,
          scale = 0.5
        }
      }
    },
    circuit_connector = circuit_connector_definitions["chest"],
    circuit_wire_max_distance = default_circuit_wire_max_distance
  },
  {--passive provider container 1
    type = "logistic-container",
    name = "passive-provider-container-1",
    icon = "__base__/graphics/icons/passive-provider-chest.png",
    flags = {"placeable-player", "player-creation"},
    minable = {mining_time = 0.1, result = "passive-provider-container-1"},
    max_health = 350,
    corpse = "passive-provider-chest-remnants",
    dying_explosion = "passive-provider-chest-explosion",
    collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    damaged_trigger_effect = hit_effects.entity(),
    resistances =
    {
      {
        type = "fire",
        percent = 90
      },
      {
        type = "impact",
        percent = 60
      }
    },
    fast_replaceable_group = "container",
    inventory_type = "with_custom_stack_size",
    inventory_size = container_1_slots,
    inventory_properties = {stack_size_multiplier = container_1_stacks},
    icon_draw_specification = {scale = 0.7},
    logistic_mode = "passive-provider",
    open_sound = sounds.metallic_chest_open,
    close_sound = sounds.metallic_chest_close,
    animation_sound = sounds.logistics_chest_open,
    impact_category = "metal",
    opened_duration = logistic_chest_opened_duration,
    animation =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/logistic-chest/passive-provider-chest.png",
          priority = "extra-high",
          width = 66,
          height = 74,
          frame_count = 7,
          shift = util.by_pixel(0, -2),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/logistic-chest/logistic-chest-shadow.png",
          priority = "extra-high",
          width = 112,
          height = 46,
          repeat_count = 7,
          shift = util.by_pixel(12, 4.5),
          draw_as_shadow = true,
          scale = 0.5
        }
      }
    },
    circuit_connector = circuit_connector_definitions["chest"],
    circuit_wire_max_distance = default_circuit_wire_max_distance
  },
  {--storage container 1
    type = "logistic-container",
    name = "storage-container-1",
    icon = "__base__/graphics/icons/storage-chest.png",
    flags = {"placeable-player", "player-creation"},
    minable = {mining_time = 0.1, result = "storage-container-1"},
    max_health = 350,
    max_logistic_slots = 1,
    corpse = "storage-chest-remnants",
    dying_explosion = "storage-chest-explosion",
    collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    damaged_trigger_effect = hit_effects.entity(),
    resistances =
    {
      {
        type = "fire",
        percent = 90
      },
      {
        type = "impact",
        percent = 60
      }
    },
    fast_replaceable_group = "container",
    inventory_type = "with_custom_stack_size",
    inventory_size = container_1_slots,
    inventory_properties = {stack_size_multiplier = container_1_stacks},
    icon_draw_specification = {scale = 0.7},
    logistic_mode = "storage",
    open_sound = sounds.metallic_chest_open,
    close_sound = sounds.metallic_chest_close,
    animation_sound = sounds.logistics_chest_open,
    impact_category = "metal",
    opened_duration = logistic_chest_opened_duration,
    animation =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/logistic-chest/storage-chest.png",
          priority = "extra-high",
          width = 66,
          height = 74,
          frame_count = 7,
          shift = util.by_pixel(0, -2),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/logistic-chest/logistic-chest-shadow.png",
          priority = "extra-high",
          width = 112,
          height = 46,
          repeat_count = 7,
          shift = util.by_pixel(12, 4.5),
          draw_as_shadow = true,
          scale = 0.5
        }
      }
    },
    circuit_connector = circuit_connector_definitions["chest"],
    circuit_wire_max_distance = default_circuit_wire_max_distance
  },
})  
local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")
  
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
    inventory_properties = {stack_size_multiplier = 5},
    inventory_size = 1,
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
})  
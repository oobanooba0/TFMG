local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")

data:extend({
    {--proton decay RTG
    type = "electric-energy-interface",
    name = "proton-decay-thermolectric-generator",
    icons = {{icon = "__base__/graphics/icons/nuclear-reactor.png", tint = {1, 1, 1, 1}}},
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "proton-decay-thermolectric-generator"},
    max_health = 150,
    corpse = "nuclear-reactor-remnants",
    dying_explosion = "nuclear-reactor-explosion",
    subgroup = "other",
    collision_box = {{-2.2, -2.2}, {2.2, 2.2}},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    damaged_trigger_effect = hit_effects.entity(),
    drawing_box_vertical_extension = 0.5,
    gui_mode = "none",
    allow_copy_paste = true,
    energy_source =
    {
      type = "electric",
      buffer_capacity = "0.001GJ",
      usage_priority = "primary-output"
    },
    energy_production = "1GW",
    energy_usage = "0kW",
    -- also 'pictures' for 4-way sprite is available, or 'animation' resp. 'animations'
    picture =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/nuclear-reactor/reactor.png",
          width = 302,
          height = 318,
          scale = 0.5,
          shift = util.by_pixel(-5, -7)
        },
        {
          filename = "__base__/graphics/entity/nuclear-reactor/reactor-shadow.png",
          width = 525,
          height = 323,
          scale = 0.5,
          shift = { 1.625, 0 },
          draw_as_shadow = true
        }
      }
    },
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    impact_category = "metal",
  },
})
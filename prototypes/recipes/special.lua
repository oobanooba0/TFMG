data:extend({
  {
    type = "recipe",
    category = "radiator",
    name = "evaporation-cooling",
    icons = {
      {icon = "__base__/graphics/icons/fluid/steam.png", shift = {0,-8}},
      {icon = "__base__/graphics/icons/signal/signal-fire.png",shift = {0,8}},
    },
    energy_required = 1,
    enabled = false,
    hidden = true,
    ingredients = {{type = "fluid", name = "water", amount = 10}},
    results = {},
  },
  {
    type = "recipe",
    category = "rocket-building",
    name = "rocket-part",
    energy_required = 16,
    enabled = true,
    ingredients = {
      { type = "item", name = "high-performance-structure", amount = 4 },
      { type = "item", name = "ai-processor", amount = 1 },
      { type = "fluid", name = "thruster-fuel", amount = 64},
      { type = "fluid", name = "thruster-oxidizer", amount = 64},
    },
    results = {
      { type = "item", name = "rocket-part", amount = 2 }
    },
  },
})
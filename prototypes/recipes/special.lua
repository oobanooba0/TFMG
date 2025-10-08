data:extend({
  {
    type = "recipe",
    category = "special",
    name = "small-radiator-radiation",
    icon = "__base__/graphics/icons/signal/signal-fire.png",
    energy_required = 100,
    enabled = true,
    ingredients = {},
    results = {},--possible that i could use a spoiling output of a heat item to make a thermal efficiency mechanic?
  },
  {
    type = "recipe",
    category = "rocket-building",
    name = "rocket-part",
    energy_required = 10,
    enabled = true,
    ingredients = {
      { type = "item", name = "high-performance-structure", amount = 2 },
      { type = "item", name = "ai-processor", amount = 1 },
      { type = "fluid", name = "thruster-fuel", amount = 10},
      { type = "fluid", name = "thruster-oxidizer", amount = 10},
    },
    results = {
      { type = "item", name = "rocket-part", amount = 1 }
    },
  },
})
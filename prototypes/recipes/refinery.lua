local TFMG = require("util.TFMG")


data:extend({--6:4:1 Water, Hydrocarbon, Organic
  {--Hydrocarbon slush distillation
    type = "recipe",
    category = "refinery",
    subgroup = "fluid-recipes",
    name = "hydrocarbon-slush-distillation",
    icons = {
      { icon = "__space-age__/graphics/icons/fluid/lithium-brine.png"},
      { icon = "__base__/graphics/icons/signal/signal-fire.png", shift = {0,7}, scale = 0.3, tint = {1,0.2,0.2,0.5}}
    },
    energy_required = 3,
    enabled = false,
    allow_productivity = true,
    allow_decomposition = false,
    ingredients = {
      { type = "fluid", name = "hydrocarbon-slush", amount = 64, fluidbox_index = 0 },
    },
    results = { 
      { type = "fluid", name = "water", amount = 64 },
      { type = "fluid", name = "short-chain-hydrocarbons", amount = 32 },
      { type = "fluid", name = "organic-sludge", amount = 4 }
    },
    surface_conditions = TFMG.conditions.arrival,
  },
  {--water filtration
    type = "recipe",
    category = "refinery",
    subgroup = "fluid-recipes",
    name = "water-filtration",
    icons = {
      { icon = "__base__/graphics/icons/fluid/water.png"},
      { icon = "__base__/graphics/icons/arrows/signal-shuffle.png", shift = {0,7}, scale = 0.3,}
    },
    energy_required = 1,
    enabled = false,
    allow_productivity = false,
    allow_decomposition = false,
    ingredients = {
      { type = "fluid", name = "water", amount = 300 },
      { type = "fluid", name = "short-chain-hydrocarbons", amount = 200 },
    },
    results = { 
      { type = "fluid", name = "water", amount = 450 },
      { type = "fluid", name = "short-chain-hydrocarbons", amount = 80 },
      { type = "fluid", name = "organic-sludge", amount = 5 }
    },
    surface_conditions = TFMG.conditions.arrival,
  },
  {--sludge cultivation
    type = "recipe",
    category = "refinery",
    subgroup = "fluid-recipes",
    name = "organic-sludge-cultivation",
    icons = {
      { icon = "__base__/graphics/icons/fluid/lubricant.png"},
      { icon = "__base__/graphics/icons/arrows/signal-shuffle.png", shift = {0,7}, scale = 0.3,}
    },
    energy_required = 1,
    enabled = false,
    allow_productivity = false,
    allow_decomposition = false,
    ingredients = {
      { type = "fluid", name = "short-chain-hydrocarbons", amount = 200 },
      { type = "fluid", name = "organic-sludge", amount = 50 },  
    },
    results = { 
      { type = "fluid", name = "water", amount = 30 },
      { type = "fluid", name = "short-chain-hydrocarbons", amount = 80 },
      { type = "fluid", name = "organic-sludge", amount = 75 }
    },
    surface_conditions = TFMG.conditions.arrival,
  },
  {--ferric solution reduction
    type = "recipe",
    category = "refinery",
    subgroup = "fluid-recipes",
    name = "ferric-solution-reduction",
    icons = {
      { icon = "__TFMG-assets-0__/icons/fluids/ferric-solution.png"},
      { icon = "__Krastorio2Assets__/icons/items/enriched-copper.png", shift = {0,7}, scale = 0.3,}
    },
    energy_required = 3,
    enabled = false,
    allow_productivity = true,
    allow_decomposition = false,
    ingredients = {
      { type = "fluid", name = "ferric-solution", amount = 80, fluidbox_index = 0 },
    },
    results = { 
      { type = "item", name = "pure-iron-ore", amount = 2 },
      { type = "fluid", name = "short-chain-hydrocarbons", amount = 40, fluidbox_index = 0 },
    },
  },
  {--concrete
    type = "recipe",
    category = "refinery",
    subgroup = "fluid-recipes",
    name = "concrete",
    energy_required = 2,
    enabled = false,
    allow_productivity = true,
    ingredients = {
      { type = "item", name = "mineral-ore", amount = 4 },
      { type = "item", name = "general-purpose-structure", amount = 1 },
      { type = "fluid", name = "water", amount = 10 },
      { type = "fluid", name = "short-chain-hydrocarbons", amount = 10 },
    },
    results = { 
      { type = "item", name = "concrete", amount = 1 },
    },
  },
  {--Volatile chunk decomposition
    type = "recipe",
    category = "refinery",
    subgroup = "fluid-recipes",
    name = "volatile-chunk-decomposition",
    icons = {
      { icon = "__space-age__/graphics/icons/oxide-asteroid-chunk.png"},
      { icon = "__base__/graphics/icons/signal/signal-fire.png", shift = {0,7}, scale = 0.3, tint = {1,0.2,0.2,0.5}}
    },
    energy_required = 1,
    enabled = false,
    allow_productivity = true,
    allow_decomposition = false,
    ingredients = {
      { type = "item", name = "volatile-asteroid-chunk", amount = 1},
    },
    results = {
      { type = "fluid", name = "short-chain-hydrocarbons", amount_min = 0, amount_max = 24},
      { type = "fluid", name = "water", amount = 24 },
      --hydrogen, probably.
      { type = "item", name = "ferric-ore", amount = 1, probability = 0.08},
      { type = "item", name = "mineral-ore", amount = 1, probability = 0.08},
    },
  },
})
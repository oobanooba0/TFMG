data:extend({
  {--Hydrocarbon slush seperation
    type = "recipe",
    category = "refinery",
    name = "hydrocarbon-slush-distillation",
    icons = {
      { icon = "__space-age__/graphics/icons/fluid/lithium-brine.png"},
      { icon = "__base__/graphics/icons/signal/signal-fire.png", shift = {0,7}, scale = 0.3, tint = {1,0.2,0.2,0.5}}
    },
    energy_required = 1,
    enabled = true,
    ingredients = {
      { type = "fluid", name = "hydrocarbon-slush", amount = 100 },
    },
    results = { 
      { type = "fluid", name = "water", amount = 50 },
      { type = "fluid", name = "short-chain-hydrocarbons", amount = 30 },
      { type = "fluid", name = "organic-sludge", amount = 20 }
    },
  },
  {--water filtration
    type = "recipe",
    category = "refinery",
    name = "water-filtration",
    icons = {
      { icon = "__base__/graphics/icons/fluid/water.png"},
      { icon = "__base__/graphics/icons/arrows/signal-shuffle.png", shift = {0,7}, scale = 0.3,}
    },
    energy_required = 1,
    enabled = true,
    ingredients = {
      { type = "fluid", name = "water", amount = 10 },
      { type = "fluid", name = "short-chain-hydrocarbons", amount = 10 },
    },
    results = { 
      { type = "fluid", name = "water", amount = 15 },
      { type = "fluid", name = "short-chain-hydrocarbons", amount = 4 },
      { type = "fluid", name = "organic-sludge", amount = 1 }
    },
    allow_productivity = false,
  },
  {--hydrocarbon binding
    type = "recipe",
    category = "refinery",
    name = "hydrocarbon-binding",
    icons = {
      { icon = "__base__/graphics/icons/fluid/petroleum-gas.png"},
      { icon = "__base__/graphics/icons/arrows/signal-shuffle.png", shift = {0,7}, scale = 0.3,}
    },
    energy_required = 1,
    enabled = true,
    ingredients = {
      { type = "fluid", name = "short-chain-hydrocarbons", amount = 10 },
      { type = "fluid", name = "organic-sludge", amount = 10 },
    },
    results = { 
      { type = "fluid", name = "water", amount = 1 },
      { type = "fluid", name = "short-chain-hydrocarbons", amount = 15 },
      { type = "fluid", name = "organic-sludge", amount = 4 }
    },
    allow_productivity = false,
  },
  {--sludge decomposition
    type = "recipe",
    category = "refinery",
    name = "sludge-decomposition",
    icons = {
      { icon = "__base__/graphics/icons/fluid/lubricant.png"},
      { icon = "__base__/graphics/icons/arrows/signal-shuffle.png", shift = {0,7}, scale = 0.3,}
    },
    energy_required = 1,
    enabled = true,
    ingredients = {
      { type = "fluid", name = "organic-sludge", amount = 10 },
      { type = "fluid", name = "water", amount = 10 },
    },
    results = { 
      { type = "fluid", name = "water", amount = 4 },
      { type = "fluid", name = "short-chain-hydrocarbons", amount = 1 },
      { type = "fluid", name = "organic-sludge", amount = 15 }
    },
    allow_productivity = false,
  },
})
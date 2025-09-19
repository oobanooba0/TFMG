data:extend({--5:2:1 Water, Hydrocarbon, Organic
  {--Hydrocarbon slush seperation
    type = "recipe",
    category = "refinery",
    name = "hydrocarbon-slush-distillation",
    icons = {
      { icon = "__space-age__/graphics/icons/fluid/lithium-brine.png"},
      { icon = "__base__/graphics/icons/signal/signal-fire.png", shift = {0,7}, scale = 0.3, tint = {1,0.2,0.2,0.5}}
    },
    energy_required = 5,
    enabled = true,
    ingredients = {
      { type = "fluid", name = "hydrocarbon-slush", amount = 100 },
    },
    results = { 
      { type = "fluid", name = "water", amount = 125 },
      { type = "fluid", name = "short-chain-hydrocarbons", amount = 30 },
      { type = "fluid", name = "organic-sludge", amount = 10 }
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
      { type = "fluid", name = "water", amount = 250 },
      { type = "fluid", name = "short-chain-hydrocarbons", amount = 100 },
    },
    results = { 
      { type = "fluid", name = "water", amount = 375 },
      { type = "fluid", name = "short-chain-hydrocarbons", amount = 40 },
      { type = "fluid", name = "organic-sludge", amount = 5 }
    },
    allow_productivity = false,
  },
  {--sludge cultivation
    type = "recipe",
    category = "refinery",
    name = "organic-sludge-cultivation",
    icons = {
      { icon = "__base__/graphics/icons/fluid/lubricant.png"},
      { icon = "__base__/graphics/icons/arrows/signal-shuffle.png", shift = {0,7}, scale = 0.3,}
    },
    energy_required = 1,
    enabled = true,
    ingredients = {
      { type = "fluid", name = "short-chain-hydrocarbons", amount = 100 },
      { type = "fluid", name = "organic-sludge", amount = 50 },  
    },
    results = { 
      { type = "fluid", name = "water", amount = 25 },
      { type = "fluid", name = "short-chain-hydrocarbons", amount = 40 },
      { type = "fluid", name = "organic-sludge", amount = 75 }
    },
    allow_productivity = false,
  },
})
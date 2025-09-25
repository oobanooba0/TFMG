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
    energy_required = 4,
    enabled = false,
    ingredients = {
      { type = "fluid", name = "hydrocarbon-slush", amount = 50 },
    },
    results = { 
      { type = "fluid", name = "water", amount = 150 },
      { type = "fluid", name = "short-chain-hydrocarbons", amount = 60 },
      { type = "fluid", name = "organic-sludge", amount = 10 }
    },
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
    ingredients = {
      { type = "fluid", name = "water", amount = 300 },
      { type = "fluid", name = "short-chain-hydrocarbons", amount = 200 },
    },
    results = { 
      { type = "fluid", name = "water", amount = 450 },
      { type = "fluid", name = "short-chain-hydrocarbons", amount = 80 },
      { type = "fluid", name = "organic-sludge", amount = 5 }
    },
    allow_productivity = false,
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
    ingredients = {
      { type = "fluid", name = "short-chain-hydrocarbons", amount = 200 },
      { type = "fluid", name = "organic-sludge", amount = 50 },  
    },
    results = { 
      { type = "fluid", name = "water", amount = 30 },
      { type = "fluid", name = "short-chain-hydrocarbons", amount = 80 },
      { type = "fluid", name = "organic-sludge", amount = 75 }
    },
    allow_productivity = false,
  },
  {--ferric solution reduction
    type = "recipe",
    category = "refinery",
    subgroup = "fluid-recipes",
    name = "ferric-solution-reduction",
    icons = {
      { icon = "__base__/graphics/icons/fluid/sulfuric-acid.png"},
      { icon = "__Krastorio2Assets__/icons/items/enriched-copper.png", shift = {0,7}, scale = 0.3,}
    },
    energy_required = 1,
    enabled = false,
    ingredients = {
      { type = "fluid", name = "ferric-solution", amount = 160 },
    },
    results = { 
      { type = "item", name = "pure-iron-ore", amount = 2 },
      { type = "fluid", name = "water", amount = 20 },
    },
    allow_productivity = true,
  },
  {--refined concrete
    type = "recipe",
    category = "refinery",
    subgroup = "fluid-recipes",
    name = "refined-concrete",
    energy_required = 2,
    enabled = false,
    ingredients = {
      { type = "item", name = "mineral-ore", amount = 4 },
      { type = "item", name = "general-purpose-structure", amount = 1 },
      { type = "fluid", name = "water", amount = 10 },
      { type = "fluid", name = "short-chain-hydrocarbons", amount = 10 },
    },
    results = { 
      { type = "item", name = "refined-concrete", amount = 1 },
    },
    allow_productivity = true,
  },
})
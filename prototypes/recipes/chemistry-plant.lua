data:extend({
  {--Hydrocarbon seperation
    type = "recipe",
    category = "chemistry-plant",
    name = "hydrocarbon-seperation",
    icons = {
      { icon = "__base__/graphics/icons/fluid/water.png", shift = {10,0},scale = 0.7},
      { icon = "__base__/graphics/icons/fluid/lubricant.png", shift = {-10,0},scale = 0.7},
      { icon = "__base__/graphics/icons/arrows/signal-left-right-arrow.png", shift = {0,7}, scale = 0.3,}
    },
    energy_required = 1,
    enabled = true,
    ingredients = {
      { type = "fluid", name = "water", amount = 100 },
      { type = "fluid", name = "short-chain-hydrocarbons", amount = 100 },
      { type = "fluid", name = "organic-sludge", amount = 100 },
    },
    results = { 
      { type = "fluid", name = "water", amount = 120 },
      { type = "fluid", name = "short-chain-hydrocarbons", amount = 60 },
      { type = "fluid", name = "organic-sludge", amount = 120 }
    },
    allow_productivity = false,
  },
  {--Hydrocarbon concentration
    type = "recipe",
    category = "chemistry-plant",
    name = "hydrocarbon-concentration",
    icons = {
      { icon = "__base__/graphics/icons/fluid/petroleum-gas.png"},
      { icon = "__base__/graphics/icons/arrows/down-arrow.png", shift = {0,7}, scale = 0.3,}
    },
    energy_required = 1,
    enabled = true,
    ingredients = {
      { type = "fluid", name = "water", amount = 100 },
      { type = "fluid", name = "short-chain-hydrocarbons", amount = 100 },
      { type = "fluid", name = "organic-sludge", amount = 100 },
    },
    results = { 
      { type = "fluid", name = "water", amount = 80 },
      { type = "fluid", name = "short-chain-hydrocarbons", amount = 140 },
      { type = "fluid", name = "organic-sludge", amount = 80 }
    },
    allow_productivity = false,
  },
})
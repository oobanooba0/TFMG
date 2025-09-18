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
      { type = "fluid", name = "water", amount = 10 },
      { type = "fluid", name = "short-chain-hydrocarbons", amount = 10 },
      { type = "fluid", name = "organic-sludge", amount = 10 },
    },
    results = { 
      { type = "fluid", name = "water", amount = 12 },
      { type = "fluid", name = "short-chain-hydrocarbons", amount = 6 },
      { type = "fluid", name = "organic-sludge", amount = 12 }
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
      { type = "fluid", name = "water", amount = 10 },
      { type = "fluid", name = "short-chain-hydrocarbons", amount = 10 },
      { type = "fluid", name = "organic-sludge", amount = 10 },
    },
    results = { 
      { type = "fluid", name = "water", amount = 8 },
      { type = "fluid", name = "short-chain-hydrocarbons", amount = 14 },
      { type = "fluid", name = "organic-sludge", amount = 8 }
    },
    allow_productivity = false,
  },
})
data:extend({--6:4:1 Water, Hydrocarbon, Organic
  {--Hydrocarbon seperation
    type = "recipe",
    category = "chemistry-plant",
    subgroup = "fluid-recipes",
    name = "hydrocarbon-seperation",
    icons = {
      { icon = "__base__/graphics/icons/fluid/water.png", shift = {10,0},scale = 0.7},
      { icon = "__base__/graphics/icons/fluid/lubricant.png", shift = {-10,0},scale = 0.7},
      { icon = "__base__/graphics/icons/arrows/signal-left-right-arrow.png", shift = {0,7}, scale = 0.3,}
    },
    energy_required = 1,
    enabled = false,
    allow_productivity = false,
    ingredients = {
      { type = "fluid", name = "water", amount = 300 },
      { type = "fluid", name = "short-chain-hydrocarbons", amount = 200 },
      { type = "fluid", name = "organic-sludge", amount = 50 },
    },
    results = { 
      { type = "fluid", name = "water", amount = 360 },
      { type = "fluid", name = "short-chain-hydrocarbons", amount = 120 },
      { type = "fluid", name = "organic-sludge", amount = 60 }
    },
  },
  {--Hydrocarbon concentration
    type = "recipe",
    category = "chemistry-plant",
    subgroup = "fluid-recipes",
    name = "hydrocarbon-concentration",
    icons = {
      { icon = "__base__/graphics/icons/fluid/petroleum-gas.png"},
      { icon = "__base__/graphics/icons/arrows/down-arrow.png", shift = {0,7}, scale = 0.3,}
    },
    energy_required = 1,
    enabled = false,
    allow_productivity = false,
    ingredients = {
      { type = "fluid", name = "water", amount = 300 },
      { type = "fluid", name = "short-chain-hydrocarbons", amount = 200 },
      { type = "fluid", name = "organic-sludge", amount = 50 },
    },
    results = { 
      { type = "fluid", name = "water", amount = 240 },
      { type = "fluid", name = "short-chain-hydrocarbons", amount = 280 },
      { type = "fluid", name = "organic-sludge", amount = 40 }
    },
  },
  {--Ferric ore washing
    type = "recipe",
    category = "chemistry-plant",
    subgroup = "fluid-recipes",
    name = "ferric-ore-washing",
    icons = {
      { icon = "__base__/graphics/icons/copper-ore.png"},
      { icon = "__base__/graphics/icons/fluid/petroleum-gas.png", shift = {0,7}, scale = 0.3,}
    },
    energy_required = 2,
    enabled = false,
    allow_decomposition = false,
    allow_productivity = true,
    ingredients = {
      { type = "item", name = "ferric-ore", amount = 5 },--was originally 6
      { type = "fluid", name = "short-chain-hydrocarbons", amount = 16 },
    },
    results = { 
      { type = "item", name = "titanium-ore", amount = 1 },
      { type = "fluid", name = "ferric-solution", amount = 25 }--was originally 30.
    },
  },
  {--microbe-culture
    type = "recipe",
    category = "chemistry-plant",
    subgroup = "fluid-recipes",
    name = "microbe-extraction",
    energy_required = 2,
    enabled = false,
    allow_productivity = true,
    ingredients = {
      { type = "fluid", name = "organic-sludge", amount = 10 },
      { type = "item", name = "mineral-ore", amount = 1 },
    },
    results = { 
      { type = "item", name = "microbe-culture", amount = 1 }
    },
  },
  {--bio polymerisation
    type = "recipe",
    category = "chemistry-plant",
    subgroup = "fluid-recipes",
    name = "bio-polymerisation",
    energy_required = 2,
    enabled = false,
    allow_productivity = true,
    ingredients = {
      { type = "item", name = "microbe-culture", amount = 1 },
      { type = "fluid", name = "short-chain-hydrocarbons", amount = 10 },
    },
    results = { 
      { type = "item", name = "active-bio-polymers", amount = 1 }
    },
  },
  {--mineral lubricant
    type = "recipe",
    category = "chemistry-plant",
    subgroup = "fluid-recipes",
    name = "mineral-lubricant",
    energy_required = 2,
    enabled = false,
    allow_productivity = true,
    ingredients = {
      { type = "item", name = "organic-carbon", amount = 2 },
      { type = "fluid", name = "short-chain-hydrocarbons", amount = 5 },
      { type = "item", name = "mineral-ore", amount = 8},
    },
    results = { 
      { type = "fluid", name = "mineral-lubricant", amount = 20 }
    },
  },
  {--organic carbon liquefaction
    type = "recipe",
    category = "chemistry-plant",
    subgroup = "fluid-recipes",
    name = "organic-carbon-liquefaction",
    icons = {
      {icon = "__base__/graphics/icons/solid-fuel.png", tint = {0.5,1,0.5}},
      {icon = "__base__/graphics/icons/fluid/lubricant.png", shift = {-10,0},scale = 0.7},
    },
    energy_required = 2,
    enabled = false,
    allow_productivity = false,
    ingredients = {
      { type = "item", name = "organic-carbon", amount = 5 },
    },
    results = { 
      { type = "fluid", name = "short-chain-hydrocarbons", amount = 50 }
    },
  },
  {--capacitor
    type = "recipe",
    category = "chemistry-plant",
    subgroup = "fluid-recipes",
    name = "capacitor-discharged",
    energy_required = 1,
    enabled = false,
    allow_productivity = true,
    ingredients = {
      { type = "item", name = "conductive-coil", amount = 4 },
      { type = "item", name = "crystalline-plate", amount = 1 },
      { type = "item", name = "polymer-bar", amount = 2 },
      { type = "fluid", name = "ferric-solution", amount = 5 },
    },
    results = { 
      { type = "item", name = "capacitor-discharged", amount = 2 }
    },
  },
  {--Excited crystal quenching
    type = "recipe",
    category = "chemistry-plant",
    subgroup = "fluid-recipes",
    name = "excited-crystal-quenching",
    icon = "__TFMG-assets-0__/icons/items/fused-crystalline-chunk.png",
    energy_required = 4,
    enabled = false,
    allow_productivity = false,
    ingredients = {
      { type = "item", name = "excited-crystalline-chunk-red", amount = 1 },
      { type = "item", name = "excited-crystalline-chunk-blue", amount = 1 },
      { type = "fluid", name = "water", amount = 100 },
    },
    results = { 
      { type = "item", name = "fused-crystalline-chunk", amount = 1 },
      { type = "fluid", name = "steam", amount = 1000, temperature = 1000},
    },
  },
  {--Thruster oxidizer
    type = "recipe",
    category = "chemistry-plant",
    subgroup = "fluid-recipes",
    name = "thruster-oxidizer",
    icon = "__space-age__/graphics/icons/fluid/thruster-oxidizer.png",
    energy_required = 4,
    enabled = false,
    allow_productivity = true,
    ingredients = {
      { type = "item", name = "capacitor-charged", amount = 1 },
      { type = "fluid", name = "water", amount = 128 },
    },
    results = { 
      { type = "item", name = "capacitor-discharged", amount = 1 },
      { type = "fluid", name = "thruster-oxidizer", amount = 128 },
      { type = "fluid", name = "thruster-fuel", amount = 16 },
    },
  },
  {--Thruster fuel
    type = "recipe",
    category = "chemistry-plant",
    subgroup = "fluid-recipes",
    name = "thruster-fuel",
    icon = "__space-age__/graphics/icons/fluid/thruster-fuel.png",
    energy_required = 4,
    enabled = false,
    allow_productivity = true,
    ingredients = {
      { type = "fluid", name = "short-chain-hydrocarbons", amount = 64 },
      { type = "fluid", name = "ferric-solution", amount = 16 },
    },
    results = { 
      { type = "fluid", name = "thruster-fuel", amount = 128 },
      { type = "fluid", name = "thruster-oxidizer", amount = 16 },
    },
  },
})
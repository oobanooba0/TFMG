local TFMG = require("util.TFMG")

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
    crafting_machine_tint = {
      primary = {150,150,10},
      secondary = {150,150,10},
      tertiary = {150,150,10},
      quaternary = {150,150,10},
    },
    energy_required = 1,
    enabled = false,
    allow_decomposition = false,
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
    surface_conditions = TFMG.conditions.arrival,
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
    crafting_machine_tint = {
      primary = {150,150,10},
      secondary = {150,150,10},
      tertiary = {150,150,10},
      quaternary = {150,150,10},
    },
    energy_required = 1,
    enabled = false,
    allow_productivity = false,
    allow_decomposition = false,
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
    surface_conditions = TFMG.conditions.arrival,
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
    crafting_machine_tint = {
      primary = {220,40,00},
      secondary = {220,40,00},
      tertiary = {220,40,00},
      quaternary = {220,40,00},
    },
    energy_required = 2,
    enabled = false,
    allow_productivity = true,
    allow_decomposition = false,
    ingredients = {
      { type = "item", name = "ferric-ore", amount = 5 },--was originally 6
      { type = "fluid", name = "short-chain-hydrocarbons", amount = 16, fluidbox_index = 0 },
    },
    results = { 
      { type = "item", name = "titanium-ore", amount = 1 },
      { type = "fluid", name = "ferric-solution", amount = 24, fluidbox_index = 0 }--was originally 30.
    },
  },
  {--microbe-culture
    type = "recipe",
    category = "chemistry-plant",
    name = "microbe-culture",
    crafting_machine_tint = {
      primary = {170,240,150},
      secondary = {170,240,150},
      tertiary = {170,240,150},
      quaternary = {170,240,150},
    },
    energy_required = 2,
    enabled = false,
    allow_productivity = true,
    ingredients = {
      { type = "fluid", name = "organic-sludge", amount = 10, fluidbox_index = 0 },
      { type = "item", name = "mineral-ore", amount = 1 },
    },
    results = { 
      { type = "item", name = "microbe-culture", amount = 1 }
    },
    main_product = "microbe-culture",
    localised_name = {"recipe-name.microbe-culture"},
    surface_conditions = TFMG.conditions.arrival,
  },

  {--microbe cultivation
    type = "recipe",
    category = "chemistry-plant",
    name = "microbe-cultivation",
    crafting_machine_tint = {
      primary = {170,240,150},
      secondary = {170,240,150},
      tertiary = {170,240,150},
      quaternary = {170,240,150},
    },
    energy_required = 4,
    enabled = false,
    allow_productivity = true,
    ingredients = {
      { type = "item", name = "microbe-culture", amount = 2 },
      { type = "fluid", name = "short-chain-hydrocarbons", amount = 100, fluidbox_index = 0 },
    },
    results = { 
      { type = "item", name = "microbe-culture", amount = 5 }
    },
    reset_freshness_on_craft = true,
    main_product = "microbe-culture",
  },

  {--microbe restoration
    type = "recipe",
    category = "chemistry-plant",
    name = "microbe-restoration",
    crafting_machine_tint = {
      primary = {170,240,150},
      secondary = {170,240,150},
      tertiary = {170,240,150},
      quaternary = {170,240,150},
    },
    energy_required = 4,
    enabled = false,
    allow_productivity = false,
    ingredients = {
      { type = "item", name = "microbe-culture", amount = 1 },
      { type = "item", name = "organic-carbon", amount = 1 },
      { type = "fluid", name = "water", amount = 20, fluidbox_index = 0 },
    },
    results = { 
      { type = "item", name = "microbe-culture", amount = 1, extra_count_fraction = 0.5 }
    },
    reset_freshness_on_craft = true,
    main_product = "microbe-culture",
  },


  {--bio polymerisation
    type = "recipe",
    category = "chemistry-plant",
    name = "active-bio-polymers",
    crafting_machine_tint = {
      primary = {160,240,160},
      secondary = {160,240,160},
      tertiary = {160,240,160},
      quaternary = {160,240,160},
    },
    energy_required = 2,
    enabled = false,
    allow_productivity = true,
    ingredients = {
      { type = "item", name = "microbe-culture", amount = 1 },
      { type = "fluid", name = "short-chain-hydrocarbons", amount = 10, fluidbox_index = 0 },
    },
    results = { 
      { type = "item", name = "active-bio-polymers", amount = 1 }
    },
    main_product = "active-bio-polymers",
    localised_name = {"recipe-name.active-bio-polymers"},
  },
  {--mineral lubricant
    type = "recipe",
    category = "chemistry-plant",
    subgroup = "fluid-recipes",
    name = "mineral-lubricant",
    crafting_machine_tint = {
      primary = {80,240,80},
      secondary = {80,240,80},
      tertiary = {80,240,80},
      quaternary = {80,240,80},
    },
    energy_required = 2,
    enabled = false,
    allow_productivity = true,
    ingredients = {
      { type = "item", name = "organic-carbon", amount = 2 },
      { type = "fluid", name = "short-chain-hydrocarbons", amount = 5, fluidbox_index = 0 },
      { type = "item", name = "mineral-ore", amount = 8},
    },
    results = { 
      { type = "fluid", name = "mineral-lubricant", amount = 20, fluidbox_index = 0 }
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
    crafting_machine_tint = {
      primary = {100,100,10},
      secondary = {100,100,10},
      tertiary = {100,100,10},
      quaternary = {100,100,10},
    },
    energy_required = 2,
    enabled = false,
    allow_decomposition = false,
    allow_productivity = false,
    ingredients = {
      { type = "item", name = "organic-carbon", amount = 5 },
    },
    results = { 
      { type = "fluid", name = "short-chain-hydrocarbons", amount = 50, fluidbox_index = 0 }
    },
  },
  {--capacitor
    type = "recipe",
    category = "chemistry-plant",
    subgroup = "fluid-recipes",
    name = "capacitor-discharged",
    crafting_machine_tint = {
      primary = {250,10,10},
      secondary = {250,10,10},
      tertiary = {250,10,10},
      quaternary = {250,10,10},
    },
    energy_required = 1,
    enabled = false,
    allow_productivity = true,
    ingredients = {
      { type = "item", name = "conductive-coil", amount = 4 },
      { type = "item", name = "crystalline-plate", amount = 1 },
      { type = "item", name = "polymer-bar", amount = 2 },
      { type = "fluid", name = "ferric-solution", amount = 5, fluidbox_index = 0 },
    },
    results = { 
      { type = "item", name = "capacitor-discharged", amount = 2 }
    },
  },
  {--Excited crystal quenching
    type = "recipe",
    category = "chemistry-plant",
    name = "fused-crystalline-chunk",
    icon = "__TFMG-assets-0__/icons/items/fused-crystalline-chunk.png",
    crafting_machine_tint = {
      primary = {200,0,100},
      secondary = {100,0,200},
      tertiary = {200,0,200},
      quaternary = {200,0,200},
    },
    energy_required = 4,
    enabled = false,
    allow_productivity = false,
    ingredients = {
      { type = "item", name = "excited-crystalline-chunk-red", amount = 1 },
      { type = "item", name = "excited-crystalline-chunk-blue", amount = 1 },
      { type = "fluid", name = "water", amount = 100, fluidbox_index = 0 },
    },
    results = { 
      { type = "item", name = "fused-crystalline-chunk", amount = 2 },
      { type = "fluid", name = "steam", amount = 1000, temperature = 1000, fluidbox_index = 0},
    },
    main_product = "fused-crystalline-chunk",
    localised_name = {"recipe-name.fused-crystalline-chunk"},
    surface_conditions = TFMG.conditions.space,
  },
  {--Steam condensation
    type = "recipe",
    category = "chemistry-plant",
    subgroup = "fluid-recipes",
    name = "water",
    crafting_machine_tint = {
      primary = {100,100,140},
      secondary = {100,100,140},
      tertiary = {100,100,140},
      quaternary = {100,100,140},
    },
    energy_required = 1,
    enabled = false,
    allow_decomposition = false,
    allow_productivity = false,
    ingredients = {
      { type = "fluid", name = "steam", amount = 200, fluidbox_index = 0},
    },
    results = { 
      { type = "fluid", name = "water", amount = 19, fluidbox_index = 0},
    },
    main_product = "water",
    localised_name = {"recipe-name.water"},
  },
  {--Thruster oxidizer
    type = "recipe",
    category = "chemistry-plant",
    subgroup = "fluid-recipes",
    name = "thruster-oxidizer",
    icon = "__space-age__/graphics/icons/fluid/thruster-oxidizer.png",
    crafting_machine_tint = {
      primary = {50,50,250},
      secondary = {50,50,250},
      tertiary = {50,50,250},
      quaternary = {50,50,250},
    },
    energy_required = 4,
    enabled = false,
    allow_productivity = true,
    ingredients = {
      { type = "item", name = "capacitor-charged", amount = 1 },
      { type = "fluid", name = "water", amount = 128, fluidbox_index = 0 },
    },
    results = { 
      { type = "item", name = "capacitor-discharged", amount = 1 },
      { type = "fluid", name = "thruster-oxidizer", amount = 128 },
      { type = "fluid", name = "thruster-fuel", amount = 16 },
    },
    main_product = "thruster-oxidizer",
  },
  {--Thruster fuel
    type = "recipe",
    category = "chemistry-plant",
    subgroup = "fluid-recipes",
    name = "thruster-fuel",
    icon = "__space-age__/graphics/icons/fluid/thruster-fuel.png",
    crafting_machine_tint = {
      primary = {250,100,10},
      secondary = {250,100,10},
      tertiary = {250,100,10},
      quaternary = {250,100,10},
    },
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
    main_product = "thruster-fuel",
  },
})
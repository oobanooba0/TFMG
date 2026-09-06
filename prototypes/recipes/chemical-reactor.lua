--chemical reactor recipes. Remember that maintaining correct fuel values of inputs/vs outputs is important here.

data:extend({
  {--short-chain-hydrocarbon-combustion
    type = "recipe",
    categories = {"chemical-reactor"},
    name = "react-short-chain-hydrocarbons",
    subgroup = "fluid-recipes",
    icons = {
      {icon = "__base__/graphics/icons/fluid/petroleum-gas.png", shift = {-10,-10},scale = 0.6},
      {icon = "__Krastorio2Assets__/icons/fluids/oxygen.png", shift = {10,-10},scale = 0.6},
      {icon = "__base__/graphics/icons/signal/signal-fire.png", shift = {0,10},scale = 0.6},
    },
    energy_required = 1,
    enabled = false,
    allow_productivity = false,
    ingredients = {
      { type = "fluid", name = "short-chain-hydrocarbons", amount = 20},
      { type = "fluid", name = "oxygen", amount = 20},
    },
    results = { 
      { type = "fluid", name = "hot-gas", amount = 1, temperature = 1000, fluidbox_index = 1}
    },
  },
  {--short chain hydrocarbons
    type = "recipe",
    categories = {"chemical-reactor"},
    name = "react-short-chain-hydrocarbons-in-air",
    subgroup = "fluid-recipes",
    icons = {
      {icon = "__base__/graphics/icons/fluid/petroleum-gas.png", shift = {0,-10},scale = 0.6},
      {icon = "__base__/graphics/icons/signal/signal-fire.png", shift = {0,10},scale = 0.6},
    },
    energy_required = 1,
    surface_conditions = TFMG.conditions.arrival,
    enabled = false,
    allow_productivity = false,
    ingredients = {
      { type = "fluid", name = "short-chain-hydrocarbons", amount = 20, fluidbox_index = 1},
    },
    results = { 
      { type = "fluid", name = "hot-gas", amount = 1, temperature = 1000, fluidbox_index = 1}
    },
  },
  {--hydrogen-oxygen-combustion
    type = "recipe",
    categories = {"chemical-reactor"},
    name = "react-hydrogen-oxygen",
    subgroup = "fluid-recipes",
    icons = {
      {icon = "__Krastorio2Assets__/icons/fluids/hydrogen.png", shift = {-10,-10},scale = 0.6},
      {icon = "__Krastorio2Assets__/icons/fluids/oxygen.png", shift = {10,-10},scale = 0.6},
      {icon = "__base__/graphics/icons/signal/signal-fire.png", shift = {-10,10},scale = 0.6},
      {icon = "__base__/graphics/icons/fluid/water.png", shift = {10,10},scale = 0.6},
    },
    energy_required = 1,
    enabled = false,
    allow_productivity = false,
    ingredients = {
      { type = "fluid", name = "hydrogen", amount = 80},--has a value of 6MJ alltogether so the output must be less than that.
      { type = "fluid", name = "oxygen", amount = 40},
    },
    results = { 
      { type = "fluid", name = "hot-gas", amount = 1, temperature = 2000, fluidbox_index = 1},
      { type = "fluid", name = "water", amount = 40, temperature = 95, fluidbox_index = 2},
    },
    main_product = "water",
  },
})
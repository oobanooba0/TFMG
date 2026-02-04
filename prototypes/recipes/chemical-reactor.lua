local TFMG = require("util.TFMG")

--chemical reactor recipes. Remember that maintaining correct fuel values of inputs/vs outputs is important here.

data:extend({
  {--short-chain-hydrocarbon-combustion
    type = "recipe",
    category = "chemical-reactor",
    name = "react-short-chain-hydrocarbons",
    subgroup = "fluid-recipes",
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
  {--hydrogen-oxygen-combustion
    type = "recipe",
    category = "chemical-reactor",
    name = "react-hydrogen-oxygen",
    subgroup = "fluid-recipes",
    --icon = "__base__/graphics/icons/signal/signal-fire.png",
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
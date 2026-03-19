local TFMG = require("util.TFMG")

--centrifuge recipes

data:extend({
  {
    type = "recipe",
    name = "centrifuge-slurry",
    icon = "__TFMG-assets-0__/icons/fluids/ferric-solution.png",
    category = "centrifuge",
    subgroup = "raw-materials",
    auto_recycle = false,
    energy_required = 4,
    enabled = false,
    allow_decomposition = false,
    allow_productivity = true,
    hide_from_signal_gui = false,
    ingredients = {
      {type = "item", name = "regolith", amount = 2},
      {type = "fluid", name = "industrial-acid", amount = 10},
    },
    results = {
      {type="item", name = "crushed-regolith", amount = 5 },
      {type="fluid", name = "rich-slurry", amount = 15 },
    },
  },
})
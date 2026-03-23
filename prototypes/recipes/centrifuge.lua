local TFMG = require("util.TFMG")

--centrifuge recipes

data:extend({
  {
    type = "recipe",
    name = "centrifuge-slurry",
    icon = "__TFMG-assets-0__/icons/fluids/rich-slurry.png",
    category = "centrifuge",
    subgroup = "raw-materials",
    auto_recycle = false,
    energy_required = 4,
    enabled = false,
    allow_decomposition = false,
    allow_productivity = true,
    hide_from_signal_gui = false,
    ingredients = {
      {type = "fluid", name = "rich-slurry", amount = 16},
    },
    results = {
      {type = "item", name = "thorium", amount = 1},
      {type = "fluid", name = "water", amount = 6},
    },
  },
})
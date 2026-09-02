--centrifuge recipes

data:extend({
  {
    type = "recipe",
    name = "centrifuge-slurry",
    icon = "__TFMG-assets-0__/icons/fluids/rich-slurry.png",
    categories = {"centrifuge"},
    subgroup = "raw-materials",
    auto_recycle = false,
    energy_required = 4,
    enabled = false,
    allow_decomposition = true,
    allow_productivity = true,
    hide_from_signal_gui = false,
    ingredients = {
      {type = "fluid", name = "rich-slurry", amount = 16},
    },
    results = {
      {type = "fluid", name = "thorium-salts", amount = 10},
      {type = "item", name = "organic-carbon", amount = 1},
    },
  },
})
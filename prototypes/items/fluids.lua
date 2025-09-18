data:extend({
    {
    type = "fluid",
    name = "hydrocarbon-slush",
    icon = "__space-age__/graphics/icons/fluid/lithium-brine.png",
    subgroup = "fluid",
    order = "a[raw-fluid]-a[arrival]",
    default_temperature = 0,
    max_temperature = 100,
    heat_capacity = "2kJ",
    base_color = {0.8, 0.85, .8},
    flow_color = {0.6, 0.65, 0.6},
    auto_barrel = false
  },
  {
    type = "fluid",
    name = "short-chain-hydrocarbons",
    icon = "__base__/graphics/icons/fluid/petroleum-gas.png",
    subgroup = "fluid",
    order = "b[intermediate-fluid]-a[arrival]",
    default_temperature = 0,
    base_color = {0.3, 0.1, 0.3},
    flow_color = {0.8, 0.8, 0.8},
    auto_barrel = false
  },
  {
    type = "fluid",
    name = "organic-sludge",
    icon = "__base__/graphics/icons/fluid/lubricant.png",
    subgroup = "fluid",
    order = "b[intermediate-fluid]-b[arrival]",
    default_temperature = 0,
    base_color = {0.15, 0.32, 0.03},
    flow_color = {0.43, 0.75, 0.31},
    auto_barrel = false
  },
})
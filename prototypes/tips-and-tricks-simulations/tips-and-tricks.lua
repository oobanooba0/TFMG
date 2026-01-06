local simulations = require("prototypes.tips-and-tricks-simulations.sim-scripts")


data:extend({
  {
    type = "tips-and-tricks-item-category",
    name = "thermal",
    order = "a[mechanic]"
  },
  {
    type = "tips-and-tricks-item",
    name = "thermal-system-basics",
    category = "thermal",
    order = "a",
    trigger =
    {
      type = "set-recipe",
    },
    simulation = simulations.thermal_system_basics
  },
  {
    type = "tips-and-tricks-item",
    name = "thermal-system-damage",
    category = "thermal",
    order = "b",
    trigger =
    {
      type = "research",
      technology = "smelting"
    },
    simulation = simulations.thermal_system_damage
  },
})
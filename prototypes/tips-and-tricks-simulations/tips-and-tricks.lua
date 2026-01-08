local simulations = require("prototypes.tips-and-tricks-simulations.sim-scripts")


data:extend({
--thermal simulations
  {
    type = "tips-and-tricks-item-category",
    name = "thermal",
    order = "a[mechanic]-a[thermal]"
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

--Supercomputer simulations
  {
    type = "tips-and-tricks-item-category",
    name = "supercomputer",
    order = "a[mechanic]-b[supercomputer]"
  },
  {
    type = "tips-and-tricks-item",
    name = "supercomputer-basics",
    category = "supercomputer",
    order = "a",
    trigger =
    {
      type = "set-recipe",
      recipe = "introspection-science"
    },
    simulation = simulations.supercomputer_basics
  },
  {
    type = "tips-and-tricks-item",
    name = "supercomputer-par-time",
    category = "supercomputer",
    order = "a-b",
    trigger =
    {
      type = "time-since-last-tip-activation",
      ticks = 500
    },
    dependencies = {"supercomputer-introspection"},
    simulation = simulations.supercomputer_basics
  },
  {
    type = "tips-and-tricks-item",
    name = "supercomputer-introspection",
    category = "supercomputer",
    order = "b-a",
    trigger =
    {
      type = "time-since-last-tip-activation",
      ticks = 500
    },
    dependencies = {"supercomputer-basics"},
    simulation = simulations.supercomputer_basics
  },
})
data:extend({
  {--general purpose structure simple recipe
    type = "recipe",
    category = "matter-reconstructor",
    name = "general-purpose-structure-reconstruction",
    energy_required = 10,
    enabled = true,
    ingredients = {
      { type = "item", name = "ferric-asteroid-chunk", amount = 1 },
    },
    results = { 
        { type = "item", name = "general-purpose-structure", amount = 10 }
    },
  },
  {--mechanical components simple recipe
    type = "recipe",
    category = "matter-reconstructor",
    name = "mechanical-components-reconstruction",
    energy_required = 10,
    enabled = true,
    ingredients = {
      { type = "item", name = "ferric-asteroid-chunk", amount = 1 },
    },
    results = { 
        { type = "item", name = "mechanical-components", amount = 5 }
    },
  },
  {--modular circuit simple recipe
    type = "recipe",
    category = "matter-reconstructor",
    name = "modular-circuit-reconstruction",
    energy_required = 10,
    enabled = true,
    ingredients = {
      { type = "item", name = "ferric-asteroid-chunk", amount = 1 },
      { type = "item", name = "crystalline-asteroid-chunk", amount = 1 },
    },
    results = { 
        { type = "item", name = "modular-circuit", amount = 10 }
    },
  },

  {
    type = "recipe",
    category = "matter-reconstructor",
    name = "print-ai-processor",
    energy_required = 50,
    enabled = true,
    ingredients = {
      { type = "item", name = "modular-circuit", amount = 5},
      { type = "item", name = "ferric-plate", amount = 1},
    },
    results = { 
        { type = "item", name = "ai-processor", amount = 1 }
    },
  },
})

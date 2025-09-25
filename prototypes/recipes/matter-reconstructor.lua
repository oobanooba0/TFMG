data:extend({
  {--general purpose structure simple recipe
    type = "recipe",
    category = "matter-reconstructor",
    name = "general-purpose-structure-reconstruction",
    energy_required = 10,
    enabled = false,
    ingredients = {
      { type = "item", name = "ferric-asteroid-chunk", amount = 10 },
    },
    results = { 
        { type = "item", name = "general-purpose-structure", amount = 32 }
    },
    allow_decomposition = false,
  },
  {--mechanical components simple recipe
    type = "recipe",
    category = "matter-reconstructor",
    name = "mechanical-components-reconstruction",
    energy_required = 10,
    enabled = false,
    ingredients = {
      { type = "item", name = "ferric-asteroid-chunk", amount = 10 },
    },
    results = { 
        { type = "item", name = "mechanical-components", amount = 16 }
    },
    allow_decomposition = false,
  },
  {--conductive coil simple recipe
    type = "recipe",
    category = "matter-reconstructor",
    name = "conductive-coil-reconstruction",
    energy_required = 10,
    enabled = false,
    ingredients = {
      { type = "item", name = "crystalline-asteroid-chunk", amount = 10 },
    },
    results = { 
        { type = "item", name = "conductive-coil", amount = 40 }
    },
    allow_decomposition = false,
  },
  {--modular circuit simple recipe
    type = "recipe",
    category = "matter-reconstructor",
    name = "modular-circuit-reconstruction",
    energy_required = 10,
    enabled = false,
    ingredients = {
      { type = "item", name = "ferric-asteroid-chunk", amount = 10 },
      { type = "item", name = "crystalline-asteroid-chunk", amount = 10 },
    },
    results = { 
        { type = "item", name = "modular-circuit", amount = 16 }
    },
    allow_decomposition = false,
  },
  {--Ai Processor printing
    type = "recipe",
    category = "matter-reconstructor",
    name = "print-ai-processor",
    energy_required = 64,
    enabled = false,
    ingredients = {
      { type = "item", name = "modular-circuit", amount = 2},
      { type = "item", name = "conductive-coil", amount = 5},
      { type = "item", name = "crystalline-plate", amount = 5},
      { type = "item", name = "crystalline-asteroid-chunk", amount = 10},
    },
    results = { 
        { type = "item", name = "ai-processor", amount = 1 }
    },
    allow_decomposition = false,
  },
})

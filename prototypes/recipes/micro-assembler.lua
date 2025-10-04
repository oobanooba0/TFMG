data:extend({
  {--Mineral Glass tempering
    type = "recipe",
    category = "micro-assembler",
    name = "mineral-glass-singing",
    energy_required = 1.5,
    enabled = false,
    allow_productivity = false,
    ingredients = {
      { type = "item", name = "hot-mineral-plate", amount = 1 },
    },
    results = { 
      { type = "item", name = "mineral-glass", amount = 1 }
    },
    allow_decomposition = false,
  },
  {--conductive coil 
    type = "recipe",
    category = "micro-assembler",
    name = "conductive-coil-anti-winding",
    energy_required = 1.5,
    enabled = false,
    allow_productivity = true,
    ingredients = {
      { type = "item", name = "ferric-plate", amount = 1 },
    },
    results = { 
      { type = "item", name = "conductive-coil", amount = 4 }
    },
  },
})
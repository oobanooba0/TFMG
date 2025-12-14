data:extend({
  {--Mineral Glass singing
    type = "recipe",
    category = "micro-assembler",
    name = "mineral-glass-singing",
    energy_required = 1,
    enabled = false,
    allow_productivity = false,
    ingredients = {
      { type = "item", name = "hot-mineral-plate", amount = 1 },
    },
    results = { 
      { type = "item", name = "mineral-glass", amount = 1 }
    },
    allow_decomposition = false,
    factoriopedia_alternative = "mineral-glass",
  },
  {--conductive coil 
    type = "recipe",
    category = "micro-assembler",
    name = "conductive-coil-anti-winding",
    energy_required = 1,
    enabled = false,
    allow_productivity = true,
    ingredients = {
      { type = "item", name = "ferric-plate", amount = 1 },
    },
    results = { 
      { type = "item", name = "conductive-coil", amount = 4 }
    },
    factoriopedia_alternative = "conductive-coil",
  },
  {--barrel
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
    factoriopedia_alternative = "conductive-coil",
  },


})
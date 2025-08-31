---these recipes DO NOT appear in the matter reconstructor, ONLY the assembling machine
  
data:extend({
  {--General purpose structure
    type = "recipe",
    category = "assembling-machine",
    name = "general-purpose-structure",
    energy_required = 1,
    enabled = true,
    ingredients = {
      { type = "item", name = "ferric-plate", amount = 2 },
    },
    results = { 
      { type = "item", name = "general-purpose-structure", amount = 1 }
    },
  },
  {--mechanical components
    type = "recipe",
    category = "assembling-machine",
    name = "mechanical-components",
    energy_required = 2,
    enabled = true,
    ingredients = {
      { type = "item", name = "ferric-plate", amount = 2 },
      { type = "item", name = "general-purpose-structure", amount = 1 },
    },
    results = { 
      { type = "item", name = "mechanical-components", amount = 2 }
    },
  },
  {--conductive-coil
    type = "recipe",
    category = "assembling-machine",
    name = "conductive-coil",
    energy_required = 1,
    enabled = true,
    ingredients = {
      { type = "item", name = "crystalline-plate", amount = 1 },
    },
    results = { 
        { type = "item", name = "conductive-coil", amount = 4 }
    },
  },
  {--modular circuit
    type = "recipe",
    category = "assembling-machine",
    name = "modular-circuit",
    energy_required = 2,
    enabled = true,
    ingredients = {
      { type = "item", name = "crystalline-plate", amount = 1 },
      { type = "item", name = "ferric-plate", amount = 1 },
      { type = "item", name = "conductive-coil", amount = 4 },--puts the coil assembler to circuit assembler ratio at 1:2
    },
    results = { 
      { type = "item", name = "modular-circuit", amount = 1 }
    },
  },
})
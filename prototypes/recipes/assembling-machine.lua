---these recipes DO NOT appear in the matter reconstructor, ONLY the assembling machine
  
data:extend({
  {--General purpose structure
    type = "recipe",
    category = "assembling-machine",
    name = "general-purpose-structure",
    energy_required = 1,
    enabled = false,
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
    enabled = false,
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
    enabled = false,
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
    enabled = false,
    ingredients = {
      { type = "item", name = "crystalline-plate", amount = 1 },
      { type = "item", name = "ferric-plate", amount = 1 },
      { type = "item", name = "conductive-coil", amount = 4 },--puts the coil assembler to circuit assembler ratio at 1:2
    },
    results = { 
      { type = "item", name = "modular-circuit", amount = 1 }
    },
  },

  {--spidertron frame
    type = "recipe",
    category = "assembling-machine",
    name = "spidertron-frame",
    energy_required = 16,
    enabled = false,
    ingredients = {
      { type = "item", name = "general-purpose-structure", amount = 16 },
      { type = "item", name = "heat-pipe", amount = 4 },
    },
    results = { 
      { type = "item", name = "spidertron-frame", amount = 1 }
    },
  },
  {--mechanical leg
    type = "recipe",
    category = "assembling-machine",
    name = "mechanical-leg",
    energy_required = 12,
    enabled = false,
    ingredients = {
      { type = "item", name = "general-purpose-structure", amount = 4 },
      { type = "item", name = "mechanical-components", amount = 8 },
      { type = "item", name = "modular-circuit", amount = 4 },
    },
    results = { 
      { type = "item", name = "mechanical-leg", amount = 1 }
    },
  },
  {--manipulation tool
    type = "recipe",
    category = "assembling-machine",
    name = "manipulation-tool",
    energy_required = 8,
    enabled = false,
    ingredients = {
      { type = "item", name = "mechanical-components", amount = 2 },
      { type = "item", name = "modular-circuit", amount = 2 },
      { type = "item", name = "conductive-coil", amount = 8 },
      { type = "item", name = "heat-pipe", amount = 2 },
    },
    results = { 
      { type = "item", name = "manipulation-tool", amount = 1 }
    },
  },
  {--Scout'o'tron
    type = "recipe",
    category = "assembling-machine",
    name = "scout-o-tron",
    energy_required = 32,
    enabled = false,
    ingredients = {
      { type = "item", name = "spidertron-frame", amount = 1 },
      { type = "item", name = "mechanical-leg", amount = 3 },
      { type = "item", name = "manipulation-tool", amount = 2 },
      { type = "item", name = "ai-processor", amount = 1 },
    },
    results = { 
      { type = "item", name = "scout-o-tron", amount = 1 }
    },
  },


})
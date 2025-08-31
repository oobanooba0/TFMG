  --basic assembling recipes are those that should be craftable in both the assembling machine, and in the matter reconstructor.
  
  data:extend({
  {--transport belt 1
    type = "recipe",
    category = "basic-assembling",
    name = "transport-belt-1",
    energy_required = 2,
    enabled = false,
    ingredients = {
      { type = "item", name = "general-purpose-structure", amount = 1 },
      { type = "item", name = "mechanical-components", amount = 1 },
    },
    results = { 
        { type = "item", name = "transport-belt-1", amount = 1 }
    },
  },
  {--underground belt 1
    type = "recipe",
    category = "basic-assembling",
    name = "underground-belt-1",
    energy_required = 4,
    enabled = false,
    ingredients = {
      { type = "item", name = "general-purpose-structure", amount = 2 },
      { type = "item", name = "transport-belt-1", amount = 5 },
    },
    results = { 
        { type = "item", name = "underground-belt-1", amount = 2 }
    },
  },
  {--splitter-1
    type = "recipe",
    category = "basic-assembling",
    name = "splitter-1",
    energy_required = 4,
    enabled = false,
    ingredients = {
      { type = "item", name = "general-purpose-structure", amount = 2 },
      { type = "item", name = "modular-circuit", amount = 2 },
      { type = "item", name = "transport-belt-1", amount = 2 },
    },
    results = { 
        { type = "item", name = "splitter-1", amount = 1 }
    },
  },
  {--inserter-1
    type = "recipe",
    category = "basic-assembling",
    name = "inserter-1",
    energy_required = 4,
    enabled = false,
    ingredients = {
      { type = "item", name = "general-purpose-structure", amount = 2 },
      { type = "item", name = "modular-circuit", amount = 1 },
      { type = "item", name = "mechanical-components", amount = 2 },
    },
    results = { 
        { type = "item", name = "inserter-1", amount = 1 }
    },
  },
  {--assembling machine
    type = "recipe",
    category = "basic-assembling",
    name = "assembling-machine",
    energy_required = 16,
    enabled = false,
    ingredients = {
      { type = "item", name = "general-purpose-structure", amount = 5 },
      { type = "item", name = "mechanical-components", amount = 10 },
      { type = "item", name = "modular-circuit", amount = 2 },
    },
    results = { 
        { type = "item", name = "assembling-machine", amount = 1 }
    },
  },
  {--furnace
    type = "recipe",
    category = "basic-assembling",
    name = "furnace",
    energy_required = 8,
    enabled = false,
    ingredients = {
      { type = "item", name = "general-purpose-structure", amount = 10 },
      { type = "item", name = "conductive-coil", amount = 10 },
      { type = "item", name = "modular-circuit", amount = 2 },
    },
    results = { 
        { type = "item", name = "furnace", amount = 1 }
    },
  },
  {--asteroid collector
    type = "recipe",
    category = "basic-assembling",
    name = "asteroid-collector",
    energy_required = 16,
    enabled = false,
    ingredients = {
      { type = "item", name = "general-purpose-structure", amount = 5 },
      { type = "item", name = "mechanical-components", amount = 10 },
      { type = "item", name = "modular-circuit", amount = 5 },

    },
    results = { 
        { type = "item", name = "asteroid-collector", amount = 1 }
    },
  },
  {--heavy space platform
    type = "recipe",
    category = "basic-assembling",
    name = "heavy-space-platform",
    energy_required = 6,
    enabled = true,
    ingredients = {
      { type = "item", name = "general-purpose-structure", amount = 8 },
    },
    results = { 
        { type = "item", name = "space-platform-foundation", amount = 1 }
    },
  },
  {--heat pipe
    type = "recipe",
    category = "basic-assembling",
    name = "heat-pipe",
    energy_required = 4,
    enabled = false,
    ingredients = {
      { type = "item", name = "general-purpose-structure", amount = 1 },
      { type = "item", name = "conductive-coil", amount = 8 },
    },
    results = { 
        { type = "item", name = "heat-pipe", amount = 1 }
    },
  },
  {--small radiator
    type = "recipe",
    category = "basic-assembling",
    name = "small-radiator",
    energy_required = 12,
    enabled = false,
    ingredients = {
      { type = "item", name = "general-purpose-structure", amount = 8 },
      { type = "item", name = "heat-pipe", amount = 4 },
    },
    results = { 
        { type = "item", name = "small-radiator", amount = 1 }
    },
  },
})
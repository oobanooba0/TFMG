---these recipes DO NOT appear in the matter reconstructor, ONLY the assembling machine
  
data:extend({
  {--General purpose structure
    type = "recipe",
    category = "assembling-machine",
    name = "mineral-glass-cooling",
    energy_required = 1,
    enabled = false,
    ingredients = {
      { type = "item", name = "hot-mineral-plate", amount = 1 },
    },
    results = { 
      { type = "item", name = "mineral-glass", amount = 1 }
    },
  },
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
      { type = "item", name = "ferric-plate", amount = 1 },
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
      { type = "item", name = "mineral-glass", amount = 1 },
      { type = "item", name = "ferric-plate", amount = 1 },
      { type = "item", name = "conductive-coil", amount = 4 },--puts the coil assembler to circuit assembler ratio at 1:2
    },
    results = { 
      { type = "item", name = "modular-circuit", amount = 1 }
    },
  },
  --Science packs
  {--introspection science
    type = "recipe",
    category = "assembling-machine",
    name = "introspection-science-unverified",
    energy_required = 5,
    enabled = false,
    ingredients = {
      { type = "item", name = "modular-circuit", amount = 1 },
      { type = "item", name = "mechanical-components", amount = 1 },
      { type = "item", name = "crystalline-plate", amount = 1 },
    },
    results = { 
      { type = "item", name = "introspection-science-unverified", amount = 1 }
    },
  },

  {--spidertron frame
    type = "recipe",
    category = "assembling-machine",
    name = "spidertron-frame",
    energy_required = 16,
    enabled = false,
    ingredients = {
      { type = "item", name = "general-purpose-structure", amount = 32 },
      { type = "item", name = "heat-pipe", amount = 16 },
      { type = "item", name = "modular-circuit", amount = 16 },
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
      { type = "item", name = "general-purpose-structure", amount = 8 },
      { type = "item", name = "mechanical-components", amount = 8 },
      { type = "item", name = "conductive-coil", amount = 12 },
    },
    results = { 
      { type = "item", name = "mechanical-leg", amount = 1 }
    },
  },

  ---spider hell
  {--Scout'o'tron
    type = "recipe",
    category = "assembling-machine",
    name = "scout-o-tron",
    energy_required = 32,
    enabled = false,
    ingredients = {
      { type = "item", name = "spidertron-frame", amount = 1 },
      { type = "item", name = "mechanical-leg", amount = 3 },
      { type = "item", name = "ai-processor", amount = 1 },
    },
    results = { 
      { type = "item", name = "scout-o-tron", amount = 1 }
    },
  },

  {--Scout'o'tron pod
    type = "recipe",
    category = "assembling-machine",
    name = "scout-o-tron-pod",
    energy_required = 32,
    enabled = false,
    ingredients = {
      { type = "item", name = "scout-o-tron", amount = 1 },
      { type = "item", name = "solar-cell", amount = 2 },
      { type = "item", name = "roboport-1", amount = 1 },
      { type = "item", name = "construction-robot", amount = 8 },
      { type = "item", name = "general-purpose-structure", amount = 24 },
    },
    results = { 
      { type = "item", name = "scout-o-tron-pod", amount = 1 }
    },
  },
---robots
  {--construction robot
    type = "recipe",
    category = "assembling-machine",
    name = "construction-robot",
    energy_required = 8,
    enabled = false,
    ingredients = {
      { type = "item", name = "mechanical-components", amount = 2 },
      { type = "item", name = "general-purpose-structure", amount = 2 },
      { type = "item", name = "modular-circuit", amount = 2 },
      { type = "item", name = "conductive-coil", amount = 6 },
    },
    results = { 
      { type = "item", name = "construction-robot", amount = 1 }
    },
  },
  {--logistic robot
    type = "recipe",
    category = "assembling-machine",
    name = "logistic-robot",
    energy_required = 8,
    enabled = false,
    ingredients = {
      { type = "item", name = "mechanical-components", amount = 2 },
      { type = "item", name = "general-purpose-structure", amount = 2 },
      { type = "item", name = "modular-circuit", amount = 2 },
      { type = "item", name = "conductive-coil", amount = 6 },
    },
    results = { 
      { type = "item", name = "logistic-robot", amount = 1 }
    },
  },
  {--roboport 1
    type = "recipe",
    category = "assembling-machine",
    name = "roboport-1",
    energy_required = 12,
    enabled = false,
    ingredients = {
      { type = "item", name = "general-purpose-structure", amount = 8 },
      { type = "item", name = "modular-circuit", amount = 8 },
      { type = "item", name = "conductive-coil", amount = 8 },
    },
    results = { 
      { type = "item", name = "roboport-1", amount = 1 }
    },
  },
---building recipes
  {--supercomputer
    type = "recipe",
    category = "assembling-machine",
    name = "supercomputer",
    energy_required = 20,
    enabled = false,
    ingredients = {
      { type = "item", name = "general-purpose-structure", amount = 16 },
      { type = "item", name = "conductive-coil", amount = 24 },
      { type = "item", name = "heat-pipe", amount = 8 },
      { type = "item", name = "ai-processor", amount = 1 },
    },
    results = { 
        { type = "item", name = "supercomputer", amount = 1 }
    },
  },
  {--neural-node
    type = "recipe",
    category = "assembling-machine",
    name = "neural-node",
    energy_required = 20,
    enabled = false,
    ingredients = {
      { type = "item", name = "general-purpose-structure", amount = 16 },
      { type = "item", name = "modular-circuit", amount = 16 },
      { type = "item", name = "mineral-glass", amount = 4 },
      { type = "item", name = "ai-processor", amount = 1 },
    },
    results = { 
        { type = "item", name = "neural-node", amount = 1 }
    },
  },
  {--lamp
    type = "recipe",
    category = "assembling-machine",
    name = "small-lamp",
    energy_required = 4,
    enabled = false,
    ingredients = {
      { type = "item", name = "general-purpose-structure", amount = 2 },
      { type = "item", name = "modular-circuit", amount = 2 },
      { type = "item", name = "mineral-glass", amount = 2 },
    },
    results = { 
        { type = "item", name = "small-lamp", amount = 1 }
    },
  },
  {--tiny electric pole
    type = "recipe",
    category = "assembling-machine",
    name = "tiny-electric-pole",
    energy_required = 4,
    enabled = false,
    ingredients = {
      { type = "item", name = "general-purpose-structure", amount = 2 },
      { type = "item", name = "conductive-coil", amount = 8 },
      { type = "item", name = "mineral-glass", amount = 2 },
    },
    results = { 
        { type = "item", name = "tiny-electric-pole", amount = 1 }
    },
  },
  {--Constant combinator
    type = "recipe",
    category = "assembling-machine",
    name = "constant-combinator",
    energy_required = 4,
    enabled = false,
    ingredients = {
      { type = "item", name = "general-purpose-structure", amount = 2 },
      { type = "item", name = "modular-circuit", amount = 2 },
    },
    results = { 
        { type = "item", name = "constant-combinator", amount = 1 }
    },
  },
  {--arithmetic combinator
    type = "recipe",
    category = "assembling-machine",
    name = "arithmetic-combinator",
    energy_required = 4,
    enabled = false,
    ingredients = {
      { type = "item", name = "general-purpose-structure", amount = 2 },
      { type = "item", name = "modular-circuit", amount = 2 },
    },
    results = { 
        { type = "item", name = "arithmetic-combinator", amount = 1 }
    },
  },
  {--decider combinator
    type = "recipe",
    category = "assembling-machine",
    name = "decider-combinator",
    energy_required = 4,
    enabled = false,
    ingredients = {
      { type = "item", name = "general-purpose-structure", amount = 2 },
      { type = "item", name = "modular-circuit", amount = 2 },
    },
    results = { 
        { type = "item", name = "decider-combinator", amount = 1 }
    },
  },
  {--selector combinator
    type = "recipe",
    category = "assembling-machine",
    name = "selector-combinator",
    energy_required = 4,
    enabled = false,
    ingredients = {
      { type = "item", name = "general-purpose-structure", amount = 2 },
      { type = "item", name = "modular-circuit", amount = 2 },
    },
    results = { 
        { type = "item", name = "selector-combinator", amount = 1 }
    },
  },
  {--power switch
    type = "recipe",
    category = "assembling-machine",
    name = "power-switch",
    energy_required = 4,
    enabled = false,
    ingredients = {
      { type = "item", name = "general-purpose-structure", amount = 2 },
      { type = "item", name = "modular-circuit", amount = 2 },
      { type = "item", name = "mineral-glass", amount = 2 },
    },
    results = { 
        { type = "item", name = "power-switch", amount = 1 }
    },
  },
  {--display-panel
    type = "recipe",
    category = "assembling-machine",
    name = "display-panel",
    energy_required = 4,
    enabled = false,
    ingredients = {
      { type = "item", name = "general-purpose-structure", amount = 2 },
      { type = "item", name = "modular-circuit", amount = 2 },
      { type = "item", name = "mineral-glass", amount = 2 },
    },
    results = { 
        { type = "item", name = "display-panel", amount = 1 }
    },
  },
  {--programmable speaker
    type = "recipe",
    category = "assembling-machine",
    name = "programmable-speaker",
    energy_required = 4,
    enabled = false,
    ingredients = {
      { type = "item", name = "general-purpose-structure", amount = 2 },
      { type = "item", name = "modular-circuit", amount = 2 },
    },
    results = { 
        { type = "item", name = "programmable-speaker", amount = 1 }
    },
  },
  {--solar cell
    type = "recipe",
    category = "assembling-machine",
    name = "solar-cell",
    energy_required = 8,
    enabled = false,
    ingredients = {
      { type = "item", name = "general-purpose-structure", amount = 4 },
      { type = "item", name = "mineral-glass", amount = 2 },
      { type = "item", name = "crystalline-plate", amount = 2 },
    },
    results = { 
        { type = "item", name = "solar-cell", amount = 1 }
    },
  },

  {--container-1
    type = "recipe",
    category = "assembling-machine",
    name = "container-1",
    energy_required = 4,
    enabled = false,
    ingredients = {
      { type = "item", name = "general-purpose-structure", amount = 12 },
    },
    results = { 
        { type = "item", name = "container-1", amount = 1 }
    },
  },
    {--long-inserter-1
    type = "recipe",
    category = "assembling-machine",
    name = "long-inserter-1",
    energy_required = 4,
    enabled = false,
    ingredients = {
      { type = "item", name = "general-purpose-structure", amount = 2 },
      { type = "item", name = "inserter-1", amount = 1 },
    },
    results = { 
        { type = "item", name = "long-inserter-1", amount = 1 }
    },
  },

})
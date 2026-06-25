local TFMG = require("util.TFMG")


---assembling machine recipes.
---assembling-machine-pure for recipes that should only appear in the assembling machine, and not the matter reconstructor.

--adjust docking port recipes.
local docking_port = data.raw.recipe["TFMG-docking-port"]
  docking_port.ingredients = {
    { type = "item", name = "high-performance-structure", amount = 8 },
    { type = "item", name = "ai-processor", amount = 2 },
  }
  docking_port.categories = {"assembling-machine","matter-reconstructor"}

local docking_belt = data.raw.recipe["TFMG-docking-belt"]
  docking_belt.ingredients = {
    { type = "item", name = "high-performance-structure", amount = 8 },
    { type = "item", name = "mechatronic-components", amount = 12 },
  }
  docking_belt.categories = {"assembling-machine","matter-reconstructor"}

local docking_pipe = data.raw.recipe["TFMG-docking-pipe"]
  docking_pipe.ingredients = {
    { type = "item", name = "high-performance-structure", amount = 8 },
    { type = "item", name = "mineral-glass", amount = 8 },
    { type = "item", name = "mechatronic-components", amount = 12 },
  }
  docking_pipe.categories = {"assembling-machine","matter-reconstructor"}

data:extend({
  {--Mineral Glass (in space)
    type = "recipe",
    categories = {"assembling-machine"},
    name = "mineral-glass-cooling",
    energy_required = 1,
    enabled = false,
    allow_decomposition = false,
    allow_productivity = false,
    ingredients = {
      { type = "item", name = "hot-mineral-plate", amount = 1 },
    },
    results = { 
      { type = "item", name = "mineral-glass", amount = 1 }
    },
    factoriopedia_alternative = "mineral-glass",
    surface_conditions = TFMG.conditions.space,
  },
  {--General purpose structure
    type = "recipe",
    categories = {"assembling-machine"},
    name = "general-purpose-structure",
    energy_required = 1,
    enabled = false,
    allow_productivity = true,
    ingredients = {
      { type = "item", name = "ferric-plate", amount = 2 },
    },
    results = { 
      { type = "item", name = "general-purpose-structure", amount = 1 }
    },
  },
  {--High performance structure
    type = "recipe",
    categories = {"assembling-machine","matter-reconstructor"},
    name = "high-performance-structure",
    energy_required = 2,
    enabled = false,
    allow_productivity = true,
    ingredients = {
      { type = "item", name = "general-purpose-structure", amount = 1 },
      { type = "item", name = "titanium-plate", amount = 2 },
      { type = "item", name = "polymer-bar", amount = 2 },
    },
    results = { 
      { type = "item", name = "high-performance-structure", amount = 2 }
    },
  },
  {--mechanical components
    type = "recipe",
    categories = {"assembling-machine"},
    name = "mechanical-components",
    energy_required = 2,
    enabled = false,
    allow_productivity = true,
    ingredients = {
      { type = "item", name = "ferric-plate", amount = 2 },
      { type = "item", name = "general-purpose-structure", amount = 1 },
    },
    results = { 
      { type = "item", name = "mechanical-components", amount = 2 }
    },
  },
  {--mechatronic-components
    type = "recipe",
    categories = {"assembling-machine","matter-reconstructor"},
    name = "mechatronic-components",
    energy_required = 4,
    enabled = false,
    allow_productivity = true,
    ingredients = {
      { type = "item", name = "high-performance-structure", amount = 1 },
      { type = "item", name = "mechanical-components", amount = 2 },
      { type = "item", name = "modular-circuit", amount = 2 },
      { type = "fluid", name = "mineral-lubricant", amount = 40 },
    },
    results = { 
      { type = "item", name = "mechatronic-components", amount = 2 }
    },
  },
  {--conductive-coil
    type = "recipe",
    categories = {"assembling-machine"},
    name = "conductive-coil",
    energy_required = 1,
    enabled = false,
    allow_productivity = true,
    ingredients = {
      { type = "item", name = "ferric-plate", amount = 1 },
    },
    results = { 
      { type = "item", name = "conductive-coil", amount = 4 }
    },
  },
  {--optical coil
    type = "recipe",
    categories = {"assembling-machine","matter-reconstructor"},
    name = "optical-coil",
    energy_required = 2,
    enabled = false,
    allow_productivity = true,
    ingredients = {
      { type = "item", name = "mineral-glass", amount = 4 },
      { type = "item", name = "polymer-bar", amount = 1 },
      { type = "fluid", name = "industrial-acid", amount = 16, fluidbox_index = 0 },
    },
    results = { 
      { type = "item", name = "optical-coil", amount = 6 }
    },
  },
  {--modular circuit
    type = "recipe",
    categories = {"assembling-machine"},
    name = "modular-circuit",
    energy_required = 2,
    enabled = false,
    allow_productivity = true,
    ingredients = {
      { type = "item", name = "mineral-glass", amount = 1 },
      { type = "item", name = "ferric-plate", amount = 1 },
      { type = "item", name = "conductive-coil", amount = 4 },--puts the coil assembler to circuit assembler ratio at 1:2
    },
    results = { 
      { type = "item", name = "modular-circuit", amount = 1 }
    },
  },
  {--AI processor
    type = "recipe",
    categories = {"assembling-machine"},
    name = "ai-processor",
    energy_required = 8,
    enabled = false,
    allow_productivity = true,
    ingredients = {
      { type = "item", name = "modular-circuit", amount = 2 },
      { type = "item", name = "fused-crystalline-chunk", amount = 1 },
      { type = "item", name = "capacitor-discharged", amount = 2 },
      { type = "item", name = "optical-coil", amount = 12 },
    },
    results = { 
      { type = "item", name = "ai-processor", amount = 1 }
    },
  },
--Science packs
  {--introspection science
    type = "recipe",
    categories = {"assembling-machine","matter-reconstructor"},
    name = "introspection-science-unverified",
    energy_required = 5,
    enabled = false,
    allow_productivity = true,
    ingredients = {
      { type = "item", name = "modular-circuit", amount = 1 },
      { type = "item", name = "mechanical-components", amount = 1 },
      { type = "item", name = "crystalline-plate", amount = 1 },

    },
    results = { 
      { type = "item", name = "introspection-science-unverified", amount = 1 }
    },
    surface_conditions = TFMG.conditions.space,
  },
  {--exploration science
    type = "recipe",
    categories = {"assembling-machine","matter-reconstructor"},
    name = "exploration-science-unverified",
    energy_required = 10,
    enabled = false,
    allow_productivity = true,
    ingredients = {
      { type = "item", name = "high-performance-structure", amount = 2 },
      { type = "item", name = "optical-coil", amount = 12 },
      { type = "fluid", name = "organic-sludge", amount = 200 },
    },
    results = { 
      { type = "item", name = "exploration-science-unverified", amount = 1 }
    },
    surface_conditions = TFMG.conditions.arrival,
  },
  {--exploitation science
    type = "recipe",
    categories = {"assembling-machine","matter-reconstructor"},
    name = "exploitation-science-unverified",
    energy_required = 16,
    enabled = false,
    allow_productivity = true,
    ingredients = {
      { type = "item", name = "volatile-asteroid-chunk", amount = 4 },
      { type = "item", name = "active-bio-polymers", amount = 2 },
      { type = "item", name = "fused-crystalline-chunk", amount = 1 },
      { type = "item", name = "organic-carbon", amount = 2 },
    },
    results = { 
      { type = "item", name = "exploitation-science-unverified", amount = 1 }
    },
    surface_conditions = TFMG.conditions.space,
  },
  {--spidertron frame
    type = "recipe",
    categories = {"assembling-machine","matter-reconstructor"},
    name = "spidertron-frame",
    energy_required = 16,
    enabled = false,
    allow_productivity = false,
    ingredients = {
      { type = "item", name = "general-purpose-structure", amount = 32 },
      { type = "item", name = "heat-pipe", amount = 16 },
      { type = "item", name = "modular-circuit", amount = 16 },
      { type = "item", name = "mechanical-components", amount = 16 },
    },
    results = { 
      { type = "item", name = "spidertron-frame", amount = 1 }
    },
  },
  {--mechanical leg
    type = "recipe",
    categories = {"assembling-machine","matter-reconstructor"},
    name = "mechanical-leg",
    energy_required = 12,
    enabled = false,
    allow_productivity = false,
    ingredients = {
      { type = "item", name = "general-purpose-structure", amount = 8 },
      { type = "item", name = "mechanical-components", amount = 8 },
      { type = "item", name = "conductive-coil", amount = 12 },
    },
    results = { 
      { type = "item", name = "mechanical-leg", amount = 1 }
    },
  },
  {--toolbelt equipment
    type = "recipe",
    categories = {"assembling-machine","matter-reconstructor"},
    name = "toolbelt-equipment",
    energy_required = 12,
    enabled = false,
    allow_productivity = false,
    ingredients = {
      { type = "item", name = "general-purpose-structure", amount = 4 },
      { type = "item", name = "mechanical-components", amount = 8 },
      { type = "item", name = "steel-chest", amount = 4 },
    },
    results = { 
      { type = "item", name = "toolbelt-equipment", amount = 1 }
    },
  },
---spider hell
  {--Scout'o'tron
    type = "recipe",
    categories = {"assembling-machine","matter-reconstructor"},
    name = "scout-o-tron",
    energy_required = 32,
    enabled = false,
    allow_productivity = false,
    ingredients = {
      { type = "item", name = "spidertron-frame", amount = 1 },
      { type = "item", name = "mechanical-leg", amount = 3 },
      { type = "item", name = "ai-processor", amount = 1 },
    },
    results = { 
      { type = "item", name = "scout-o-tron", amount = 1 }
    },
  },
  {--Constructron
    type = "recipe",
    categories = {"assembling-machine","matter-reconstructor"},
    name = "constructron",
    energy_required = 64,
    enabled = false,
    allow_productivity = false,
    ingredients = {
      { type = "item", name = "spidertron-frame", amount = 1 },
      { type = "item", name = "mechanical-leg", amount = 8 },
      { type = "item", name = "mechatronic-components", amount = 32 },
      { type = "item", name = "chest-2", amount = 2 },
      { type = "item", name = "ai-processor", amount = 8 },
    },
    results = { 
      { type = "item", name = "constructron", amount = 1 }
    },
  },
---robots
  {--construction robot
    type = "recipe",
    categories = {"assembling-machine","matter-reconstructor"},
    name = "construction-robot",
    energy_required = 8,
    enabled = false,
    allow_productivity = false,
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
    categories = {"assembling-machine","matter-reconstructor"},
    name = "logistic-robot",
    energy_required = 8,
    enabled = false,
    allow_productivity = false,
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
    categories = {"assembling-machine","matter-reconstructor"},
    name = "roboport",
    energy_required = 12,
    enabled = false,
    allow_productivity = false,
    ingredients = {
      { type = "item", name = "general-purpose-structure", amount = 8 },
      { type = "item", name = "modular-circuit", amount = 8 },
      { type = "item", name = "conductive-coil", amount = 8 },
    },
    results = { 
      { type = "item", name = "roboport", amount = 1 }
    },
  },
---modules
  {--efficiency module
    type = "recipe",
    categories = {"assembling-machine","matter-reconstructor"},
    subgroup = "module",
    name = "efficiency-module",
    icon = "__base__/graphics/icons/efficiency-module-3.png",
    energy_required = 16,
    enabled = false,
    allow_productivity = false,
    ingredients = {
      { type = "item", name = "ai-processor", amount = 1 },
      { type = "item", name = "capacitor-charged", amount = 8 },
      { type = "fluid", name = "mineral-lubricant", amount = 40 },
    },
    results = { 
      { type = "item", name = "efficiency-module", amount = 1 },
      { type = "item", name = "capacitor-discharged", amount = 8 },
    },
    main_product = "efficiency-module",
  },
  {--speed module
    type = "recipe",
    categories = {"assembling-machine","matter-reconstructor"},
    subgroup = "module",
    name = "speed-module",
    icon = "__base__/graphics/icons/speed-module-3.png",
    energy_required = 16,
    enabled = false,
    allow_productivity = false,
    ingredients = {
      { type = "item", name = "ai-processor", amount = 1 },
      { type = "item", name = "capacitor-charged", amount = 8 },
      { type = "item", name = "mechatronic-components", amount = 2 },
      { type = "item", name = "heat-pipe", amount = 2 },
    },
    results = { 
      { type = "item", name = "speed-module", amount = 1 },
      { type = "item", name = "capacitor-discharged", amount = 8 },
    },
    main_product = "speed-module",
  },
---building recipes
  {--transport belt
    type = "recipe",
    categories = {"assembling-machine","matter-reconstructor"},
    name = "transport-belt",
    energy_required = 2,
    enabled = false,
    ingredients = {
      { type = "item", name = "general-purpose-structure", amount = 1 },
      { type = "item", name = "mechanical-components", amount = 1 },
    },
    results = { 
      { type = "item", name = "transport-belt", amount = 1 }
    },
  },
  {--fast transport belt
    type = "recipe",
    categories = {"assembling-machine","matter-reconstructor"},
    name = "fast-transport-belt",
    energy_required = 4,
    enabled = false,
    ingredients = {
      { type = "item", name = "transport-belt", amount = 1 },
      { type = "item", name = "high-performance-structure", amount = 1 },
      { type = "item", name = "mechatronic-components", amount = 2 },
      { type = "fluid", name = "mineral-lubricant", amount = 16 },
    },
    results = { 
      { type = "item", name = "fast-transport-belt", amount = 1 }
    },
  },
  {--underground belt
    type = "recipe",
    categories = {"assembling-machine","matter-reconstructor"},
    name = "underground-belt",
    energy_required = 4,
    enabled = false,
    ingredients = {
      { type = "item", name = "general-purpose-structure", amount = 2 },
      { type = "item", name = "transport-belt", amount = 4 },
    },
    results = { 
      { type = "item", name = "underground-belt", amount = 2 }
    },
  },
  {--fast underground belt
    type = "recipe",
    categories = {"assembling-machine","matter-reconstructor"},
    name = "fast-underground-belt",
    energy_required = 8,
    enabled = false,
    ingredients = {
      { type = "item", name = "underground-belt", amount = 2 },
      { type = "item", name = "fast-transport-belt", amount = 6 },
      { type = "item", name = "high-performance-structure", amount = 4 },
      { type = "fluid", name = "mineral-lubricant", amount = 16 },
    },
    results = { 
      { type = "item", name = "fast-underground-belt", amount = 2 }
    },
  },
  {--splitter
    type = "recipe",
    categories = {"assembling-machine","matter-reconstructor"},
    name = "splitter",
    energy_required = 4,
    enabled = false,
    ingredients = {
      { type = "item", name = "general-purpose-structure", amount = 2 },
      { type = "item", name = "modular-circuit", amount = 2 },
      { type = "item", name = "transport-belt", amount = 2 },
    },
    results = { 
      { type = "item", name = "splitter", amount = 1 }
    },
  },
  {--splitter-2
    type = "recipe",
    categories = {"assembling-machine","matter-reconstructor"},
    name = "fast-splitter",
    energy_required = 8,
    enabled = false,
    ingredients = {
      { type = "item", name = "splitter", amount = 1 },
      { type = "item", name = "high-performance-structure", amount = 2 },
      { type = "item", name = "mechatronic-components", amount = 4 },
      { type = "item", name = "optical-coil", amount = 12 },
      { type = "fluid", name = "mineral-lubricant", amount = 16 },
    },
    results = { 
      { type = "item", name = "fast-splitter", amount = 1 }
    },
  },
  {--inserter-1
    type = "recipe",
    categories = {"assembling-machine","matter-reconstructor"},
    name = "inserter",
    energy_required = 4,
    enabled = false,
    ingredients = {
      { type = "item", name = "general-purpose-structure", amount = 2 },
      { type = "item", name = "modular-circuit", amount = 1 },
      { type = "item", name = "mechanical-components", amount = 2 },
    },
    results = { 
      { type = "item", name = "inserter", amount = 1 }
    },
  },
  {--pipe
    type = "recipe",
    categories = {"assembling-machine","matter-reconstructor"},
    name = "pipe",
    energy_required = 1,
    enabled = false,
    ingredients = {
      { type = "item", name = "general-purpose-structure", amount = 1 },
      { type = "item", name = "mineral-glass", amount = 1 },
    },
    results = { 
      { type = "item", name = "pipe", amount = 1 }
    },
  },
  {--pipe-to-ground
    type = "recipe",
    categories = {"assembling-machine","matter-reconstructor"},
    name = "pipe-to-ground",
    energy_required = 4,
    enabled = false,
    ingredients = {
      { type = "item", name = "general-purpose-structure", amount = 5 },
      { type = "item", name = "pipe", amount = 10 }
    },
    results = { 
      { type = "item", name = "pipe-to-ground", amount = 2 }
    },
  },
  {--pipe-2
    type = "recipe",
    categories = {"assembling-machine","matter-reconstructor"},
    name = "pipe-2",
    energy_required = 2,
    enabled = false,
    ingredients = {
      { type = "item", name = "high-performance-structure", amount = 1 },
      { type = "item", name = "pipe", amount = 2 },
    },
    results = { 
      { type = "item", name = "pipe-2", amount = 2 }
    },
  },
  {--pipe-to-ground-2
    type = "recipe",
    categories = {"assembling-machine","matter-reconstructor"},
    name = "pipe-to-ground-2",
    energy_required = 4,
    enabled = false,
    ingredients = {
      { type = "item", name = "high-performance-structure", amount = 2 },
      { type = "item", name = "pipe-to-ground", amount = 2 }
    },
    results = { 
      { type = "item", name = "pipe-to-ground-2", amount = 2 }
    },
  },
  {--pump
    type = "recipe",
    categories = {"assembling-machine","matter-reconstructor"},
    name = "pump",
    energy_required = 6,
    enabled = false,
    ingredients = {
      { type = "item", name = "general-purpose-structure", amount = 2 },
      { type = "item", name = "mechanical-components", amount = 2 },
      { type = "item", name = "pipe", amount = 2 },
    },
    results = { 
      { type = "item", name = "pump", amount = 1 }
    },
  },
  {--storage tank
    type = "recipe",
    categories = {"assembling-machine","matter-reconstructor"},
    name = "storage-tank",
    energy_required = 6,
    enabled = false,
    ingredients = {
      { type = "item", name = "general-purpose-structure", amount = 12 },
      { type = "item", name = "mineral-glass", amount = 12 },
      { type = "item", name = "pipe", amount = 4 },
    },
    results = { 
        { type = "item", name = "storage-tank", amount = 1 }
    },
  },
  {--pumpjack
    type = "recipe",
    categories = {"assembling-machine","matter-reconstructor"},
    name = "pumpjack",
    energy_required = 6,
    enabled = false,
    ingredients = {
      { type = "item", name = "general-purpose-structure", amount = 8 },
      { type = "item", name = "mechanical-components", amount = 8 },
      { type = "item", name = "pipe", amount = 8 },
      
    },
    results = { 
      { type = "item", name = "pumpjack", amount = 1 }
    },
  },
  {--electric-mining-drill
    type = "recipe",
    categories = {"assembling-machine","matter-reconstructor"},
    name = "electric-mining-drill",
    energy_required = 8,
    enabled = false,
    ingredients = {
      { type = "item", name = "general-purpose-structure", amount = 8 },
      { type = "item", name = "mechanical-components", amount = 8 },
      { type = "item", name = "modular-circuit", amount = 4 },
    },
    results = { 
      { type = "item", name = "electric-mining-drill", amount = 1 }
    },
  },
  {--assembling machine
    type = "recipe",
    categories = {"assembling-machine","matter-reconstructor"},
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
    categories = {"assembling-machine","matter-reconstructor"},
    name = "furnace",
    energy_required = 8,
    enabled = false,
    ingredients = {
      { type = "item", name = "general-purpose-structure", amount = 8 },
      { type = "item", name = "conductive-coil", amount = 12 },
      { type = "item", name = "modular-circuit", amount = 2 },
    },
    results = { 
      { type = "item", name = "furnace", amount = 1 }
    },
  },
  {--chemistry plant
    type = "recipe",
    categories = {"assembling-machine","matter-reconstructor"},
    name = "chemistry-plant",
    energy_required = 12,
    enabled = false,
    ingredients = {
      { type = "item", name = "general-purpose-structure", amount = 8 },
      { type = "item", name = "mechanical-components", amount = 4 },
      { type = "item", name = "storage-tank", amount = 1 },
    },
    results = { 
      { type = "item", name = "chemistry-plant", amount = 1 }
    },
  },
  {--refinery
    type = "recipe",
    categories = {"assembling-machine","matter-reconstructor"},
    name = "oil-refinery",
    energy_required = 16,
    enabled = false,
    ingredients = {
      { type = "item", name = "general-purpose-structure", amount = 16 },
      { type = "item", name = "pipe", amount = 12 },
      { type = "item", name = "modular-circuit", amount = 8 },
    },
    results = { 
      { type = "item", name = "oil-refinery", amount = 1 }
    },
  },
  {--asteroid collector
    type = "recipe",
    categories = {"assembling-machine","matter-reconstructor"},
    name = "asteroid-collector",
    energy_required = 16,
    enabled = false,
    ingredients = {
      { type = "item", name = "general-purpose-structure", amount = 4 },
      { type = "item", name = "mechanical-components", amount = 12 },
      { type = "item", name = "modular-circuit", amount = 6 },

    },
    results = { 
      { type = "item", name = "asteroid-collector", amount = 1 }
    },
  },
  {--vision radar
    type = "recipe",
    categories = {"assembling-machine","matter-reconstructor"},
    name = "radar",
    energy_required = 16,
    enabled = false,
    ingredients = {
      { type = "item", name = "general-purpose-structure", amount = 12 },
      { type = "item", name = "modular-circuit", amount = 16 },
      { type = "item", name = "crystalline-plate", amount = 8 },

    },
    results = { 
      { type = "item", name = "radar", amount = 1 }
    },
  },
  {--scout radar
    type = "recipe",
    categories = {"assembling-machine","matter-reconstructor"},
    name = "scout-radar",
    energy_required = 16,
    enabled = false,
    ingredients = {
      { type = "item", name = "radar", amount = 2 },
      { type = "item", name = "optical-coil", amount = 32 },
      { type = "item", name = "crystalline-plate", amount = 16 },
    },
    results = { 
      { type = "item", name = "scout-radar", amount = 1 }
    },
  },
  {--crusher
    type = "recipe",
    categories = {"assembling-machine","matter-reconstructor"},
    name = "crusher",
    energy_required = 12,
    enabled = false,
    ingredients = {
      { type = "item", name = "general-purpose-structure", amount = 16 },
      { type = "item", name = "mechanical-components", amount = 8 },
      { type = "item", name = "modular-circuit", amount = 4 },

    },
    results = { 
      { type = "item", name = "crusher", amount = 1 }
    },
  },
  {--heavy space platform
    type = "recipe",
    categories = {"assembling-machine","matter-reconstructor"},
    name = "space-platform-foundation",
    energy_required = 2,
    enabled = true,
    ingredients = {
      { type = "item", name = "general-purpose-structure", amount = 2 },
    },
    results = { 
      { type = "item", name = "space-platform-foundation", amount = 1 }
    },
  },
  {--light space platform
    type = "recipe",
    categories = {"assembling-machine","matter-reconstructor"},
    name = "light-space-platform-foundation",
    energy_required = 12,
    enabled = false,
    ingredients = {
      { type = "item", name = "high-performance-structure", amount = 4 },
      { type = "item", name = "optical-coil", amount = 16 },
    },
    results = { 
      { type = "item", name = "light-space-platform-foundation", amount = 1 }
    },
  },
  {--heat pipe
    type = "recipe",
    categories = {"assembling-machine","matter-reconstructor"},
    name = "heat-pipe",
    energy_required = 4,
    enabled = false,
    ingredients = {
      { type = "item", name = "general-purpose-structure", amount = 1 },
      { type = "item", name = "mineral-glass", amount = 2 },
      { type = "item", name = "conductive-coil", amount = 8 },
    },
    results = { 
      { type = "item", name = "heat-pipe", amount = 1 }
    },
  },
  {--small radiator
    type = "recipe",
    categories = {"assembling-machine","matter-reconstructor"},
    name = "small-radiator",
    energy_required = 12,
    enabled = false,
    ingredients = {
      { type = "item", name = "general-purpose-structure", amount = 4 },
      { type = "item", name = "heat-pipe", amount = 2 },
    },
    results = { 
      { type = "item", name = "small-radiator", amount = 1 }
    },
  },
  {--repair pack
    type = "recipe",
    categories = {"assembling-machine","matter-reconstructor"},
    name = "repair-pack",
    energy_required = 6,
    enabled = false,
    ingredients = {
      { type = "item", name = "general-purpose-structure", amount = 2 },
      { type = "item", name = "mechanical-components", amount = 2 },
    },
    results = { 
      { type = "item", name = "repair-pack", amount = 1 }
    },
  },
  {--supercomputer
    type = "recipe",
    categories = {"assembling-machine","matter-reconstructor"},
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
    categories = {"assembling-machine","matter-reconstructor"},
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
  {--charger
    type = "recipe",
    categories = {"assembling-machine","matter-reconstructor"},
    name = "charger",
    energy_required = 12,
    enabled = false,
    ingredients = {
      { type = "item", name = "high-performance-structure", amount = 8 },
      { type = "item", name = "modular-circuit", amount = 8 },
      { type = "item", name = "capacitor-discharged", amount = 8 },
    },
    results = { 
      { type = "item", name = "charger", amount = 1 }
    },
  },
  {--discharger
    type = "recipe",
    categories = {"assembling-machine","matter-reconstructor"},
    name = "discharger",
    energy_required = 24,
    enabled = false,
    ingredients = {
      { type = "item", name = "high-performance-structure", amount = 16 },
      { type = "item", name = "modular-circuit", amount = 12 },
      { type = "item", name = "capacitor-charged", amount = 8 },
    },
    results = { 
      { type = "item", name = "discharger", amount = 1 }
    },
  },
  {--Energy monitor
    type = "recipe",
    categories = {"assembling-machine","matter-reconstructor"},
    name = "energy-monitor",
    energy_required = 8,
    enabled = false,
    ingredients = {
      { type = "item", name = "high-performance-structure", amount = 2 },
      { type = "item", name = "modular-circuit", amount = 8 },
      { type = "item", name = "capacitor-discharged", amount = 1 },
      { type = "item", name = "capacitor-charged", amount = 1 },
    },
    results = { 
      { type = "item", name = "energy-monitor", amount = 1 }
    },
  },
  {--micro assembler
    type = "recipe",
    categories = {"assembling-machine","matter-reconstructor"},
    name = "micro-assembler",
    energy_required = 24,
    enabled = false,
    ingredients = {
      { type = "item", name = "high-performance-structure", amount = 8 },
      { type = "item", name = "capacitor-discharged", amount = 6 },
      { type = "item", name = "mechatronic-components", amount = 6 },
    },
    results = { 
      { type = "item", name = "micro-assembler", amount = 1 }
    },
  },
  {--ground radiator
    type = "recipe",
    categories = {"assembling-machine","matter-reconstructor"},
    name = "ground-radiator",
    energy_required = 8,
    enabled = false,
    ingredients = {
      { type = "item", name = "high-performance-structure", amount = 8 },
      { type = "item", name = "pipe", amount = 8 },
      { type = "item", name = "heat-pipe", amount = 8 },
    },
    results = { 
      { type = "item", name = "ground-radiator", amount = 1 }
    },
  },
  {--rocket silo
    type = "recipe",
    categories = {"assembling-machine","matter-reconstructor"},
    name = "rocket-silo",
    energy_required = 64,
    enabled = false,
    ingredients = {
      { type = "item", name = "high-performance-structure", amount = 64 },
      { type = "item", name = "mechatronic-components", amount = 64 },
      { type = "item", name = "ai-processor", amount = 16 },
      { type = "item", name = "concrete", amount = 128 },
    },
    results = { 
      { type = "item", name = "rocket-silo", amount = 1 }
    },
  },
  {--platform thruster
    type = "recipe",
    categories = {"assembling-machine","matter-reconstructor"},
    name = "thruster",
    energy_required = 64,
    enabled = false,
    ingredients = {
      { type = "item", name = "high-performance-structure", amount = 32 },
      { type = "item", name = "mechatronic-components", amount = 16 },
      { type = "item", name = "heat-pipe", amount = 32 },
      { type = "item", name = "pipe", amount = 32 },
    },
    results = { 
      { type = "item", name = "thruster", amount = 1 }
    },
  },
  {--platform starter pack
    type = "recipe",
    categories = {"assembling-machine","matter-reconstructor"},
    name = "space-platform-starter-pack",
    energy_required = 64,
    enabled = false,
    ingredients = {
      { type = "item", name = "high-performance-structure", amount = 32 },
      { type = "item", name = "mechatronic-components", amount = 16 },
      { type = "item", name = "ai-processor", amount = 16 },
    },
    results = { 
      { type = "item", name = "space-platform-starter-pack", amount = 1 }
    },
  },
  {--platform cargo bay
    type = "recipe",
    categories = {"assembling-machine","matter-reconstructor"},
    name = "cargo-bay",
    energy_required = 32,
    enabled = false,
    ingredients = {
      { type = "item", name = "high-performance-structure", amount = 32 },
      { type = "item", name = "mechatronic-components", amount = 24 },
      { type = "item", name = "ai-processor", amount = 4 },
      { type = "item", name = "chest-2", amount = 4 },
    },
    results = { 
      { type = "item", name = "cargo-bay", amount = 1 }
    },
  },
  {--lamp
    type = "recipe",
    categories = {"assembling-machine","matter-reconstructor"},
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
  {--small electric pole
    type = "recipe",
    categories = {"assembling-machine","matter-reconstructor"},
    name = "small-electric-pole",
    energy_required = 4,
    enabled = false,
    ingredients = {
      { type = "item", name = "general-purpose-structure", amount = 1 },
      { type = "item", name = "conductive-coil", amount = 4 },
      { type = "item", name = "mineral-glass", amount = 1 },
    },
    results = { 
      { type = "item", name = "small-electric-pole", amount = 1 }
    },
  },
  {--medium electric pole
    type = "recipe",
    categories = {"assembling-machine","matter-reconstructor"},
    name = "medium-electric-pole",
    energy_required = 4,
    enabled = false,
    ingredients = {
      { type = "item", name = "general-purpose-structure", amount = 2 },
      { type = "item", name = "conductive-coil", amount = 6 },
      { type = "item", name = "mineral-glass", amount = 2 },
    },
    results = { 
      { type = "item", name = "medium-electric-pole", amount = 1 }
    },
  },
  {--big electric pole
    type = "recipe",
    categories = {"assembling-machine","matter-reconstructor"},
    name = "big-electric-pole",
    energy_required = 8,
    enabled = false,
    ingredients = {
      { type = "item", name = "medium-electric-pole", amount = 1 },
      { type = "item", name = "high-performance-structure", amount = 2 },
      { type = "item", name = "mineral-glass", amount = 6 },
      { type = "item", name = "conductive-coil", amount = 12 },
    },
    results = { 
      { type = "item", name = "big-electric-pole", amount = 1 }
    },
  },
  {--small turbine
    type = "recipe",
    categories = {"assembling-machine","matter-reconstructor"},
    name = "small-turbine",
    energy_required = 8,
    enabled = false,
    ingredients = {
      { type = "item", name = "general-purpose-structure", amount = 8 },
      { type = "item", name = "mechanical-components", amount = 8 },
      { type = "item", name = "pipe", amount = 8 },
      { type = "item", name = "conductive-coil", amount = 16 },
    },
    results = { 
      { type = "item", name = "small-turbine", amount = 1 }
    },
  },
  {--heat exchanger
    type = "recipe",
    categories = {"assembling-machine","matter-reconstructor"},
    name = "heat-exchanger",
    energy_required = 12,
    enabled = false,
    ingredients = {
      { type = "item", name = "general-purpose-structure", amount = 12 },
      { type = "item", name = "heat-pipe", amount = 8 },
      { type = "item", name = "pipe", amount = 8 },
    },
    results = { 
      { type = "item", name = "heat-exchanger", amount = 1 }
    },
  },
  {--chemical reactor
    type = "recipe",
    categories = {"assembling-machine","matter-reconstructor"},
    name = "chemical-reactor",
    energy_required = 24,
    enabled = false,
    ingredients = {
      { type = "item", name = "general-purpose-structure", amount = 16 },
      { type = "item", name = "heat-pipe", amount = 16 },
      { type = "item", name = "pipe", amount = 8 },
    },
    results = { 
      { type = "item", name = "chemical-reactor", amount = 1 }
    },
  },
  {--constant combinator
    type = "recipe",
    categories = {"assembling-machine","matter-reconstructor"},
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
    categories = {"assembling-machine","matter-reconstructor"},
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
    categories = {"assembling-machine","matter-reconstructor"},
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
    categories = {"assembling-machine","matter-reconstructor"},
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
    categories = {"assembling-machine","matter-reconstructor"},
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
    categories = {"assembling-machine","matter-reconstructor"},
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
    categories = {"assembling-machine","matter-reconstructor"},
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
  {--solar panel
    type = "recipe",
    categories = {"assembling-machine","matter-reconstructor"},
    name = "solar-panel",
    energy_required = 8,
    enabled = false,
    ingredients = {
      { type = "item", name = "general-purpose-structure", amount = 4 },
      { type = "item", name = "mineral-glass", amount = 2 },
      { type = "item", name = "crystalline-plate", amount = 2 },
    },
    results = { 
      { type = "item", name = "solar-panel", amount = 1 }
    },
  },
  {--laser turret cell
    type = "recipe",
    categories = {"assembling-machine","matter-reconstructor"},
    name = "laser-turret",
    energy_required = 8,
    enabled = false,
    ingredients = {
      { type = "item", name = "high-performance-structure", amount = 8 },
      { type = "item", name = "mechatronic-components", amount = 8 },
      { type = "item", name = "capacitor-discharged", amount = 4 },
      { type = "item", name = "optical-coil", amount = 24 },
    },
    results = { 
      { type = "item", name = "laser-turret", amount = 1 }
    },
  },
  {--chest-1
    type = "recipe",
    categories = {"assembling-machine","matter-reconstructor"},
    name = "steel-chest",
    energy_required = 4,
    enabled = false,
    ingredients = {
      { type = "item", name = "general-purpose-structure", amount = 12 },
    },
    results = { 
      { type = "item", name = "steel-chest", amount = 1 }
    },
  },
  {--passive-provider-chest-1
    type = "recipe",
    categories = {"assembling-machine","matter-reconstructor"},
    name = "passive-provider-chest",
    energy_required = 4,
    enabled = false,
    ingredients = {
      { type = "item", name = "steel-chest", amount = 1 },
      { type = "item", name = "mechanical-components", amount = 4 },
      { type = "item", name = "modular-circuit", amount = 4 },

    },
    results = { 
      { type = "item", name = "passive-provider-chest", amount = 1 }
    },
  },
  {--storage-chest-1
    type = "recipe",
    categories = {"assembling-machine","matter-reconstructor"},
    name = "storage-chest",
    energy_required = 4,
    enabled = false,
    ingredients = {
      { type = "item", name = "steel-chest", amount = 1 },
      { type = "item", name = "mechanical-components", amount = 4 },
      { type = "item", name = "modular-circuit", amount = 4 },
    },
    results = { 
      { type = "item", name = "storage-chest", amount = 1 }
    },
  },
  {--active-provider-chest-1
    type = "recipe",
    categories = {"assembling-machine","matter-reconstructor"},
    name = "active-provider-chest",
    energy_required = 4,
    enabled = false,
    ingredients = {
      { type = "item", name = "steel-chest", amount = 1 },
      { type = "item", name = "mechanical-components", amount = 4 },
      { type = "item", name = "modular-circuit", amount = 4 },
    },
    results = { 
      { type = "item", name = "active-provider-chest", amount = 1 }
    },
    hidden = true,
  },
  {--buffer-chest-1
    type = "recipe",
    categories = {"assembling-machine","matter-reconstructor"},
    name = "buffer-chest",
    energy_required = 4,
    enabled = false,
    ingredients = {
      { type = "item", name = "steel-chest", amount = 1 },
      { type = "item", name = "mechanical-components", amount = 4 },
      { type = "item", name = "modular-circuit", amount = 4 },
    },
    results = { 
      { type = "item", name = "buffer-chest", amount = 1 }
    },
    hidden = true,
  },
  {--requester-chest-1
    type = "recipe",
    categories = {"assembling-machine","matter-reconstructor"},
    name = "requester-chest",
    energy_required = 4,
    enabled = false,
    ingredients = {
      { type = "item", name = "steel-chest", amount = 1 },
      { type = "item", name = "mechanical-components", amount = 4 },
      { type = "item", name = "modular-circuit", amount = 4 },
    },
    results = { 
      { type = "item", name = "requester-chest", amount = 1 }
    },
    hidden = true,
  },
  {--chest-2
    type = "recipe",
    categories = {"assembling-machine","matter-reconstructor"},
    name = "chest-2",
    energy_required = 8,
    enabled = false,
    ingredients = {
      { type = "item", name = "steel-chest", amount = 4 },
      { type = "item", name = "high-performance-structure", amount = 4 },
    },
    results = { 
      { type = "item", name = "chest-2", amount = 1 }
    },
  },
  {--storage-chest-2
    type = "recipe",
    categories = {"assembling-machine","matter-reconstructor"},
    name = "storage-chest-2",
    energy_required = 8,
    enabled = false,
    ingredients = {
      { type = "item", name = "chest-2", amount = 1 },
      { type = "item", name = "mechatronic-components", amount = 4 },
      { type = "item", name = "ai-processor", amount = 1 },
    },
    results = { 
      { type = "item", name = "storage-chest-2", amount = 1 }
    },
  },
  {--passive-provider-chest-2
    type = "recipe",
    categories = {"assembling-machine","matter-reconstructor"},
    name = "passive-provider-chest-2",
    energy_required = 8,
    enabled = false,
    ingredients = {
      { type = "item", name = "chest-2", amount = 1 },
      { type = "item", name = "mechatronic-components", amount = 4 },
      { type = "item", name = "ai-processor", amount = 1 },
    },
    results = { 
      { type = "item", name = "passive-provider-chest-2", amount = 1 }
    },
  },
  {--active-provider-chest-2
    type = "recipe",
    categories = {"assembling-machine","matter-reconstructor"},
    name = "active-provider-chest-2",
    energy_required = 8,
    enabled = false,
    ingredients = {
      { type = "item", name = "chest-2", amount = 1 },
      { type = "item", name = "mechatronic-components", amount = 4 },
      { type = "item", name = "ai-processor", amount = 1 },
    },
    results = { 
      { type = "item", name = "active-provider-chest-2", amount = 1 }
    },
    hidden = true,
  },
  {--buffer-chest-2
    type = "recipe",
    categories = {"assembling-machine","matter-reconstructor"},
    name = "buffer-chest-2",
    energy_required = 8,
    enabled = false,
    ingredients = {
      { type = "item", name = "chest-2", amount = 1 },
      { type = "item", name = "mechatronic-components", amount = 4 },
      { type = "item", name = "ai-processor", amount = 1 },
    },
    results = { 
      { type = "item", name = "buffer-chest-2", amount = 1 }
    },
    hidden = true,
  },
  {--requester-chest-2
    type = "recipe",
    categories = {"assembling-machine","matter-reconstructor"},
    name = "requester-chest-2",
    energy_required = 8,
    enabled = false,
    ingredients = {
      { type = "item", name = "chest-2", amount = 1 },
      { type = "item", name = "mechatronic-components", amount = 4 },
      { type = "item", name = "ai-processor", amount = 1 },
    },
    results = { 
      { type = "item", name = "requester-chest-2", amount = 1 }
    },
    hidden = true,
  },
  {--stone wall
    type = "recipe",
    categories = {"assembling-machine","matter-reconstructor"},
    name = "stone-wall",
    energy_required = 4,
    enabled = false,
    ingredients = {
      { type = "item", name = "concrete", amount = 4 },
    },
    results = { 
      { type = "item", name = "stone-wall", amount = 1 }
    },
  },
  {--gate
    type = "recipe",
    categories = {"assembling-machine","matter-reconstructor"},
    name = "gate",
    energy_required = 4,
    enabled = false,
    ingredients = {
      { type = "item", name = "stone-wall", amount = 1 },
      { type = "item", name = "modular-circuit", amount = 2 },
    },
    results = { 
      { type = "item", name = "gate", amount = 1 }
    },
  },
  {--cargo-landing-pad
    type = "recipe",
    categories = {"assembling-machine","matter-reconstructor"},
    name = "cargo-landing-pad",
    energy_required = 32,
    enabled = false,
    ingredients = {
      { type = "item", name = "general-purpose-structure", amount = 16 },
      { type = "item", name = "modular-circuit", amount = 16 },
      { type = "item", name = "steel-chest", amount = 16 },
    },
    results = { 
      { type = "item",   {--passive-provider-chest-1
    type = "recipe",
    categories = {"assembling-machine","matter-reconstructor"},
    name = "passive-provider-chest",
    energy_required = 4,
    enabled = false,
    ingredients = {
      { type = "item", name = "steel-chest", amount = 1 },
      { type = "item", name = "mechanical-components", amount = 4 },
      { type = "item", name = "modular-circuit", amount = 4 },

    },
    results = { 
      { type = "item", name = "passive-provider-chest", amount = 1 }
    },
  },
  {--storage-chest-1
    type = "recipe",
    categories = {"assembling-machine","matter-reconstructor"},
    name = "storage-chest",
    energy_required = 4,
    enabled = false,
    ingredients = {
      { type = "item", name = "steel-chest", amount = 1 },
      { type = "item", name = "mechanical-components", amount = 4 },
      { type = "item", name = "modular-circuit", amount = 4 },
    },
    results = { 
      { type = "item", name = "storage-chest", amount = 1 }
    },
  },name = "cargo-landing-pad", amount = 1 }
    },
  },
  {--long-inserter-1
    type = "recipe",
    categories = {"assembling-machine","matter-reconstructor"},
    name = "long-handed-inserter",
    energy_required = 4,
    enabled = false,
    ingredients = {
      { type = "item", name = "general-purpose-structure", amount = 2 },
      { type = "item", name = "inserter", amount = 1 },
    },
    results = { 
      { type = "item", name = "long-handed-inserter", amount = 1 }
    },
  },
  {--locomotive
    type = "recipe",
    categories = {"assembling-machine","matter-reconstructor"},
    name = "locomotive",
    energy_required = 16,
    enabled = false,
    ingredients = {
      { type = "item", name = "high-performance-structure", amount = 16 },
      { type = "item", name = "mechanical-components", amount = 8 },
    },
    results = { 
      { type = "item", name = "locomotive", amount = 1 }
    },
  },
  {--cargo wagon
    type = "recipe",
    categories = {"assembling-machine","matter-reconstructor"},
    name = "cargo-wagon",
    energy_required = 16,
    enabled = false,
    ingredients = {
      { type = "item", name = "high-performance-structure", amount = 8 },
      { type = "item", name = "mechanical-components", amount = 8 },
      { type = "item", name = "steel-chest", amount = 12 },
    },
    results = { 
      { type = "item", name = "cargo-wagon", amount = 1 }
    },
  },
  {--fluid wagon
    type = "recipe",
    categories = {"assembling-machine","matter-reconstructor"},
    name = "fluid-wagon",
    energy_required = 16,
    enabled = false,
    ingredients = {
      { type = "item", name = "high-performance-structure", amount = 8 },
      { type = "item", name = "mechanical-components", amount = 8 },
      { type = "item", name = "storage-tank", amount = 3 },
    },
    results = { 
      { type = "item", name = "fluid-wagon", amount = 1 }
    },
  },
  {--rail
    type = "recipe",
    categories = {"assembling-machine","matter-reconstructor"},
    name = "rail",
    energy_required = 1,
    enabled = false,
    ingredients = {
      { type = "item", name = "high-performance-structure", amount = 1 },
      { type = "item", name = "mineral-ore", amount = 8 },
    },
    results = { 
      { type = "item", name = "rail", amount = 2 }
    },
  },
  {--rail signal
    type = "recipe",
    categories = {"assembling-machine","matter-reconstructor"},
    name = "rail-signal",
    energy_required = 1,
    enabled = false,
    ingredients = {
      { type = "item", name = "small-lamp", amount = 1 },
      { type = "item", name = "modular-circuit", amount = 1 },
    },
    results = { 
      { type = "item", name = "rail-signal", amount = 1 }
    },
  },
  {--rail chain signal
    type = "recipe",
    categories = {"assembling-machine","matter-reconstructor"},
    name = "rail-chain-signal",
    energy_required = 1,
    enabled = false,
    ingredients = {
      { type = "item", name = "small-lamp", amount = 1 },
      { type = "item", name = "modular-circuit", amount = 1 },
    },
    results = { 
      { type = "item", name = "rail-chain-signal", amount = 1 }
    },
  },
  {--train stop
    type = "recipe",
    categories = {"assembling-machine","matter-reconstructor"},
    name = "train-stop",
    energy_required = 1,
    enabled = false,
    ingredients = {
      { type = "item", name = "small-lamp", amount = 1 },
      { type = "item", name = "general-purpose-structure", amount = 2 },
    },
    results = { 
      { type = "item", name = "train-stop", amount = 1 }
    },
  },
  {--hazard concrete
    type = "recipe",
    categories = {"assembling-machine","matter-reconstructor"},
    name = "hazard-concrete",
    energy_required = 1,
    enabled = false,
    ingredients = {
      { type = "item", name = "concrete", amount = 1 },
    },
    results = { 
      { type = "item", name = "hazard-concrete", amount = 1 }
    },
  },
  {--barrel
    type = "recipe",
    categories = {"assembling-machine","matter-reconstructor"},
    name = "barrel",
    energy_required = 1,
    enabled = false,
    ingredients = {
      { type = "item", name = "general-purpose-structure", amount = 4 },
    },
    results = { 
      { type = "item", name = "barrel", amount = 1 }
    },
  },
  {--cliff explosives
    type = "recipe",
    categories = {"assembling-machine","matter-reconstructor"},
    subgroup = "fluid-recipes",
    name = "cliff-explosives",
    energy_required = 8,
    enabled = false,
    allow_productivity = true,
    ingredients = {
      { type = "item", name = "fused-crystalline-chunk", amount = 2 },
      { type = "item", name = "barrel", amount = 1 },
    },
    results = { 
      { type = "item", name = "cliff-explosives", amount = 1 },
    },
  },
})
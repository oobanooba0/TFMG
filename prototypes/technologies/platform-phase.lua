data:extend({
  {--consider your purpose
    type = "technology",
    name = "consider-your-purpose",
    icon = "__base__/graphics/icons/signal/signal_everything.png",
    icon_size = 64,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "general-purpose-structure-reconstruction"
      },
    },
    research_trigger =
    {
      type = "build-entity",
      entity = "matter-reconstructor",
    },
    essential = true
  },
  {--furnaces
    type = "technology",
    name = "smelting",
    icon = "__base__/graphics/technology/advanced-material-processing-2.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "furnace"
      },
      {
        type = "unlock-recipe",
        recipe = "ferric-plate"
      },
      {
        type = "unlock-recipe",
        recipe = "hot-mineral-plate"
      },
      {
        type = "unlock-recipe",
        recipe = "mineral-glass"
      },
      {
        type = "unlock-recipe",
        recipe = "conductive-coil-reconstruction"
      },
      {
        type = "unlock-recipe",
        recipe = "modular-circuit-reconstruction"
      },
      {
        type = "unlock-recipe",
        recipe = "mechanical-components-reconstruction"
      },
    },
    research_trigger =
    {
      type = "craft-item",
      item = "general-purpose-structure",
      count = 16
    },
    prerequisites = {"consider-your-purpose"},
  },
  {--assembly machines
    type = "technology",
    name = "assembling",
    icon = "__base__/graphics/technology/automation-1.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "assembling-machine"
      },
      {
        type = "unlock-recipe",
        recipe = "general-purpose-structure"
      },
      {
        type = "unlock-recipe",
        recipe = "mechanical-components"
      },
      {
        type = "unlock-recipe",
        recipe = "conductive-coil"
      },
      {
        type = "unlock-recipe",
        recipe = "modular-circuit"
      },
      {
        type = "unlock-recipe",
        recipe = "mineral-glass-cooling"
      },
      {
        type = "unlock-recipe",
        recipe = "repair-pack"
      },
    },
    research_trigger =
    {
      type = "craft-item",
      item = "ferric-plate",
      count = 16
    },
    prerequisites = {"smelting"},
  },
  {--logistics 1
    type = "technology",
    name = "logistics-1",
    icon = "__base__/graphics/technology/logistics-1.png",
    localised_name = {"technology-name.logistics-1"},
    localised_description = {"technology-description.logistics-1"},
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "transport-belt-1"
      },
      {
        type = "unlock-recipe",
        recipe = "underground-belt-1"
      },
      {
        type = "unlock-recipe",
        recipe = "splitter-1"
      },
      {
        type = "unlock-recipe",
        recipe = "inserter-1"
      },
      {
        type = "unlock-recipe",
        recipe = "container-1"
      },
    },
    research_trigger =
    {
      type = "craft-item",
      item = "mechanical-components",
      count = 16
    },
    prerequisites = {"assembling"},
  },
  {--heat management
    type = "technology",
    name = "heat-management",
    icon = "__base__/graphics/icons/heat-pipe.png",
    icon_size = 64,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "small-radiator"
      },
      {
        type = "unlock-recipe",
        recipe = "heat-pipe"
      },
    },
    research_trigger =
    {
      type = "craft-item",
      item = "mineral-glass",
      count = 16
    },
    prerequisites = {"smelting"},
  },
  {--asteroid collection
    type = "technology",
    name = "asteroid-collection",
    icon = "__space-age__/graphics/technology/space-platform.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "asteroid-collector"
      },
    },
    research_trigger =
    {
      type = "craft-item",
      item = "general-purpose-structure",
      count = 64
    },
    prerequisites = {"assembling"},
  },
  {--consider the self
    type = "technology",
    name = "consider-the-self",
    icon = "__base__/graphics/icons/signal/signal_each.png",
    icon_size = 64,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "print-ai-processor"
      },
      {
        type = "unlock-recipe",
        recipe = "supercomputer"
      },
    },
    research_trigger =
    {
      type = "craft-item",
      item = "modular-circuit",
      count = 64
    },
    prerequisites = {"logistics-1","asteroid-collection","heat-management"},
    essential = true
  },
  {--introspection science
    type = "technology",
    name = "introspection-science-pack",
    icon = "__Krastorio2Assets__/technologies/matter-tech-card.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "introspection-science-unverified"
      },
      {
        type = "unlock-recipe",
        recipe = "introspection-science"
      },
      {
        type = "unlock-recipe",
        recipe = "neural-node"
      },
      {
        type = "unlock-recipe",
        recipe = "arithmetic-combinator"
      },
      {
        type = "unlock-recipe",
        recipe = "decider-combinator"
      },
      {
        type = "unlock-recipe",
        recipe = "constant-combinator"
      }
    },
    research_trigger =
    {
      type = "build-entity",
      entity = "supercomputer",
    },
    prerequisites = {"consider-the-self"},
    essential = true
  },
  {--energy distribution 1
    type = "technology",
    name = "energy-distribution-1",
    icon = "__base__/graphics/technology/electric-energy-distribution-1.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "tiny-electric-pylon"
      },
    },
    prerequisites = {"introspection-science-pack"},
    unit = {
    count = 16,
    ingredients = {{"introspection-science", 1}},
    time = 16
    },
  },
  {--small-lamp
    type = "technology",
    name = "small-lamp",
    icon = "__base__/graphics/technology/lamp.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "small-lamp"
      },
    },
    prerequisites = {"introspection-science-pack"},
    unit = {
    count = 16,
    ingredients = {{"introspection-science", 1}},
    time = 16
    },
  },
  {--circuit-network
    type = "technology",
    name = "combinators",
    icon = "__base__/graphics/technology/advanced-combinators.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "power-switch"
      },
      {
        type = "unlock-recipe",
        recipe = "programmable-speaker"
      },
      {
        type = "unlock-recipe",
        recipe = "display-panel"
      },
      {
        type = "unlock-recipe",
        recipe = "selector-combinator"
      },
    },
    prerequisites = {"introspection-science-pack"},
    unit = {
    count = 64,
    ingredients = {{"introspection-science", 1}},
    time = 16
    },
  },
  {--solar power
    type = "technology",
    name = "solar-power",
    icon = "__base__/graphics/technology/solar-energy.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "solar-cell"
      },
    },
    prerequisites = {"introspection-science-pack"},
    unit = {
    count = 32,
    ingredients = {{"introspection-science", 1}},
    time = 16
    },
  },
  {--long-inserter-1
    type = "technology",
    name = "long-inserter-1",
    icon = "__base__/graphics/technology/inserter-capacity.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "long-inserter-1"
      },
    },
    prerequisites = {"introspection-science-pack"},
    unit = {
    count = 16,
    ingredients = {{"introspection-science", 1}},
    time = 16
    },
  },
  {--bots
    type = "technology",
    name = "basic-bots",
    icon = "__base__/graphics/technology/construction-robotics.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "construction-robot"
      },
      {
        type = "unlock-recipe",
        recipe = "logistic-robot"
      },
      {
        type = "unlock-recipe",
        recipe = "roboport-1"
      },
    },
    prerequisites = {"introspection-science-pack"},
    unit = {
    count = 16,
    ingredients = {{"introspection-science", 1}},
    time = 16
    },
  },
  {--Scout-o-tron
    type = "technology",
    name = "scout-o-tron",
    icon = "__base__/graphics/technology/spidertron.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "spidertron-frame"
      },
      {
        type = "unlock-recipe",
        recipe = "mechanical-leg"
      },
      {
        type = "unlock-recipe",
        recipe = "scout-o-tron"
      },
    },
    prerequisites = {"introspection-science-pack"},
    unit = {
    count = 16,
    ingredients = {{"introspection-science", 1}},
    time = 16
    },
  },
  {--scout-o-tron drop pods
    type = "technology",
    name = "scout-o-tron-drop-pods",
    icon = "__base__/graphics/icons/artillery-targeting-remote.png",
    icon_size = 64,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "scout-o-tron-pod"
      },
    },
    prerequisites = {"scout-o-tron","solar-power","basic-bots"},
    unit = {
    count = 64,
    ingredients = {{"introspection-science", 1}},
    time = 16
    },
  },
  {--consider your potential. Platform phase end.
    type = "technology",
    name = "consider-your-potential",
    icon = "__base__/graphics/icons/signal/signal_anything.png",
    icon_size = 64,
    effects =
    {
      {
        type = "unlock-space-location",
        space_location = "arrival",
        use_icon_overlay_constant = true
      },
    },
    research_trigger =
    {
      type = "craft-item",
      item = "scout-o-tron-pod",
      count = 1
    },
    prerequisites = {"scout-o-tron-drop-pods"},
    essential = true
  },

---extra techs

  {--inserter-capacity-bonus 1
    type = "technology",
    name = "inserter-capacity-bonus-1",
    icons = util.technology_icon_constant_stack_size("__base__/graphics/technology/inserter-capacity.png"),
    localised_name = {"technology-name.inserter-capacity-bonus-1"},
    localised_description = {"technology-description.inserter-capacity-bonus-1"},
    effects =
    {
      {
        type = "inserter-stack-size-bonus",
        modifier = 1
      },
    },
    research_trigger =
    {
      type = "craft-item",
      item = "inserter-1",
      count = 64
    },
    prerequisites = {"logistics-1"},
    upgrade = true
  },

  {
    type = "technology",
    name = "infinite-technology-1",
    icon = ("__base__/graphics/icons/signal/signal-speed.png"),
    icon_size = 64,
    effects = {},
    prerequisites = {"consider-your-potential"},
    unit =
    {
      count_formula = "1000*(L)",
      ingredients =
      {
        {"introspection-science", 1},
      },
      time = 60
    },
    max_level = "infinite",
    upgrade = true
  },
})

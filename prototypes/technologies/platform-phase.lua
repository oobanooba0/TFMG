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

  {--Introspection science
    type = "technology",
    name = "introspection-science-pack",
    icon = "__base__/graphics/technology/automation-science-pack.png",
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




---to be changed

  {--Scout-o-tron parts
    type = "technology",
    name = "scout-o-tron-parts",
    icon = "__base__/graphics/icons/spidertron-tintable-mask.png",
    icon_size = 64,
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
        recipe = "manipulation-tool"
      },
    },
    research_trigger =
    {
      type = "craft-item",
      item = "modular-circuit",
      count = 64
    },
    prerequisites = {"logistics-1","asteroid-collection","heat-management"},
  },

  {--scout-o-tron
    type = "technology",
    name = "scout-o-tron",
    icon = "__base__/graphics/technology/spidertron.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "scout-o-tron"
      },
    },
    research_trigger =
    {
      type = "craft-item",
      item = "ai-processor",
      count = 1
    },
    prerequisites = {"consider-the-self"},
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
      item = "scout-o-tron",
      count = 1
    },
    prerequisites = {"scout-o-tron"},
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
})
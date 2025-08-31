--make it stickj
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
    }
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
        recipe = "crystalline-plate"
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
      item = "crystalline-plate",
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
  {--the collective self
    type = "technology",
    name = "consider-the-collective-self",
    icon = "__base__/graphics/icons/signal/signal_each.png",
    icon_size = 64,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "print-ai-processor"
      },
    },
    research_trigger =
    {
      type = "craft-item",
      item = "spidertron-frame",
      count = 1
    },
    prerequisites = {"scout-o-tron-parts"},
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
    prerequisites = {"consider-the-collective-self"},
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
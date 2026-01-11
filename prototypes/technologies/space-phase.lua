--platform docking tech unlock
local docking_tech = data.raw["technology"]["TFMG-platform-docking"]
  docking_tech.prerequisites = {"contemplate-void"}
  docking_tech.unit = {
    count = 512,
    ingredients = {
      {"introspection-science", 1},
      {"exploration-science", 1}
    },
    time = 32
  }

data:extend({
--mainline researches 
  {--evaluate mind
    type = "technology",
    name = "evaluate-mind",
    icon = "__base__/graphics/icons/signal/signal_pink.png",
    icon_size = 64,
    essential = true,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "ai-processor"
      },
    },
    prerequisites = {"crystal-excitation"},
    research_trigger = {
      type = "craft-item",
      item = "fused-crystalline-chunk",
      count = 8
    },
  },
  {--crystal excitation
    type = "technology",
    name = "crystal-excitation",
    icon = "__TFMG-assets-0__/technology/crystal-excitation.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "excited-crystalline-chunk-red"
      },
      {
        type = "unlock-recipe",
        recipe = "fused-crystalline-chunk"
      },
      {
        type = "unlock-recipe",
        recipe = "water"
      }
    },
    prerequisites = {"contemplate-void"},
    unit = {
      count = 256,
      ingredients = {
        {"introspection-science", 1},
        {"exploration-science", 1}
      },
      time = 24
    },
  },
  {--space flight
    type = "technology",
    name = "space-flight",
    icon = "__space-age__/graphics/technology/space-platform-thruster.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "thruster"
      },
      {
        type = "unlock-recipe",
        recipe = "space-platform-starter-pack"
      },
      {
        type = "unlock-recipe",
        recipe = "light-space-platform-foundation"
      },
      {
        type = "unlock-space-platforms",
        modifier = true,
      },
      {
        type = "unlock-space-location",
        space_location = "limit",
        use_icon_overlay_constant = true
      },
    },
    prerequisites = {"contemplate-void"},
    unit = {
      count = 512,
      ingredients = {
        {"introspection-science", 1},
        {"exploration-science", 1}
      },
      time = 32
    },
  },
  {--exploitation science
    type = "technology",
    name = "exploitation-science",
    icon = "__Krastorio2Assets__/technologies/production-tech-card.png",
    icon_size = 256,
    essential = true,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "exploitation-science-unverified"
      },
      {
        type = "unlock-recipe",
        recipe = "exploitation-science"
      },
    },
    prerequisites = {"evaluate-mind","space-flight"},
    unit = {
      count = 512,
      ingredients = {
        {"introspection-science", 1},
        {"exploration-science", 1}
      },
      time = 32
    },
  },
  {--volatile handling
    type = "technology",
    name = "volatile-handling",
    icon = "__space-age__/graphics/technology/advanced-asteroid-processing.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "volatile-chunk-decomposition"
      },
    },
    prerequisites = {"exploitation-science"},
    unit = {
      count = 512,
      ingredients = {
        {"introspection-science", 1},
        {"exploration-science", 1},
        {"exploitation-science", 1},
      },
      time = 32
    },
  },
  {--advanced microbe 
    type = "technology",
    name = "advanced-microbe-cultivation",
    icon = "__space-age__/graphics/technology/advanced-asteroid-processing.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "microbe-restoration"
      },
      {
        type = "unlock-recipe",
        recipe = "microbe-cultivation"
      },
    },
    prerequisites = {"exploitation-science"},
    unit = {
      count = 512,
      ingredients = {
        {"introspection-science", 1},
        {"exploration-science", 1},
        {"exploitation-science", 1},
      },
      time = 32
    },
  },
  {--Constructron
    type = "technology",
    name = "constructron",
    icon = "__base__/graphics/technology/spidertron.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "constructron"
      },
    },
    prerequisites = {"exploitation-science","advanced-storage"},
    unit = {
      count = 512,
      ingredients = {
        {"introspection-science", 1},
        {"exploration-science", 1},
        {"exploitation-science", 1},
      },
      time = 32
    },
  },
  {--hub expansion
    type = "technology",
    name = "hub-expansion",
    icon = "__space-age__/graphics/technology/space-platform.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "cargo-bay",
      },
      {
        type = "nothing",
        effect_description = {"tech-effect.cargo-bay-max"},
      }
    },
    prerequisites = {"exploitation-science","advanced-storage"},
    unit = {
      count = 512,
      ingredients = {
        {"introspection-science", 1},
        {"exploration-science", 1},
        {"exploitation-science", 1},
      },
      time = 32
    },
  },
  {--extraction
    type = "technology",
    name = "extraction",
    icon = "__TFMG-assets-0__/icons/planets/extraction-starmap.png",
    icon_size = 512,
    effects =
    {
      {
        type = "unlock-space-location",
        space_location = "extraction",
        use_icon_overlay_constant = true
      },
    },
    unit = {
      count = 1024,
      ingredients = {
        {"introspection-science", 1},
        {"exploration-science", 1},
        {"exploitation-science", 1},
      },
      time = 32
    },
    prerequisites = {"volatile-handling"},
    essential = true
  },
--side researches
  {--cliff explosives
    type = "technology",
    name = "cliff-explosive",
    icon = "__base__/graphics/technology/cliff-explosives.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "cliff-explosives"
      },
      {
        type = "cliff-deconstruction-enabled",
        modifier = true
      },  
    },
    prerequisites = {"crystal-excitation"},
    unit = {
      count = 256,
      ingredients = {
        {"introspection-science", 1},
        {"exploration-science", 1}
      },
      time = 64
    },
  },
})
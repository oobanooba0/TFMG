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
    icons = {
      {icon = "__TFMG-assets-0__/icons/items/excited-crystalline-chunk-red.png",shift = {-64,0}},
      {icon = "__TFMG-assets-0__/icons/items/excited-crystalline-chunk-blue.png",shift = {64, 0}},
    },
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "excited-crystalline-chunk-red"
      },
      {
        type = "unlock-recipe",
        recipe = "excited-crystal-quenching"
      },
      {
        type = "unlock-recipe",
        recipe = "steam-condensation"
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
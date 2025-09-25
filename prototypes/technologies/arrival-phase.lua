data:extend({
  {--fluid extraction
    type = "technology",
    name = "fluid-extraction",
    icon = "__base__/graphics/technology/oil-gathering.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "pipe"
      },
      {
        type = "unlock-recipe",
        recipe = "pipe-to-ground"
      },
      {
        type = "unlock-recipe",
        recipe = "pump"
      },
      {
        type = "unlock-recipe",
        recipe = "storage-tank"
      },
      {
        type = "unlock-recipe",
        recipe = "pumpjack"
      },
    },
    prerequisites = {"consider-your-potential"},
    unit = {
    count = 64,
    ingredients = {{"introspection-science", 1}},
    time = 16
    },
  },
  {--solid extraction
    type = "technology",
    name = "solid-extraction",
    icon = "__base__/graphics/technology/electric-mining-drill.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "electric-mining-drill"
      },
      {
        type = "unlock-recipe",
        recipe = "hot-mineral-plate-smelting"
      },
      {
        type = "unlock-recipe",
        recipe = "mineral-glass-smelting"
      },
      {
        type = "unlock-recipe",
        recipe = "ferric-ore-smelting"
      },
    },
    prerequisites = {"consider-your-potential"},
    unit = {
    count = 64,
    ingredients = {{"introspection-science", 1}},
    time = 16
    },
  },
  {--energy distribution 2
    type = "technology",
    name = "energy-distribution-2",
    icon = "__base__/graphics/technology/electric-energy-distribution-1.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "small-electric-pylon"
      },
    },
    prerequisites = {"energy-distribution-1","consider-your-potential"},
    unit = {
    count = 32,
    ingredients = {{"introspection-science", 1}},
    time = 16
    },
  },
  {--EXPLORE your options
    type = "technology",
    name = "explore-your-options",
    icon = "__base__/graphics/technology/advanced-oil-processing.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "refinery"
      },
      {
        type = "unlock-recipe",
        recipe = "chemistry-plant"
      },
    },
    prerequisites = {"fluid-extraction"},
    research_trigger =
    {
      type = "build-entity",
      entity = "pumpjack",
    },
  },
})
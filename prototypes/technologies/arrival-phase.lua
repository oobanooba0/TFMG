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
      count = 48,
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
  {--hydrocarbon processing
    type = "technology",
    name = "hydrocarbon-processing",
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
      {
        type = "unlock-recipe",
        recipe = "hydrocarbon-slush-distillation"
      },
      {
        type = "unlock-recipe",
        recipe = "water-filtration"
      },
      {
        type = "unlock-recipe",
        recipe = "organic-sludge-cultivation"
      },
      {
        type = "unlock-recipe",
        recipe = "hydrocarbon-concentration"
      },
      {
        type = "unlock-recipe",
        recipe = "hydrocarbon-seperation"
      },
    },
    prerequisites = {"fluid-extraction"},
    unit = {
      count = 64,
      ingredients = {{"introspection-science", 1}},
      time = 16
    }
  },
  {--contemplate life
    type = "technology",
    name = "contemplate-life",
    icon = "__base__/graphics/icons/signal/signal_green.png",
    icon_size = 64,
    essential = true,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "microbe-extraction"
      },
      {
        type = "unlock-recipe",
        recipe = "bio-polymerisation"
      },
    },
    prerequisites = {"hydrocarbon-processing"},
    research_trigger = {
      type = "craft-fluid",
      fluid = "organic-sludge",
      count = 256
    },
  },
  {--ferric ore purification
    type = "technology",
    name = "ferric-ore-purification",
    icon = "__Krastorio2Assets__/technologies/enriched-ores.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "ferric-ore-washing"
      },
      {
        type = "unlock-recipe",
        recipe = "ferric-solution-reduction"
      },
      {
        type = "unlock-recipe",
        recipe = "pure-iron-ore-smelting"
      },
      {
        type = "unlock-recipe",
        recipe = "titanium-ore-smelting"
      },
    },
    prerequisites = {"hydrocarbon-processing","small-crusher","solid-extraction"},
    unit = {
      count = 128,
      ingredients = {{"introspection-science", 1}},
      time = 16
    }
  },
  {--contemplate rust
    type = "technology",
    name = "contemplate-rust",
    icon = "__base__/graphics/icons/signal/signal_red.png",
    icon_size = 64,
    essential = true,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "titanium-ore-smelting"
      },
    },
    prerequisites = {"ferric-ore-purification"},
    research_trigger = {
      type = "craft-item",
      item = "titanium-ore",
      count = 16
    },
  },
  {--high performance structure
    type = "technology",
    name = "high-performance-structure",
    icon = "__TFMG__/graphics/technology/high-performance-structure.png",
    icon_size = 1024,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "high-performance-structure"
      },
    },
    prerequisites = {"contemplate-rust","contemplate-life"},
    unit = {
      count = 128,
      ingredients = {{"introspection-science", 1}},
      time = 24
    },
  },
  {--optical coil
    type = "technology",
    name = "optical-coil",
    icon = "__TFMG__/graphics/technology/optical-coil.png",
    icon_size = 1024,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "optical-coil"
      },
    },
    prerequisites = {"contemplate-rust","contemplate-life"},
    unit = {
      count = 128,
      ingredients = {{"introspection-science", 1}},
      time = 24
    },
  },
  {--exploration science
    type = "technology",
    name = "exploration-science",
    icon = "__Krastorio2Assets__/technologies/utility-tech-card.png",
    icon_size = 256,
    essential = true,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "exploration-science-unverified"
      },
      {
        type = "unlock-recipe",
        recipe = "exploration-science"
      },
    },
    prerequisites = {"high-performance-structure","optical-coil"},
    unit = {
      count = 256,
      ingredients = {{"introspection-science", 1}},
      time = 16
    },
  },
  {--mineral lubricant
    type = "technology",
    name = "mineral-lubricant",
    icon = "__base__/graphics/technology/lubricant.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "mineral-lubricant"
      },
    },
    prerequisites = {"exploration-science"},
    unit = {
      count = 64,
      ingredients = {
        {"introspection-science", 1},
        {"exploration-science", 1}
      },
      time = 24
    },
  },
  {--mechatronic components
    type = "technology",
    name = "mechatronic-components",
    icon = "__Krastorio2Assets__/technologies/ai-core.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "mechatronic-components"
      },
    },
    prerequisites = {"mineral-lubricant"},
    unit = {
      count = 128,
      ingredients = {
        {"introspection-science", 1},
        {"exploration-science", 1}
      },
      time = 24
    },
  },
  --side techs
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
  {--chemical-reactor
    type = "technology",
    name = "chemical-power",
    icon = "__Krastorio2Assets__/technologies/gas-power-station.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "small-turbine"
      },
      {
        type = "unlock-recipe",
        recipe = "small-heat-exchanger"
      },
      {
        type = "unlock-recipe",
        recipe = "chemical-reactor"
      },
    },
    prerequisites = {"energy-distribution-2","contemplate-rust"},
    unit = {
      count = 128,
      ingredients = {{"introspection-science", 1}},
      time = 24
    },
  },
  {--energy distribution 3
    type = "technology",
    name = "energy-distribution-3",
    icon = "__base__/graphics/technology/electric-energy-distribution-1.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "large-electric-pylon"
      },
    },
    prerequisites = {"energy-distribution-2","exploration-science"},
    unit = {
      count = 128,
      ingredients = {
        {"introspection-science", 1},
        {"exploration-science", 1}
      },
      time = 24
    },
  },
  {--rails
    type = "technology",
    name = "rails",
    icon = "__base__/graphics/technology/railway.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "locomotive"
      },
      {
        type = "unlock-recipe",
        recipe = "cargo-wagon"
      },
      {
        type = "unlock-recipe",
        recipe = "fluid-wagon"
      },
      {
        type = "unlock-recipe",
        recipe = "rail"
      },
      {
        type = "unlock-recipe",
        recipe = "train-stop"
      },
      {
        type = "unlock-recipe",
        recipe = "rail-signal"
      },
      {
        type = "unlock-recipe",
        recipe = "rail-chain-signal"
      },
    },
    prerequisites = {"exploration-science"},
    unit = {
      count = 64,
      ingredients = {
        {"introspection-science", 1},
        {"exploration-science", 1},
      },
      time = 16
    },
  },
  {--mineral concrete
    type = "technology",
    name = "mineral-concrete",
    icon = "__base__/graphics/technology/concrete.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "refined-concrete"
      },
    },
    prerequisites = {"energy-distribution-2","exploration-science"},
    unit = {
      count = 128,
      ingredients = {
        {"introspection-science", 1},
        {"exploration-science", 1}
      },
      time = 24
    },
  },
  {--logistics 2
    type = "technology",
    name = "logistics-2",
    icon = "__base__/graphics/technology/logistics-2.png",
    localised_name = {"technology-name.logistics-2"},
    localised_description = {"technology-description.logistics-2"},
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "transport-belt-2"
      },
      {
        type = "unlock-recipe",
        recipe = "underground-belt-2"
      },
      {
        type = "unlock-recipe",
        recipe = "splitter-2"
      },
    },
    prerequisites = {"mechatronic-components"},
    unit = {
      count = 256,
      ingredients = {
        {"introspection-science", 1},
        {"exploration-science", 1}
      },
      time = 24
    },
  },
  {--radars
    type = "technology",
    name = "radars",
    icon = "__base__/graphics/technology/radar.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "radar"
      },
    },
    prerequisites = {"energy-distribution-2"},
    unit = {
      count = 64,
      ingredients = {{"introspection-science", 1}},
      time = 16
    },
  },
  {--scout radar
    type = "technology",
    name = "scout-radar",
    icon = "__base__/graphics/technology/radar.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "scout-radar"
      },
    },
    prerequisites = {"radars","optical-coil"},
    unit = {
      count = 128,
      ingredients = {{"introspection-science", 1}},
      time = 24
    },
  },
})
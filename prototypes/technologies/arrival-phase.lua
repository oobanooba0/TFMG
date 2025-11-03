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
      {
        type = "unlock-recipe",
        recipe = "barrel"
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
      {
        type = "unlock-recipe",
        recipe = "organic-carbon-liquefaction"
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
    icon = "__TFMG-assets-0__/technology/high-performance-structure.png",
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
    icon = "__TFMG-assets-0__/technology/optical-coil.png",
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
  {--heat management 2
    type = "technology",
    name = "heat-management-2",
    icon = "__TFMG-thermal__/graphics/radiator-ground/radiator-ground.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "ground-radiator"
      },
      {
        type = "unlock-recipe",
        recipe = "heat-monitor"
      },
    },
    prerequisites = {"high-performance-structure","chemical-power"},
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
    prerequisites = {"heat-management-2","optical-coil"},
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
  {--capacitors
    type = "technology",
    name = "capacitors",
    icon = "__base__/graphics/technology/battery-equipment.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "capacitor-discharged"
      },
      {
        type = "unlock-recipe",
        recipe = "capacitor-charged"
      },
      {
        type = "unlock-recipe",
        recipe = "charger"
      },
      {
        type = "unlock-recipe",
        recipe = "discharger"
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
      }     
    },
    prerequisites = {"capacitors"},
    unit = {
      count = 64,
      ingredients = {
        {"introspection-science", 1},
        {"exploration-science", 1}
      },
      time = 24
    },
  },
  {--contemplate mind
    type = "technology",
    name = "contemplate-mind",
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
  {--micro assembly
    type = "technology",
    name = "micro-assembly",
    icons = {
      {icon = "__base__/graphics/icons/arrows/down-left-arrow.png", icon_size = 64, shift = {64,-64}},
      {icon = "__base__/graphics/icons/arrows/down-right-arrow.png", icon_size = 64, shift = {-64,-64}},
      {icon = "__base__/graphics/icons/arrows/up-left-arrow.png", icon_size = 64, shift = {64,64}},
      {icon = "__base__/graphics/icons/arrows/up-right-arrow.png", icon_size = 64, shift = {-64,64}},
      {icon = "__base__/graphics/technology/automation-2.png", icon_size = 256, scale = 1.5},
    },
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "micro-assembler"
      },
    },
    prerequisites = {"mechatronic-components","contemplate-mind"},
    unit = {
      count = 72,
      ingredients = {
        {"introspection-science", 1},
        {"exploration-science", 1}
      },
      time = 16
    },
  },
  {--rocket propellant
    type = "technology",
    name = "rocket-propellant",
    icons = {
      {icon = "__space-age__/graphics/icons/fluid/thruster-fuel.png", icon_size = 64, shift = {64,0}},
      {icon = "__space-age__/graphics/icons/fluid/thruster-oxidizer.png", icon_size = 64, shift = {-64,0}},
    },
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "thruster-fuel"
      },
      {
        type = "unlock-recipe",
        recipe = "thruster-oxidizer"
      },
    },
    prerequisites = {"capacitors","micro-assembly"},
    unit = {
      count = 256,
      ingredients = {
        {"introspection-science", 1},
        {"exploration-science", 1}
      },
      time = 32
    },
  },
  {--rockets
    type = "technology",
    name = "rocketry",
    icon = "__base__/graphics/technology/rocket-silo.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "rocket-silo"
      },
      {
        type = "unlock-recipe",
        recipe = "rocket-part"
      },
    },
    prerequisites = {"rocket-propellant","mineral-concrete"},
    unit = {
      count = 512,
      ingredients = {
        {"introspection-science", 1},
        {"exploration-science", 1}
      },
      time = 32
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
    },
    prerequisites = {"rocketry"},
    unit = {
      count = 512,
      ingredients = {
        {"introspection-science", 1},
        {"exploration-science", 1}
      },
      time = 32
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
  {--energy monitoring
    type = "technology",
    name = "energy-monitoring",
    icon = "__base__/graphics/technology/discharge-defense-equipment.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "energy-monitor"
      },
    },
    prerequisites = {"energy-distribution-3","capacitors","combinators"},
    unit = {
      count = 256,
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
        recipe = "concrete"
      },
      {
        type = "unlock-recipe",
        recipe = "hazard-concrete"
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
        recipe = "fast-transport-belt"
      },
      {
        type = "unlock-recipe",
        recipe = "fast-underground-belt"
      },
      {
        type = "unlock-recipe",
        recipe = "fast-splitter"
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
    prerequisites = {"radars","exploration-science"},
    unit = {
      count = 128,
      ingredients = {
        {"introspection-science", 1},
        {"exploration-science", 1}
      },
      time = 24
    },
  },
  {--speed module
    type = "technology",
    name = "speed-module",
    icon = "__base__/graphics/technology/speed-module-3.png",
    icon_size = 256,
    localised_description = {"technology-description.speed-module-1"},
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "speed-module"
      },
    },
    prerequisites = {"contemplate-mind","mechatronic-components"},
    unit = {
      count = 196,
      ingredients = {
        {"introspection-science", 1},
        {"exploration-science", 1},
      },
      time = 32
    },
  },
  {--efficiency module
    type = "technology",
    name = "efficiency-module",
    icon = "__base__/graphics/technology/efficiency-module-3.png",
    icon_size = 256,
    localised_description = {"technology-description.efficiency-module-1"},
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "efficiency-module"
      },
    },
    prerequisites = {"contemplate-mind","mineral-lubricant"},
    unit = {
      count = 128,
      ingredients = {
        {"introspection-science", 1},
        {"exploration-science", 1},
      },
      time = 32
    },
  },
  {--Mineral glass singing
    type = "technology",
    name = "mineral-glass-singing",
    icons = {
      {icon = "__base__/graphics/icons/arrows/down-left-arrow.png", icon_size = 64, shift = {64,-64}},
      {icon = "__base__/graphics/icons/arrows/down-right-arrow.png", icon_size = 64, shift = {-64,-64}},
      {icon = "__base__/graphics/icons/arrows/up-left-arrow.png", icon_size = 64, shift = {64,64}},
      {icon = "__base__/graphics/icons/arrows/up-right-arrow.png", icon_size = 64, shift = {-64,64}},
      {icon = "__Krastorio2Assets__/icons/items/glass.png", icon_size = 64, scale = 2},
    },
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "mineral-glass-singing"
      },
    },
    prerequisites = {"micro-assembly"},
    unit = {
      count = 256,
      ingredients = {
        {"introspection-science", 1},
        {"exploration-science", 1}
      },
      time = 64
    },
  },
  {--Conductive coil anti winding
    type = "technology",
    name = "conductive-coil-anti-winding",
    icons = {
      {icon = "__base__/graphics/icons/arrows/down-left-arrow.png", icon_size = 64, shift = {64,-64}},
      {icon = "__base__/graphics/icons/arrows/down-right-arrow.png", icon_size = 64, shift = {-64,-64}},
      {icon = "__base__/graphics/icons/arrows/up-left-arrow.png", icon_size = 64, shift = {64,64}},
      {icon = "__base__/graphics/icons/arrows/up-right-arrow.png", icon_size = 64, shift = {-64,64}},
      {icon = "__TFMG-assets-0__/icons/items/conductive-coil.png", icon_size = 64, scale = 2},
    },
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "conductive-coil-anti-winding"
      },
    },
    prerequisites = {"micro-assembly"},
    unit = {
      count = 256,
      ingredients = {
        {"introspection-science", 1},
        {"exploration-science", 1}
      },
      time = 64
    },
  },
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
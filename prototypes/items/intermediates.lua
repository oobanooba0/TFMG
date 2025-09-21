local item_sounds = require("__base__.prototypes.item_sounds")
local space_age_item_sounds = require("__space-age__.prototypes.item_sounds")
local second = 60
local minute = 3600

--Intermediates
data:extend({
---Base intermediates (Things we make other intermediates out of)
  {
    type = "item",
    name = "ferric-plate",
    icon = "__base__/graphics/icons/iron-plate.png",
    subgroup = "basic-intermediates",
    order = "a[plates]-a[ferric-plate]",
    inventory_move_sound = item_sounds.metal_small_inventory_move,
    pick_sound = item_sounds.metal_small_inventory_pickup,
    drop_sound = item_sounds.metal_small_inventory_move,
    stack_size = 100,
    random_tint_color = item_tints.iron_rust,
  },
  {
    type = "item",
    name = "hot-mineral-plate",
    icons = {{ icon = "__Krastorio2Assets__/icons/items/glass.png", tint = {1, 0.6, 0.6, 1}}},
    subgroup = "basic-intermediates",
    order = "b[crystal-plates]-a[hot-mineral-plate]",
    inventory_move_sound = item_sounds.metal_small_inventory_move,
    pick_sound = item_sounds.metal_small_inventory_pickup,
    drop_sound = item_sounds.metal_small_inventory_move,
    stack_size = 100,
    spoil_result = "crystalline-plate",
    spoil_ticks = 60 * second
  },
  {
    type = "item",
    name = "crystalline-plate",
    icons = {{ icon = "__Krastorio2Assets__/icons/items/glass.png", tint = {0.6, 0.6, 1}}},
    subgroup = "basic-intermediates",
    order = "b[crystal-plates]-b[crystalline-plate]",
    inventory_move_sound = item_sounds.metal_small_inventory_move,
    pick_sound = item_sounds.metal_small_inventory_pickup,
    drop_sound = item_sounds.metal_small_inventory_move,
    stack_size = 100,
  },
  {
    type = "item",
    name = "mineral-glass",
    icons = {{ icon = "__Krastorio2Assets__/icons/items/glass.png", tint = {0.8, 1, 0.8}}},
    subgroup = "basic-intermediates",
    order = "b[crystal-plates]-c[crystalline-plate]",
    inventory_move_sound = item_sounds.metal_small_inventory_move,
    pick_sound = item_sounds.metal_small_inventory_pickup,
    drop_sound = item_sounds.metal_small_inventory_move,
    stack_size = 100,
  },
  {
    type = "item",
    name = "titanium-plate",
    icon = "__TFMG__/graphics/icons/titanium-plate.png",
    subgroup = "basic-intermediates",
    order = "c[titanium]-a[titanium-plate]",
    inventory_move_sound = item_sounds.metal_small_inventory_move,
    pick_sound = item_sounds.metal_small_inventory_pickup,
    drop_sound = item_sounds.metal_small_inventory_move,
    stack_size = 100,
  },
  {
    type = "item",
    name = "microbe-culture",
    icon = "__space-age__/graphics/icons/copper-bacteria.png",
    pictures =
    {
      { size = 64, filename = "__space-age__/graphics/icons/copper-bacteria.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__space-age__/graphics/icons/copper-bacteria-1.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__space-age__/graphics/icons/copper-bacteria-2.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__space-age__/graphics/icons/copper-bacteria-3.png", scale = 0.5, mipmap_count = 4 },
    },
    subgroup = "basic-intermediates",
    order = "d[polymers]-a[polymer]",
    inventory_move_sound = space_age_item_sounds.agriculture_inventory_move,
    pick_sound = space_age_item_sounds.agriculture_inventory_pickup,
    drop_sound = space_age_item_sounds.agriculture_inventory_move,
    stack_size = 100,
    default_import_location = "gleba",
    weight = 1 * kg,
    spoil_ticks = 1 * minute,
    spoil_result = "organic-carbon"
  },
  {
    type = "item",
    name = "organic-carbon",
    icons = {{icon = "__base__/graphics/icons/solid-fuel.png", tint = {0.5,1,0.5}}},
    subgroup = "basic-intermediates",
    order = "d[polymers]-bb[polymer]",
    inventory_move_sound = item_sounds.plastic_inventory_move,
    pick_sound = item_sounds.plastic_inventory_pickup,
    drop_sound = item_sounds.plastic_inventory_move,
    stack_size = 100,
    fuel_value = "10MJ",
    fuel_category = "chemical",
    fuel_acceleration_multiplier = 1,
    fuel_top_speed_multiplier = 1,
  },
  {
    type = "item",
    name = "active-bio-polymers",
    icons = {{icon = "__base__/graphics/icons/plastic-bar.png", tint = {0.5,1,0.5}}},
    subgroup = "basic-intermediates",
    order = "d[polymers]-b[polymer]",
    inventory_move_sound = item_sounds.plastic_inventory_move,
    pick_sound = item_sounds.plastic_inventory_pickup,
    drop_sound = item_sounds.plastic_inventory_move,
    stack_size = 100,
    random_tint_color = item_tints.plastic,
    spoil_result = "polymer",
    spoil_ticks = 60 * minute
  },
  {
    type = "item",
    name = "polymer",
    icon = "__base__/graphics/icons/plastic-bar.png",
    subgroup = "basic-intermediates",
    order = "d[polymers]-c[polymer]",
    inventory_move_sound = item_sounds.plastic_inventory_move,
    pick_sound = item_sounds.plastic_inventory_pickup,
    drop_sound = item_sounds.plastic_inventory_move,
    stack_size = 100,
    random_tint_color = item_tints.plastic,
  },
---structural intermediates (things which hold everything together)
    {--general purpose structure
    type = "item",
    name = "general-purpose-structure",
    icon = "__Krastorio2Assets__/icons/items/iron-beam.png",
    subgroup = "structural-intermediates",
    order = "a[general-purpose-structures]",
    inventory_move_sound = item_sounds.low_density_inventory_move,
    pick_sound = item_sounds.low_density_inventory_pickup,
    drop_sound = item_sounds.low_density_inventory_move,
    stack_size = 100,
    random_tint_color = item_tints.iron_rust
  },
  {--high performance structure
    type = "item",
    name = "high-performance-structure",
    icon = "__base__/graphics/icons/low-density-structure.png",
    subgroup = "structural-intermediates",
    order = "b[high-performacne-structures]",
    inventory_move_sound = item_sounds.low_density_inventory_move,
    pick_sound = item_sounds.low_density_inventory_pickup,
    drop_sound = item_sounds.low_density_inventory_move,
    stack_size = 50,
    random_tint_color = item_tints.iron_rust
  },
---mechanical intermediates (things that make other things move)
  {--mechanical components
    type = "item",
    name = "mechanical-components",
    icon = "__Krastorio2Assets__/icons/items/automation-core.png",
    subgroup = "mechanical-intermediates",
    order = "a",
    inventory_move_sound = item_sounds.metal_large_inventory_move,
    pick_sound = item_sounds.metal_large_inventory_pickup,
    drop_sound = item_sounds.metal_large_inventory_move,
    stack_size = 100,
    random_tint_color = item_tints.iron_rust
  },
  {--mechatronic components
    type = "item",
    name = "mechatronic-components",
    icons = {
      {icon = "__Krastorio2Assets__/icons/items/ai-core.png"},
      {icon = "__Krastorio2Assets__/icons/items/ai-core-light.png", draw_as_light = true,},
    },
    subgroup = "mechanical-intermediates",
    order = "b",
    inventory_move_sound = item_sounds.metal_large_inventory_move,
    pick_sound = item_sounds.metal_large_inventory_pickup,
    drop_sound = item_sounds.metal_large_inventory_move,
    stack_size = 100,
    random_tint_color = item_tints.iron_rust
  },
---Electonic intermediates (things that deal with electricity)
  {--Conductive Coil
    type = "item",
    name = "conductive-coil",
    icon = "__base__/graphics/icons/copper-cable.png",
    subgroup = "electronic-intermediates",
    order = "a[conductive-coil]",
    inventory_move_sound = item_sounds.electric_small_inventory_move,
    pick_sound = item_sounds.electric_small_inventory_pickup,
    drop_sound = item_sounds.electric_small_inventory_move,
    stack_size = 100,
  },
  {--modular circuit
    type = "item",
    name = "modular-circuit",
    icon = "__base__/graphics/icons/electronic-circuit.png",
    subgroup = "electronic-intermediates",
    order = "b[modular-circuit]",
    inventory_move_sound = item_sounds.electric_small_inventory_move,
    pick_sound = item_sounds.electric_small_inventory_pickup,
    drop_sound = item_sounds.electric_small_inventory_move,
    stack_size = 200,
  },
  {--Ai processor
    type = "item",
    name = "ai-processor",
    icon = "__space-age__/graphics/icons/quantum-processor.png",
    subgroup = "electronic-intermediates",
    order = "d[ai-processor]",
    inventory_move_sound = item_sounds.electric_small_inventory_move,
    pick_sound = item_sounds.electric_small_inventory_pickup,
    drop_sound = item_sounds.electric_small_inventory_move,
    stack_size = 100,
  },
---advanced intermediates. (things that are complex I guess. I will likely subdivide this futher)
  {
    type = "item",
    name = "spidertron-frame",
    icon = "__space-age__/graphics/icons/rocket-turret.png",
    subgroup = "advanced-intermediates",
    order = "b[spidertron]-a[Spidertron-frame]",
    inventory_move_sound = item_sounds.electric_small_inventory_move,
    pick_sound = item_sounds.electric_small_inventory_pickup,
    drop_sound = item_sounds.electric_small_inventory_move,
    stack_size = 5,
  },
  {
    type = "item",
    name = "mechanical-leg",
    icon = "__base__/graphics/icons/exoskeleton-equipment.png",
    subgroup = "advanced-intermediates",
    order = "b[spiderton]-b[mechanical-leg]",
    inventory_move_sound = item_sounds.electric_small_inventory_move,
    pick_sound = item_sounds.electric_small_inventory_pickup,
    drop_sound = item_sounds.electric_small_inventory_move,
    stack_size = 5,
    place_as_equipment_result = "mechanical-leg-equipment",
  },
})


data:extend({--debug items
  {
    type = "item",
    name = "kraken-uber-fuel",
    icon = "__base__/graphics/icons/nuclear-fuel.png",
    flags = {"hide-from-fuel-tooltip"},
    pictures =
    {
      layers =
      {
        {
          size = 64,
          filename = "__base__/graphics/icons/nuclear-fuel.png",
          scale = 0.5,
          mipmap_count = 4
        },
        {
          draw_as_light = true,
          size = 64,
          filename = "__base__/graphics/icons/nuclear-fuel-light.png",
          scale = 0.5
        }
      }
    },
    fuel_category = "chemical",
    fuel_value = "1000000000GJ",
    fuel_acceleration_multiplier = 10,
    fuel_top_speed_multiplier = 100,
    -- fuel_glow_color = {r = 0.1, g = 1, b = 0.1},
    subgroup = "uranium-processing",
    order = "r[uranium-processing]-e[nuclear-fuel]",
    inventory_move_sound = item_sounds.fuel_cell_inventory_move,
    pick_sound = item_sounds.fuel_cell_inventory_pickup,
    drop_sound = item_sounds.fuel_cell_inventory_move,
    stack_size = 100,
    weight = 100*kg,
    hidden = true,
    hidden_in_factoriopedia = true,
  },
})
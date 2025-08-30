local item_sounds = require("__base__.prototypes.item_sounds")

--Intermediates
data:extend({

---Base intermediates (Things we make other intermediates out of)
  {
    type = "item",
    name = "ferric-plate",
    icon = "__base__/graphics/icons/iron-plate.png",
    subgroup = "basic-intermediates",
    color_hint = { text = "I" },
    order = "a[plates]-a[ferric-plate]",
    inventory_move_sound = item_sounds.metal_small_inventory_move,
    pick_sound = item_sounds.metal_small_inventory_pickup,
    drop_sound = item_sounds.metal_small_inventory_move,
    stack_size = 100,
    random_tint_color = item_tints.iron_rust
  },

---structural intermediates (things which hold everything together)
    {--general purpose structure
    type = "item",
    name = "general-purpose-structure",
    icon = "__base__/graphics/icons/low-density-structure.png",
    subgroup = "structural-intermediates",
    color_hint = { text = "I" },
    order = "a[general-purpose-structure]",
    inventory_move_sound = item_sounds.low_density_inventory_move,
    pick_sound = item_sounds.low_density_inventory_pickup,
    drop_sound = item_sounds.low_density_inventory_move,
    stack_size = 100,
    random_tint_color = item_tints.iron_rust
  },
---mechanical intermediates (things that make other things move)
  {--mechanical components
    type = "item",
    name = "mechanical-components",
    icon = "__base__/graphics/icons/electric-engine-unit.png",
    subgroup = "mechanical-intermediates",
    order = "a[mechanical-components]",
    inventory_move_sound = item_sounds.metal_large_inventory_move,
    pick_sound = item_sounds.electric_large_inventory_pickup,
    drop_sound = item_sounds.metal_large_inventory_move,
    stack_size = 100,
    random_tint_color = item_tints.iron_rust
  },
---Electonic intermediates (things that deal with electricity)
  {--modular circuit
    type = "item",
    name = "modular-circuit",
    icon = "__base__/graphics/icons/electronic-circuit.png",
    subgroup = "electronic-intermediates",
    color_hint = { text = "1" },
    order = "a[modular-circuit]",
    inventory_move_sound = item_sounds.electric_small_inventory_move,
    pick_sound = item_sounds.electric_small_inventory_pickup,
    drop_sound = item_sounds.electric_small_inventory_move,
    stack_size = 200,
    ingredient_to_weight_coefficient = 0.28
  },
---advanced intermediates. (things that are complex i guess. I will likely subdivide this futher)
  {--Ai processor
    type = "item",
    name = "ai-processor",
    icon = "__space-age__/graphics/icons/quantum-processor.png",
    subgroup = "advanced-intermediates",
    color_hint = { text = "1" },
    order = "a[ai]-a[ai-processor]",
    inventory_move_sound = item_sounds.electric_small_inventory_move,
    pick_sound = item_sounds.electric_small_inventory_pickup,
    drop_sound = item_sounds.electric_small_inventory_move,
    stack_size = 100,
  },
  {
    type = "item",
    name = "spidertron-frame",
    icon = "__space-age__/graphics/icons/rocket-turret.png",
    subgroup = "advanced-intermediates",
    color_hint = { text = "1" },
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
    color_hint = { text = "1" },
    order = "b[spiderton]-b[mechanical-leg]",
    inventory_move_sound = item_sounds.electric_small_inventory_move,
    pick_sound = item_sounds.electric_small_inventory_pickup,
    drop_sound = item_sounds.electric_small_inventory_move,
    stack_size = 5,
  },
  {
    type = "item",
    name = "manipulation-tool",
    icon = "__base__/graphics/icons/personal-laser-defense-equipment.png",
    subgroup = "advanced-intermediates",
    color_hint = { text = "1" },
    order = "c[robotics]-a[manipulation-tool]",
    inventory_move_sound = item_sounds.electric_small_inventory_move,
    pick_sound = item_sounds.electric_small_inventory_pickup,
    drop_sound = item_sounds.electric_small_inventory_move,
    stack_size = 5,
  }
})

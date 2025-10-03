  data:extend({
    --ferric recipes
  {
    type = "recipe",
    name = "ferric-plate",
    category = "furnace",
    auto_recycle = false,
    energy_required = 1,
    enabled = false,
    ingredients = {{type = "item", name = "ferric-asteroid-chunk", amount = 1}},
    results = {{type="item", name="ferric-plate", amount=1}},
    allow_decomposition = false,
    allow_productivity = true,

  },
  {
    type = "recipe",
    name = "ferric-ore-smelting",
    category = "furnace",
    auto_recycle = false,
    energy_required = 2,
    enabled = false,
    ingredients = {{type = "item", name = "ferric-ore", amount = 2}},
    results = {{type="item", name="ferric-plate", amount=1}},
    allow_decomposition = false,
    allow_productivity = true,
  },
  {
    type = "recipe",
    name = "pure-iron-ore-smelting",
    category = "furnace",
    auto_recycle = false,
    energy_required = 6,
    enabled = false,
    ingredients = {{type = "item", name = "pure-iron-ore", amount = 3}},
    results = {{type="item", name="ferric-plate", amount=2}},
    allow_decomposition = false,
    allow_productivity = true,
  },
  --titanium recipes
  {
    type = "recipe",
    name = "titanium-ore-smelting",
    category = "furnace",
    auto_recycle = false,
    energy_required = 8,
    enabled = false,
    ingredients = {{type = "item", name = "titanium-ore", amount = 2}},
    results = {{type="item", name="titanium-plate", amount=1}},
    allow_decomposition = false,
    allow_productivity = true,
  },

  --mineral recipes
  {
    type = "recipe",
    name = "hot-mineral-plate",
    category = "furnace",
    auto_recycle = false,
    energy_required = 2,
    enabled = false,
    ingredients = {{type = "item", name = "crystalline-asteroid-chunk", amount = 1}},
    results = {{type="item", name="hot-mineral-plate", amount=1}},
    allow_decomposition = false,
    allow_productivity = true,
    result_is_always_fresh = true,
    surface_conditions = {{
      property = "gravity",
      min = 0,
      max = 0
    }}
  },
  {
    type = "recipe",
    name = "mineral-glass",
    category = "furnace",
    auto_recycle = false,
    energy_required = 2,
    enabled = false,
    ingredients = {{type = "item", name = "crystalline-asteroid-chunk", amount = 1}},
    results = {{type="item", name="mineral-glass", amount=1}},
    allow_decomposition = false,
    allow_productivity = true,
    surface_conditions = {{
      property = "gravity",
      min = 0.01,
    }}
  },
  {
    type = "recipe",
    name = "hot-mineral-plate-smelting",
    category = "furnace",
    auto_recycle = false,
    energy_required = 3,
    enabled = false,
    ingredients = {{type = "item", name = "mineral-ore", amount = 2}},
    results = {{type="item", name="hot-mineral-plate", amount=1}},
    allow_decomposition = false,
    allow_productivity = true,
    result_is_always_fresh = true,
    surface_conditions = {{
      property = "gravity",
      min = 0,
      max = 0
    }}
  },
  {
    type = "recipe",
    name = "mineral-glass-smelting",
    category = "furnace",
    auto_recycle = false,
    energy_required = 3,
    enabled = false,
    ingredients = {{type = "item", name = "mineral-ore", amount = 2}},
    results = {{type="item", name="mineral-glass", amount=1}},
    allow_decomposition = false,
    allow_productivity = true,
    surface_conditions = {{
      property = "gravity",
      min = 0.01,
    }}
  },
})
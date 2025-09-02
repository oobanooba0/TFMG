  data:extend({
  {
    type = "recipe",
    name = "ferric-plate",
    category = "furnace",
    auto_recycle = false,
    energy_required = 10,
    enabled = false,
    ingredients = {{type = "item", name = "ferric-asteroid-chunk", amount = 1}},
    results = {{type="item", name="ferric-plate", amount=10}},
    allow_productivity = true,
  },
  {
    type = "recipe",
    name = "hot-mineral-plate",
    category = "furnace",
    auto_recycle = false,
    energy_required = 20,
    enabled = false,
    ingredients = {{type = "item", name = "crystalline-asteroid-chunk", amount = 1}},
    results = {{type="item", name="hot-mineral-plate", amount=10}},
    allow_productivity = true,
    surface_conditions = {{
      property = "pressure",
      min = 0,
      max = 0
    }}
  },
  {
    type = "recipe",
    name = "mineral-glass",
    category = "furnace",
    auto_recycle = false,
    energy_required = 20,
    enabled = false,
    ingredients = {{type = "item", name = "crystalline-asteroid-chunk", amount = 1}},
    results = {{type="item", name="mineral-glass", amount=10}},
    allow_productivity = true,
  },
  })
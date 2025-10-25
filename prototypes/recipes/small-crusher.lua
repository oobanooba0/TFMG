data:extend({
  {
    type = "recipe",
    name = "ferric-chunk-crushing",
    icons ={
      {icon = "__space-age__/graphics/icons/metallic-asteroid-chunk.png"},
      {icon = "__Krastorio2Assets__/icons/recipes/crushing-overlay.png"},
    },
    category = "small-crusher",
    subgroup = "raw-materials",
    auto_recycle = false,
    energy_required = 4,
    enabled = false,
    allow_decomposition = false,
    allow_productivity = true,
    ingredients = {
      {type = "item", name = "ferric-asteroid-chunk", amount = 2}
    },
    results = {
      {type="item", name="ferric-ore", amount=5},
      {type="item", name="mineral-ore", amount=1},
    },
  },
  {
    type = "recipe",
    name = "crystalline-chunk-crushing",
    icons ={
      {icon = "__TFMG-assets-0__/icons/items/crystalline-chunk.png"},
      {icon = "__Krastorio2Assets__/icons/recipes/crushing-overlay.png"},
    },
    category = "small-crusher",
    subgroup = "raw-materials",
    auto_recycle = false,
    energy_required = 4,
    enabled = false,
    allow_decomposition = false,
    allow_productivity = true,
    ingredients = {
      {type = "item", name = "crystalline-asteroid-chunk", amount = 2}
    },
    results = {
      {type="item", name="mineral-ore", amount=5},
      {type="item", name="ferric-ore", amount=1},
    },
  },
})
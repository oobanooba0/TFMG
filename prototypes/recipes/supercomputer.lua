data:extend({
  {
    type = "recipe",
    category = "supercomputer",
    name = "introspection-science",
    energy_required = 5,
    enabled = false,
    ingredients = {
      { type = "item", name = "introspection-science-unverified", amount = 1},
    },
    results = {
      { type = "item", name = "introspection-science", amount = 1 },
    },
  },
  {
    type = "recipe",
    category = "supercomputer",
    name = "exploration-science",
    energy_required = 5,
    enabled = true,
    ingredients = {
      { type = "item", name = "exploration-science-unverified", amount = 2},
    },
    results = {
      { type = "item", name = "exploration-science", amount = 2 },
    },
  },
})
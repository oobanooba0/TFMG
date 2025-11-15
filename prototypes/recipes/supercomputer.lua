data:extend({
  {
    type = "recipe",
    category = "supercomputer",
    name = "introspection-science",
    --localised_name = {"recipe-name.introspection-science"},
    energy_required = 5,
    enabled = false,
    allow_productivity = false,
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
    --localised_name = {"recipe-name.exploration-science"},
    energy_required = 5,
    enabled = false,
    allow_productivity = false,
    ingredients = {
      { type = "item", name = "exploration-science-unverified", amount = 1 },
    },
    results = {
      { type = "item", name = "exploration-science", amount = 1 },
    },
  },
  {
    type = "recipe",
    category = "supercomputer",
    name = "exploitation-science",
    --localised_name = {"recipe-name.exploration-science"},
    energy_required = 5,
    enabled = false,
    allow_productivity = false,
    ingredients = {
      { type = "item", name = "exploitation-science-unverified", amount = 1 },
    },
    results = {
      { type = "item", name = "exploitation-science", amount = 1 },
    },
  },
})
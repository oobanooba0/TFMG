--remember to set recipe par times in the supercomputer.lua area.


data:extend({--lol
  {
    type = "recipe",
    category = "supercomputer",
    name = "introspection-science",
    custom_tooltip_fields = {{name = {"par-time.title"}, value = {"par-time.time","2"}}},
    energy_required = 5,
    enabled = false,
    allow_productivity = false,
    hide_from_bonus_gui = true,
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
    custom_tooltip_fields = {{name = {"par-time.title"}, value = {"par-time.time","12"}}},
    energy_required = 5,
    enabled = false,
    allow_productivity = false,
    hide_from_bonus_gui = true,
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
    custom_tooltip_fields = {{name = {"par-time.title"}, value = {"par-time.time","90"}}},
    energy_required = 5,
    enabled = false,
    allow_productivity = false,
    allowed_module_categories = {"efficiency"},
    hide_from_bonus_gui = true,
    ingredients = {
      { type = "item", name = "exploitation-science-unverified", amount = 4 },
    },
    results = {
      { type = "item", name = "exploitation-science", amount = 4 },
    },
  },
})
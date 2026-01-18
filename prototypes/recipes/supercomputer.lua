--remember to set recipe par times in the supercomputer.lua area.


data:extend({--lol
--introspection
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
    name = "introspection-science-easy",
    icon = "__TFMG-assets-0__/icons/recipes/introspection-science-easy.png",
    energy_required = 60,
    enabled = false,
    hidden = true,
    allow_productivity = false,
    hide_from_bonus_gui = true,
    ingredients = {
      { type = "item", name = "introspection-science-unverified", amount = 3},
    },
    results = {
      { type = "item", name = "introspection-science", amount = 2},
    },
  },
--exploration
  {
    type = "recipe",
    category = "supercomputer",
    name = "exploration-science",
    custom_tooltip_fields = {{name = {"par-time.title"}, value = {"par-time.time","90"}}},
    energy_required = 5,
    enabled = false,
    allow_productivity = false,
    hide_from_bonus_gui = true,
    ingredients = {
      { type = "item", name = "exploration-science-unverified", amount = 4 },
    },
    results = {
      { type = "item", name = "exploration-science", amount = 4 },
    },
  },
  {
    type = "recipe",
    category = "supercomputer",
    name = "exploration-science-easy",
    icon = "__TFMG-assets-0__/icons/recipes/exploration-science-easy.png",
    energy_required = 60,
    enabled = false,
    hidden = true,
    allow_productivity = false,
    hide_from_bonus_gui = true,
    ingredients = {
      { type = "item", name = "exploration-science-unverified", amount = 3 },
    },
    results = {
      { type = "item", name = "exploration-science", amount = 2 },
    },
  },
--exploitation
  {
    type = "recipe",
    category = "supercomputer",
    name = "exploitation-science",
    custom_tooltip_fields = {{name = {"par-time.title"}, value = {"par-time.time","12"}}},
    energy_required = 5,
    enabled = false,
    allow_productivity = false,
    hide_from_bonus_gui = true,
    ingredients = {
      { type = "item", name = "exploitation-science-unverified", amount = 1 },
    },
    results = {
      { type = "item", name = "exploitation-science", amount = 1 },
    },
  },
  {
    type = "recipe",
    category = "supercomputer",
    name = "exploitation-science-easy",
    icon = "__TFMG-assets-0__/icons/recipes/exploitation-science-easy.png",
    energy_required = 60,
    enabled = false,
    hidden = true,
    allow_productivity = false,
    hide_from_bonus_gui = true,
    ingredients = {
      { type = "item", name = "exploitation-science-unverified", amount = 3 },
    },
    results = {
      { type = "item", name = "exploitation-science", amount = 2 },
    },
  },
})

local recipe = data.raw.recipe

if settings.startup["enable-simple-science-verification"].value then
  recipe["introspection-science-easy"].hidden = false
  recipe["exploration-science-easy"].hidden = false
  recipe["exploitation-science-easy"].hidden = false
end
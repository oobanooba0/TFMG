local charger_power = 10

data:extend({
--remember that the charger uses 10MW of power, so each charging recipe crafting time must be set accordingly. If a charged item stores 10Mj of energy, it must take 1 second to craft.
--adding a multiplier can simulate inneficiency of energy storage.
  {
    type = "recipe",
    name = "capacitor-charged",
    category = "charger",
    auto_recycle = false,
    energy_required = 10/(charger_power*0.6),--60% efficient.
    enabled = false,
    ingredients = {{type = "item", name = "capacitor-discharged", amount = 1}},
    results = {{type="item", name="capacitor-charged", amount=1}},
    allow_decomposition = false,
    allow_productivity = false,
  },
---Crafting recipes
  {
    type = "recipe",
    name = "excited-crystalline-chunk-red",
    category = "charger",
    auto_recycle = false,
    energy_required = 16,
    enabled = false,
    ingredients = {{type = "item", name = "crystalline-asteroid-chunk", amount = 1}},
    results = {{type="item", name="excited-crystalline-chunk-red", amount=1}},
    allow_decomposition = false,
    allow_productivity = false,
  },
})
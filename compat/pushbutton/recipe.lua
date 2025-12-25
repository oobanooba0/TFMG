if not mods["pushbutton"] then
    return
end

data:extend({
  {--pushbutton
    type = "recipe",
    category = "assembling-machine",
    name = "pushbutton",
    energy_required = 4,
    enabled = false,
    ingredients = {
      { type = "item", name = "general-purpose-structure", amount = 2 },
      { type = "item", name = "modular-circuit", amount = 2 },
    },
    results = { 
      { type = "item", name = "pushbutton", amount = 1 }
    },
  },
})

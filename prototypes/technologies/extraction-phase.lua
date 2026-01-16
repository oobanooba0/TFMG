

data:extend({
  {--regolith sorting
    type = "technology",
    name = "regolith-sorting",
    icon = "__space-age__/graphics/technology/advanced-asteroid-processing.png",
    icon_size = 256,
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "regolith-sorting"
      },
      {
        type = "unlock-recipe",
        recipe = "regolith-crushing"
      },      
    },
    prerequisites = {"volatile-handling"},
    unit = {
      count = 512,
      ingredients = {
        {"introspection-science", 1},
        {"exploration-science", 1},
        {"exploitation-science", 1},
      },
      time = 32
    },
  },
})
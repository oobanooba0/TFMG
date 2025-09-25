---These techs that aren't mandatory for progression, or aren't really specific to any progression stage.
data:extend({
--victory tech
  {
    type = "technology",
    name = "victory",
    icon = ("__core__/graphics/icons/space-age.png"),
    icon_size = 64,
    effects = {},
    prerequisites = {"exploration-science"},
    unit =
    {
      count = 1024,
      ingredients =
      {
        {"introspection-science", 1},
        {"exploration-science", 1},
      },
      time = 32
    },
  },
  {
    type = "technology",
    name = "infinite-technology-1",
    icon = ("__base__/graphics/icons/signal/signal-speed.png"),
    icon_size = 64,
    effects = {},
    prerequisites = {"victory"},
    unit =
    {
      count_formula = "1000*(L)",
      ingredients =
      {
        {"introspection-science", 1},
        {"exploration-science", 1},
      },
      time = 64
    },
    max_level = "infinite",
    upgrade = true
  },
--inserter bonus

  {--inserter-capacity-bonus 1
    type = "technology",
    name = "inserter-capacity-bonus-1",
    icons = util.technology_icon_constant_stack_size("__base__/graphics/technology/inserter-capacity.png"),
    localised_name = {"technology-name.inserter-capacity-bonus-1"},
    localised_description = {"technology-description.inserter-capacity-bonus-1"},
    effects =
    {
      {
        type = "inserter-stack-size-bonus",
        modifier = 1
      },
    },
    research_trigger =
    {
      type = "craft-item",
      item = "inserter-1",
      count = 64
    },
    prerequisites = {"logistics-1"},
    upgrade = true
  },
})
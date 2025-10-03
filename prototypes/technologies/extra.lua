---These techs that aren't mandatory for progression, or aren't really specific to any progression stage.
data:extend({
--victory tech
  {
    type = "technology",
    name = "victory",
    icon = ("__core__/graphics/icons/space-age.png"),
    icon_size = 64,
    effects = {},
    essential = true,
    prerequisites = {"contemplate-mind"},
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
  {--inserter-capacity-bonus 2
    type = "technology",
    name = "inserter-capacity-bonus-2",
    icons = util.technology_icon_constant_stack_size("__base__/graphics/technology/inserter-capacity.png"),
    effects =
    {
      {
        type = "inserter-stack-size-bonus",
        modifier = 1
      },
    },
    prerequisites = {"inserter-capacity-bonus-1","introspection-science-pack"},
    unit = {
    count = 256,
    ingredients = {
      {"introspection-science", 1}
      },
    time = 24
    },
    upgrade = true
  },
  {--inserter-capacity-bonus 3
    type = "technology",
    name = "inserter-capacity-bonus-3",
    icons = util.technology_icon_constant_stack_size("__base__/graphics/technology/inserter-capacity.png"),
    effects =
    {
      {
        type = "inserter-stack-size-bonus",
        modifier = 1
      },
    },
    prerequisites = {"inserter-capacity-bonus-2","exploration-science"},
    unit = {
    count = 512,
    ingredients = {
      {"introspection-science", 1},
      {"exploration-science", 1}
      },
    time = 32
    },
    upgrade = true
  },
--robot
---robot speed
  {--robot speed 1
    type = "technology",
    name = "robot-speed-1",
    icons = util.technology_icon_constant_movement_speed("__base__/graphics/technology/worker-robots-speed.png"),
    effects =
    {
      {
        type = "worker-robot-speed",
        modifier = 0.35
      }
    },
    prerequisites = {"basic-bots"},
    unit = {
    count = 256,
    ingredients = {
      {"introspection-science", 1},
      },
    time = 24
    },
    upgrade = true
  },
  {--robot speed 2
    type = "technology",
    name = "robot-speed-2",
    icons = util.technology_icon_constant_movement_speed("__base__/graphics/technology/worker-robots-speed.png"),
    effects =
    {
      {
        type = "worker-robot-speed",
        modifier = 0.35
      }
    },
    prerequisites = {"robot-speed-1","exploration-science"},
    unit = {
    count = 512,
    ingredients = {
      {"introspection-science", 1},
      {"exploration-science", 1},
      },
    time = 32
    },
    upgrade = true
  },
---robot capacity
  {--robot capacity 1
    type = "technology",
    name = "robot-capacity-1",
    icons = util.technology_icon_constant_capacity("__base__/graphics/technology/worker-robots-storage.png"),
    effects =
    {
      {
        type = "worker-robot-storage",
        modifier = 1
      }
    },
    prerequisites = {"basic-bots","exploration-science"},
    unit = {
    count = 256,
    ingredients = {
      {"introspection-science", 1},
      {"exploration-science", 1},
      },
    time = 24
    },
    upgrade = true
  },
})
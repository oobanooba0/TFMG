data:extend({
  {--small radiator
    type = "heat-interface",
    name = "small-radiator",
    icon = "__base__/graphics/icons/heat-interface.png",
    flags = {"placeable-neutral", "player-creation", "placeable-player"},
    minable = {mining_time = 0.1, result = "small-radiator"},
    max_health = 150,
    corpse = "small-remnants",
    collision_box = {{-0.7, -0.8}, {0.7, 0.7}},--yall i have no idea how to visualise what this means. Like, i know, but like, visualising the effect is hard.
    selection_box = {{-1, -1}, {1, 1}},
    gui_mode = "none", -- all, none, admins
    surface_conditions = {{
        property = "pressure",
        min = 0,
        max = 0
        }},
    tile_buildability_rules =
    {
      {area = {{-1, -0}, {1, 1}}, required_tiles = {layers = {ground_tile = true}}, colliding_tiles = {layers = {empty_space = true}}, remove_on_collision = true},
      {area = {{-1, -4}, {1, -1}}, required_tiles = {layers = {empty_space = true}}, remove_on_collision = true},
    },
    heat_buffer =
    {
      max_temperature = 1000,
      specific_heat = "10MJ",
      max_transfer = "10GW",
      default_temperature = 0,
      min_working_temperature = 0,
      connections =
      {
        {
          position = {0, -1},
          direction = defines.direction.north
        },
        {
          position = {1, 0},
          direction = defines.direction.east
        },
        {
          position = {0, 1},
          direction = defines.direction.south
        },
        {
          position = {-1, 0},
          direction = defines.direction.west
        },
      }
    },
    picture =
    {
      filename = "__base__/graphics/icons/heat-interface.png",
      height = 64,
      width = 64,
      scale = 1,
      flags = {"no-crop"},
      tint = {0.7, 0.7, 1, 1},
    }
  },
})
--vanilla thruster changes.
local thruster = data.raw["thruster"]["thruster"]
  thruster.TFMG_thermal = {
    connections = {
      { position = {-1.5, -2}, direction = 0},
      { position = {1.5, -2}, direction = 0},
      { position = {1.5, -1}, direction = 4},
      { position = {-1.5, -1}, direction = 12},
    },
    heat_per_unit_fluid = "250kJ",
  }
  thruster.min_performance = {fluid_volume = 0.1, fluid_usage = 0.1, effectivity = 1}
  thruster.max_performance = {fluid_volume = 0.8, fluid_usage = 2, effectivity = 0.5}
  thruster.fuel_fluid_box = {
      filter = "thruster-fuel",
      production_type = "input",
      -- pipe_covers = pipecoverspictures(),
      draw_only_when_connected = true,
      volume = 1000,
      pipe_connections =
      {
        {
          flow_direction = "input-output",
          direction = defines.direction.west,
          position = {-1.5, -2},
          enable_working_visualisations = { "pipe-4" },
          connection_category = "unpipe",
          max_underground_distance = 1,
          connection_type = "underground",
        },
        {
          flow_direction = "input-output",
          direction = defines.direction.east,
          position = { 1.5,  0},
          enable_working_visualisations = { "pipe-2" },
          connection_category = "unpipe",
          max_underground_distance = 1,
          connection_type = "underground",
        },
      }
    }
  thruster.oxidizer_fluid_box =
    {
      filter = "thruster-oxidizer",
      production_type = "input",
      -- pipe_covers = pipecoverspictures(),
      draw_only_when_connected = true,
      volume = 1000,
      pipe_connections =
      {
        {
          flow_direction = "input-output",
          direction = defines.direction.east,
          position = { 1.5, -2},
          enable_working_visualisations = { "pipe-1" },
          connection_category = "unpipe",
          max_underground_distance = 1,
          connection_type = "underground",
        },
        {
          flow_direction = "input-output",
          direction = defines.direction.west,
          position = {-1.5,  0},
          enable_working_visualisations = { "pipe-3" },
          connection_category = "unpipe",
          max_underground_distance = 1,
          connection_type = "underground",
        },
      }
    }
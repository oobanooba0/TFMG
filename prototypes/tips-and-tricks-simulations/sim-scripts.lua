local simulations = {}

local mods = {"TFMG","TFMG-thermal","TFMG-platform-docking","visible-planets"}
local game_view_settings = {
  show_entity_info = true,
}

--thermal system
  simulations.thermal_system_basics = {
    save = "__TFMG-simulations__/tips-and-tricks-simulations/thermal-system-basics.zip",
    mods = mods,
    init = [[
      game.simulation.camera_alt_info = true
      game.simulation.camera_surface_index = game.surfaces["platform-1"].index
      game.simulation.camera_position = {0,-4}
      game.simulation.camera_zoom = 1.5
      game.tick_paused = false
    ]],
    hide_health_bars = false,
    game_view_settings = game_view_settings,
  }
  simulations.thermal_system_damage = {
    save = "__TFMG-simulations__/tips-and-tricks-simulations/thermal-system-damage.zip",
    mods = mods,
    init = [[
      game.simulation.camera_alt_info = true
      game.simulation.camera_surface_index = game.surfaces["platform-1"].index
      game.simulation.camera_position = {0,-4}
      game.simulation.camera_zoom = 1.5
      game.tick_paused = false
    ]],
    hide_health_bars = false,
    game_view_settings = game_view_settings,
  }

return simulations
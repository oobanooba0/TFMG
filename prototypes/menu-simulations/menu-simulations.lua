local menu_sims = data.raw["utility-constants"]["default"].main_menu_simulations


local make_simulation = function(duration, planet, filename, zoom, volume, script)
  return
  {
    checkboard = false,
    save = "__TFMG-simulations__/menu-simulations/" .. filename,
    length = duration*60,
    volume_modifier = volume,
    mods = {},--normally "TFMG" but the stuff inside aint working rn.
    init =
    [[
      local sim_planet = game.surfaces["]] .. planet .. [["]
      local logo = sim_planet.find_entities_filtered{name = "factorio-logo-11tiles", limit = 1}[1]
      logo.destructible = false
      local center = {logo.position.x, logo.position.y+]]..9.75/zoom..[[}
      game.simulation.camera_surface_index = sim_planet.index
      game.simulation.camera_position = center
      game.simulation.camera_zoom = ]]..zoom..[[
      game.tick_paused = false
    ]]
    ..
    script
  }
end

local timeline_tools =
  [[
    local tick = 0
    local on_tick = function() end
    script.on_nth_tick(1,
      function()
        tick = tick + 1
        on_tick()
      end)
  ]]




--note that the leading part is handle
--menu_sims.platform_1 = make_simulation(20, "platform-1", "platform-1.zip", 1, 0.5, [[]])
menu_sims.arrival_1 = make_simulation(20, "arrival", "arrival-1.zip", 1, 1, [[]])
local menu_sims = data.raw["utility-constants"]["default"].main_menu_simulations

--local mod_scripts = {"TFMG","TFMG-Thermal","TFMG-platform-docking","visible-planets"}

--if mods["visible-planets"] then --if we have visible planets active, load that too.
--  table.insert(mod_scripts,"visible-planets")
--end


local make_simulation = function(duration, planet, filename, zoom, volume, script)
  return
  {
    game_view_settings = {
      default_show_value = false,
    },
    checkboard = false,
    save = "__TFMG-simulations__/menu-simulations/" .. filename,
    length = duration*60,
    volume_modifier = volume,
    mods = {"TFMG","TFMG-thermal","TFMG-platform-docking","visible-planets"},--normally "TFMG" but the stuff inside aint working rn.
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
--seconds, surface, file, zoom, volume, script

menu_sims.platform_1 = make_simulation(30, "platform-1", "platform-1.zip", 0.7, 0.7, [[]])
menu_sims.arrival_1 = make_simulation(30, "nauvis", "arrival-1.zip", 0.7, 0.7, [[]])
menu_sims.arrival_2 = make_simulation(45, "nauvis", "arrival-2.zip", 0.7, 0.7, [[]])
menu_sims.arrival_3 = make_simulation(30, "nauvis", "arrival-3.zip", 0.7, 0.7, [[]])
menu_sims.arrival_4 = make_simulation(30, "nauvis", "arrival-4.zip", 0.7, 0.7, [[]])
local planet_map_gen = require("__TFMG__.prototypes.planet.planet_map_gen")
local asteroid_util = require("__TFMG__.prototypes.planet.asteroid-spawn-definitions")
local effects = require("__core__/lualib/surface-render-parameter-effects")
local procession_graphic_catalogue_types = require("__base__/prototypes/planet/procession-graphic-catalogue-types")
data:extend({--surface properties
    {
    type = "surface-property",
    name = "spacetime-flow-viscosity",
    default_value = 1
  },
--planets
  {
    type = "planet",
    name = "nauvis",
    icon = "__TFMG-assets-0__/icons/planets/arrival.png",
    starmap_icon = "__TFMG-assets-0__/icons/planets/arrival-starmap.png",
    starmap_icon_size = 512,
    gravity_pull = 10,
    distance = 100,
    orientation = 0.275,
    magnitude = 1,
    order = "a[arrival]",
    subgroup = "planets",
    map_seed_offset = 0,
    map_gen_settings = planet_map_gen.arrival(),
    pollutant_type = "tremors",
    solar_power_in_space = 100,
    planet_procession_set =
    {
      arrival = {"default-b"},
      departure = {"default-rocket-a"}
    },
    surface_properties =
    {
      ["day-night-cycle"] = 85 * minute,
      ["solar-power"] = 10,
      pressure = 135,
      gravity = 1.35,
    },
    surface_render_parameters =
    {
      clouds = effects.default_clouds_effect_properties(),
    },
    --Asteroid code
    asteroid_spawn_influence = 1,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.arrival_near_void, 0.1),
    persistent_ambient_sounds =
    {
      base_ambience = {filename = "__space-age__/sound/wind/base-wind-aquilo.ogg", volume = 0.5},
      wind = {filename = "__space-age__/sound/wind/wind-aquilo.ogg", volume = 0.8},
      crossfade =
      {
        order = {"wind", "base_ambience"},
        curve_type = "cosine",
        from = {control = 0.35, volume_percentage = 0.0},
        to = {control = 2, volume_percentage = 100.0}
      },
      semi_persistent =
      {
        {
          sound =
          {
            variations = sound_variations("__space-age__/sound/world/semi-persistent/ice-cracks", 5, 0.7),
            advanced_volume_control =
            {
              fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {2, 100.0}}}
            }
          },
          delay_mean_seconds = 10,
          delay_variance_seconds = 5
        },
        {
          sound = {variations = sound_variations("__space-age__/sound/world/semi-persistent/cold-wind-gust", 5, 0.3)},
          delay_mean_seconds = 15,
          delay_variance_seconds = 9
        }
      }
    },
    procession_graphic_catalogue =
    {
      {
        index = procession_graphic_catalogue_types.planet_hatch_emission_in_1,
        sprite = util.sprite_load("__base__/graphics/entity/cargo-hubs/hatches/planet-lower-hatch-pod-emission-A",
        {
          priority = "medium",
          draw_as_glow = true,
          blend_mode = "additive",
          scale = 0.5,
          shift = util.by_pixel(-16, 96) --32 x ({0.5, -3.5} + {0, 0.5})
        })
      },
      {
        index = procession_graphic_catalogue_types.planet_hatch_emission_in_2,
        sprite = util.sprite_load("__base__/graphics/entity/cargo-hubs/hatches/planet-lower-hatch-pod-emission-B",
        {
          priority = "medium",
          draw_as_glow = true,
          blend_mode = "additive",
          scale = 0.5,
          shift = util.by_pixel(-64, 96) --32 x ({2, -3.5} + {0, 0.5})
        })
      },
      {
        index = procession_graphic_catalogue_types.planet_hatch_emission_in_3,
        sprite = util.sprite_load("__base__/graphics/entity/cargo-hubs/hatches/planet-lower-hatch-pod-emission-C",
        {
          priority = "medium",
          draw_as_glow = true,
          blend_mode = "additive",
          scale = 0.5,
          shift = util.by_pixel(-40, 64) --32 x ({1.25, -2.5} + {0, 0.5})
        })
      }
    }
  },
--space locations
  {
    type = "space-location",
    name = "near-void",
    icon = "__core__/graphics/entity-info-dark-background.png",
    icon_size = 53,
    order = "b[near-void]",
    subgroup = "planets",
    draw_orbit = false,
    gravity_pull = 0,
    distance = 100,
    orientation = 0.45,
    magnitude = 1.0,
    label_orientation = 0.15,
    asteroid_spawn_influence = 0.9,
    solar_power_in_space = 0,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.arrival_near_void, 0.9),
    hidden = true,
    hidden_in_factoriopedia = true,
  },
--connections
  {
    type = "space-connection",
    name = "nauvis-near-void",
    subgroup = "planet-connections",
    from = "nauvis",
    to = "near-void",
    order = "a",
    length = 10000000,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.arrival_near_void),
    hidden = true,
    --hidden_in_factoriopedia = true,
  },
--pollution types
  {
    type = "airborne-pollutant",
    name = "tremors",
    chart_color = {r = 140, g = 50, b = 0, a = 149},
    icon =
    {
      filename = "__core__/graphics/icons/mip/side-map-menu-buttons.png",
      priority = "high",
      size = 64,
      mipmap_count = 2,
      y = 3 * 64,
      flags = {"gui-icon"}
    },
    affects_evolution = true,
    affects_water_tint = true,
  }
})
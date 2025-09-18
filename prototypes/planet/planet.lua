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
})

data:extend({
  {
    type = "planet",
    name = "arrival",
    icon = "__base__/graphics/icons/nauvis.png",
    starmap_icon = "__base__/graphics/icons/starmap-planet-nauvis.png",
    starmap_icon_size = 512,
    gravity_pull = 10,
    distance = 20,
    orientation = 0.275,
    magnitude = 1,
    order = "a[arrival]",
    subgroup = "planets",
    map_seed_offset = 0,
    map_gen_settings = planet_map_gen.arrival(),
    pollutant_type = nil,
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
      pressure = 2,
      gravity = 1.35,
    },
    surface_render_parameters =
    {
      clouds = effects.default_clouds_effect_properties()
    },
    --Asteroid code
    asteroid_spawn_influence = 1,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.arrival_arrival, 0.1),
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
  }
})
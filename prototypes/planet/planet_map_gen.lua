local planet_map_gen = {}

planet_map_gen.arrival = function()
  return
  {
    property_expression_names =
    {
      elevation = "arrival_elevation",
      cliffiness = "cliffiness_basic",
      cliff_elevation = "cliff_elevation_from_elevation",
      ["entity:ferric-ore:probability"] = "ferric_ore_probability",
      ["entity:ferric-ore:richness"] = "ferric_ore_richness",
      ["entity:mineral-ore:probability"] = "mineral_ore_probability",
      ["entity:mineral-ore:richness"] = "mineral_ore_richness",
      ["entity:ice-geysir:probability"] = "ice_geysir_probability",
      ["entity:ice-geysir:richness"] = "ice_geysir_richness",
    },
    cliff_settings =
    {
      name = "cliff",
      cliff_elevation_interval = 1000,
      cliff_elevation_0 = 150,
      cliff_smoothing = 0,
      richness = 1
    },
    autoplace_controls =
    {
      ["ferric_ore"] = {},
      ["mineral_ore"] = {},
      ["ice_geysir"] = {},
    },
    autoplace_settings =
    {
      ["tile"] =
      {
        settings =
        {
          ["dust-flat"] = {},
          ["dust-crests"] = {},
          ["dust-patchy"] = {},
          ["dust-lumpy"] = {},
          ["fulgoran-dunes"] = {},
          ["fulgoran-dust"] = {},
          ["fulgoran-sand"] = {},
          ["fulgoran-rock"] = {},
          ["ice-smooth"] = {},
        }
      },
      ["decorative"] =
      {
        settings =
        {
          ["vulcanus-dune-decal"] = {},
          ["calcite-stain"] = {},
          ["calcite-stain-small"] = {},
          ["crater-small"] = {},
          ["crater-large"] = {},
          ["pumice-relief-decal"] = {},
          ["small-volcanic-rock"] = {},
          ["waves-decal"] = {},
          ["medium-fulgora-rock"] = {},
          ["small-fulgora-rock"] = {},
          ["tiny-fulgora-rock"] = {},

        }
      },
      ["entity"] =
      {
        settings =
        {
          ["ferric-ore"] = {},
          ["mineral-ore"] = {},
          ["ice-geysir"] = {},
          ["small-ice-worm"] = {},
          ["medium-ice-worm"] = {},
          ["big-ice-worm"] = {}
        }
      }
    }
  }
end

return planet_map_gen
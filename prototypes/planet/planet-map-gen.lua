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
      ["entity:ice-geyser:probability"] = "ice_geyser_probability",
      ["entity:ice-geyser:richness"] = "ice_geyser_richness",
    },
    cliff_settings =
    {
      name = "cliff",
      cliff_elevation_interval = 2000,
      cliff_elevation_0 = 150,
      cliff_smoothing = 0,
      richness = 1
    },
    autoplace_controls =
    {
      ["ferric_ore"] = {},
      ["mineral_ore"] = {},
      ["ice_geyser"] = {},
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
          ["ice-geyser"] = {},
          ["small-ice-worm"] = {},
          ["medium-ice-worm"] = {},
          ["big-ice-worm"] = {}
        }
      }
    }
  }
end

planet_map_gen.extraction = function()
  return
  {
    property_expression_names =
    {
      ["entity:regolith:probability"] = "regolith_probability",
      ["entity:regolith:richness"] = "regolith_richness",


      elevation = "extraction_cliff_craters",
      cliffiness = "cliffiness_basic",
      cliff_elevation = "cliff_elevation_from_elevation",
      ["tile:empty-space"] = "extraction_empty_space",
      ["tile:dust-flat:probability"] = "extraction_dust_flat",
      ["tile:dust-patchy:probability"] = "extraction_dust_patchy",
      ["tile:dust-crests:probability"] = "extraction_dust_crests",
      ["tile:dust-lumpy:probability"] = "extraction_dust_lumpy",
      ["tile:dust-crater:probability"] = "extraction_dust_crater",
    },
    cliff_settings =
    {
      name = "cliff-vulcanus",
      cliff_elevation_interval = 100,
      cliff_elevation_0 = 9.6,
      cliff_smoothing = 0,
      richness = 100
    },
    autoplace_controls =
    {
      ["regolith"] = {},
    },
    autoplace_settings =
    {
      ["tile"] =
      {
        settings =
        {
          ["empty-space"] = {},
          ["dust-flat"] = {},
          ["dust-patchy"] = {},
          ["dust-crests"] = {},
          ["dust-lumpy"] = {},
          ["dust-crater"] = {},
        }
      },
      ["decorative"] =
      {
        settings =
        {
          ["vulcanus-dune-decal"] = {},
          ["crater-small"] = {},
          ["crater-large"] = {},
          ["pumice-relief-decal"] = {},
          ["waves-decal"] = {},
        }
      },
      ["entity"] =
      {
        settings =
        {
          ["regolith"] = {},
        }
      }
    }
  }
end

return planet_map_gen
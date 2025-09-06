local planet_map_gen = {}

planet_map_gen.arrival = function()
  return
  {
    autoplace_controls =
    {
      ["ice_ore"] = {},
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
          --["snow-flat"] = {},
          --["snow-crests"] = {},
          --["snow-lumpy"] = {},
          --["snow-patchy"] = {},
        }
      },
      ["decorative"] =
      {
        settings =
        {
          --["vulcanus-rock-decal-large"] = {},
          --["vulcanus-crack-decal-large"] = {},
          ["vulcanus-dune-decal"] = {},
          --["vulcanus-sand-decal"] = {},
          ["calcite-stain"] = {},
          ["calcite-stain-small"] = {},
          ["crater-small"] = {},
          ["crater-large"] = {},
          ["pumice-relief-decal"] = {},
          ["small-volcanic-rock"] = {},
          --["medium-volcanic-rock"] = {},
          --["tiny-volcanic-rock"] = {},
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
          ["ice-ore"] = {},
        }
      }
    }
  }
end

return planet_map_gen
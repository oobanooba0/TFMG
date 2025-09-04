local planet_map_gen = {}

planet_map_gen.arrival = function()
  return
  {
    autoplace_settings =
    {
      ["tile"] =
      {
        settings =
        {
          --["volcanic-ash-cracks"] = {},
          --["volcanic-ash-dark"] = {},
          --["volcanic-ash-light"] = {},
          --["volcanic-ash-soil"] = {},
          --["volcanic-pumice-stones"] = {},
          --["dust-flat"] = {},
          --["dust-crests"] = {},
          --["dust-patchy"] = {},
          ["dust-lumpy"] = {},
          ["fulgoran-dust"] = {},
          --["fulgoran-dunes"] = {},
          --["fulgoran-sand"] = {},
          --["snow-flat"] = {},
          --["snow-crests"] = {},
          --["snow-lumpy"] = {},
          --["snow-patchy"] = {},
          --["fulgoran-rock"] = {},
        }
      },
    }
  }
end

return planet_map_gen
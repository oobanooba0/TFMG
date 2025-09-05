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
          ["dust-flat"] = {},
          ["dust-crests"] = {},
          --["dust-patchy"] = {},
          --["dust-lumpy"] = {},
          --["fulgoran-dunes"] = {},
          --["fulgoran-sand"] = {},
          --["fulgoran-rock"] = {},
          ["fulgoran-dust"] = {},
          --["snow-flat"] = {},
          --["snow-crests"] = {},
          --["snow-lumpy"] = {},
          --["snow-patchy"] = {},
        }
      },
    }
  }
end

return planet_map_gen
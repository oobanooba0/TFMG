--Thanks to SafTheLamb + S6X, Via "studying (plagerising) your code, I managed to kind of get an idea of how any of this works"

local asteroid_sizes = {"chunk", "small", "medium", "big", "huge"}
local shared_resistances =
{
  physical =
  {
    decrease = {0, 0, 0, 2000, 3000},
    percent = {0, 0, 10, 10, 10}
  },
  explosion =
  {
    decrease = {0, 0, 0, 0, 0},
    percent = {0, 50, 30, 10, 99}
  },
  laser =
  {
    decrease = {0, 0, 0, 0, 0},
    percent = {0, 20, 90, 95, 99}
  }
}
local shared_health = {0, 100, 400, 2000, 5000}
local shared_mass = {0, 200000, 500000, 5000000, 100000000}
local asteroids_data =
{
  ferric =
  {
    order = "a",
    mass = shared_mass,
    max_health = shared_health,
    resistances = shared_resistances,
    shading_data = {
      normal_strength = 1.2,
      light_width = 0,
      brightness = 0.9,
      specular_strength = 2,
      specular_power = 2,
      specular_purity = 0,
      sss_contrast = 1,
      sss_amount = 0,
      lights = {
        { color = {0.96,1,0.99}, direction = {0.7,0.6,-1} },
        { color = {0.57,0.33,0.23}, direction = {-0.72,-0.46,1} },
        { color = {0.1,0.1,0.1}, direction = {-0.4,-0.25,-0.5} },
      },
      ambient_light = {0.01, 0.01, 0.01},
    }
  },
  crystalline =
  {
    order = "b",
    mass = shared_mass,
    max_health = shared_health,
    resistances = shared_resistances,
    shading_data =
    {
      normal_strength = 1.2,
      light_width = 0.3,
      brightness = 0.3,
      specular_strength = 2.5,
      specular_power = 1.5,
      specular_purity = 0.1,
      sss_contrast = 0,
      sss_amount = 0.15,
      lights = {
        { color = {1,1,1}, direction = {0.75,0.22,-1} },
        { color = {0.2,0,0}, direction = {0.5, 0, 0.95} },
      },
      ambient_light = {0.0, 0.0, 0.0},
    }
  },
}

local collision_radiuses =
{
  0.4, -- chunk
  0.5, -- small
  1, -- medium
  2, -- big
  4.5  -- huge
}

local graphics_scale =
{
  0.5, -- chunk
  0.5, -- small
  0.5, -- medium
  0.6, -- big
  0.75 -- huge
}

local sizes_resolution = {
  {50,1}, -- chunk
  {128,1}, -- small
  {230,0}, -- medium
  {304,6}, -- big
  {512,0} -- huge
}

local letter = {"a","b","c","d","e"}

local function asteroid_variation(asteroid_type, suffix, scale, size)
  return
  {
    color_texture =
    {
      filename = "__TFMG-assets-0__/entity/asteroid/".. asteroid_type .."/"..asteroid_sizes[size].."/".."asteroid-" .. asteroid_type .. "-" .. asteroid_sizes[size] .. "-colour-" .. suffix .. ".png",
      size =  sizes_resolution[size][1],
      scale = scale
    },

    shadow_shift = { 0.25 * size, 0.25 * size },

    normal_map =
    {
      filename = "__TFMG-assets-0__/entity/asteroid/".. asteroid_type .."/"..asteroid_sizes[size].."/".."asteroid-" .. asteroid_type .. "-" .. asteroid_sizes[size] .. "-normal-" .. suffix .. ".png",
      premul_alpha = false,
      size = sizes_resolution[size][1],
      scale = scale
    },

    roughness_map =
    {
      filename = "__TFMG-assets-0__/entity/asteroid/".. asteroid_type .."/"..asteroid_sizes[size].."/".."asteroid-" .. asteroid_type .. "-" .. asteroid_sizes[size] .. "-roughness-" .. suffix .. ".png",
      premul_alpha = false,
      size = sizes_resolution[size][1],
      scale = scale
    }
  }
end

local function asteroid_graphics_set(rotation_speed, shading_data, variations)
  local result = table.deepcopy(shading_data)
  result.rotation_speed = rotation_speed
  result.variations = variations
  return result
end

for asteroid_size, asteroid_size_name in pairs(asteroid_sizes) do
  for asteroid_type, asteroid_data in pairs(asteroids_data) do

    local graphics_scale = graphics_scale[asteroid_size]
    local collision_radius = collision_radiuses[asteroid_size]
    local selection_radius = collision_radius * 1.1 + 0.1
    local max_health = asteroid_data.max_health[asteroid_size] > 0 and asteroid_data.max_health[asteroid_size] or nil
    local asteroid_name, resistances, factoriopedia_sim
    local dying_trigger_effects = {
      {
        type = asteroid_size_name == "chunk" and "create-entity" or "create-explosion",
        entity_name = asteroid_type.."-asteroid-explosion-"..asteroid_size,
      }
    }

    if asteroid_size_name == "chunk" then
      asteroid_name = asteroid_type .. "-asteroid-chunk"
    else
      asteroid_name = asteroid_size_name .. "-"..asteroid_type.."-asteroid"
      --factoriopedia_sim = simulations["factoriopedia_" .. asteroid_size_name .. "_" .. asteroid_type .. "_asteroid"]
      local spread = collision_radius * 0.5

      if asteroid_size == 2 then
        table.insert(dying_trigger_effects,
        {
          type = "create-asteroid-chunk",
          asteroid_name = asteroid_type.."-asteroid-chunk",
          offset_deviation = {{-spread, -spread}, {spread, spread}},
          offsets =
          {
            {-spread/2, -spread/4},
            {spread/2, -spread/4}
          }
        })
      else
        table.insert(dying_trigger_effects,
        {
          type = "create-entity",
          entity_name = asteroid_sizes[asteroid_size-1] .. "-"..asteroid_type.."-asteroid",
          offset_deviation = {{-spread, -spread}, {spread, spread}},
          offsets =
          {
            {-spread, -spread/4},
            {0, -spread/2},
            {spread, -spread/4}
          }
        })
      end

      resistances = {}
      for damage_name, damage_type in pairs(data.raw["damage-type"]) do
        if asteroid_data.resistances[damage_name] then
          table.insert(resistances,
          {
            type = damage_name,
            decrease = asteroid_data.resistances[damage_name].decrease[asteroid_size],
            percent = asteroid_data.resistances[damage_name].percent[asteroid_size]
          })
        else
          if damage_name ~= "impact" and damage_name ~= "poison" and damage_name ~= "acid" then
            table.insert(resistances,
            {
              type = damage_name,
              percent = 100
            })
          end
        end
      end
    end


    local variations ={}
    if (asteroid_type == "ferric") then
      if (asteroid_size_name == "chunk") then
        table.insert(variations, asteroid_variation(asteroid_type, "01", graphics_scale, asteroid_size))
      elseif (asteroid_size_name == "small") then
        table.insert(variations, asteroid_variation(asteroid_type, "01", graphics_scale, asteroid_size))
      elseif  (asteroid_size_name == "medium") then
        table.insert(variations, asteroid_variation(asteroid_type, "01", graphics_scale, asteroid_size))
      elseif (asteroid_size_name == "big") then
        table.insert(variations, asteroid_variation(asteroid_type, "01", graphics_scale, asteroid_size))
      elseif  (asteroid_size_name == "huge") then
        table.insert(variations, asteroid_variation(asteroid_type, "01", graphics_scale, asteroid_size))
      end
    elseif (asteroid_type == "crystalline") then
      if (asteroid_size_name == "chunk") then
        table.insert(variations, asteroid_variation(asteroid_type, "01", graphics_scale, asteroid_size))
      elseif (asteroid_size_name == "small") then
        table.insert(variations, asteroid_variation(asteroid_type, "01", graphics_scale, asteroid_size))
      elseif  (asteroid_size_name == "medium") then
        table.insert(variations, asteroid_variation(asteroid_type, "01", graphics_scale, asteroid_size))
      elseif (asteroid_size_name == "big") then
        table.insert(variations, asteroid_variation(asteroid_type, "01", graphics_scale, asteroid_size))
      elseif  (asteroid_size_name == "huge") then
        table.insert(variations, asteroid_variation(asteroid_type, "01", graphics_scale, asteroid_size))
      end
    end

    data:extend({
      {
        type = asteroid_size_name == "chunk" and "asteroid-chunk" or "asteroid",
        name = asteroid_name,
        overkill_fraction = asteroid_size_name ~= "chunk" and 0.01 or nil,
        localised_description = {"entity-description."..asteroid_type.."-asteroid"},
        icon = "__TFMG-assets-0__/icons/"..asteroid_name..".png",
        icon_size = 64,
        selection_box = asteroid_size_name ~= "chunk" and {{-selection_radius, -selection_radius}, {selection_radius, selection_radius}} or nil,
        collision_box = asteroid_size_name ~= "chunk" and {{-collision_radius, -collision_radius}, {collision_radius, collision_radius}} or nil,
        collision_mask = asteroid_size_name ~= "chunk" and {layers={object=true}, not_colliding_with_itself=true} or nil,
        graphics_set = asteroid_graphics_set(0.0003 * (6 - asteroid_size), asteroids_data[asteroid_type].shading_data, variations),
        dying_trigger_effect = dying_trigger_effects,

        subgroup = asteroid_size_name == "chunk" and "space-material" or "space-environment",
        order = asteroid_data.order .. "["..asteroid_type.."]-"..letter[asteroid_size].."["..asteroid_size_name.."]",
        --factoriopedia_simulation = factoriopedia_sim,

        -- asteroid-chunk properties
        minable = asteroid_size_name == "chunk" and {mining_time = 0.2, result = asteroid_name, count = 10, mining_particle = asteroid_type.."-asteroid-chunk-particle-medium" } or nil,

        -- asteroid properties
        flags = asteroid_size_name ~= "chunk" and {"placeable-enemy", "placeable-off-grid", "not-repairable", "not-on-map"} or nil,
        max_health = asteroid_size_name ~= "chunk" and asteroid_data.max_health[asteroid_size] or nil,
        mass = asteroid_size_name ~= "chunk" and asteroid_data.mass[asteroid_size] or nil,
        resistances = resistances,
      }
    })
  end
end
-- chunk backlight overrides
data.raw["asteroid-chunk"]["ferric-asteroid-chunk"].graphics_set.lights[2] = { color = {0.85,0.5,0.4}, direction = {-1,-45,0.1} }
data.raw.tile["empty-space"].autoplace.order= "z[background]"

local dust_crater = table.deepcopy(data.raw.tile["dust-lumpy"])
dust_crater.name = "dust-crater"
dust_crater.autoplace.order = "a"
dust_crater.tint = {0.8,0.8,0.8}
dust_crater.layer = dust_crater.layer + 6

data:extend({
  dust_crater,
--empty space
  {
    type = "noise-expression",
    name = "extraction_empty_space",
    expression = "1",
  },
--dust tiles
  {
    type = "noise-expression",
    name = "extraction_dust_flat",
    expression = "extraction_asteroid_spots > 0.5",
  },
  {
    type = "noise-expression",
    name = "extraction_dust_patchy",
    expression = "extraction_asteroid_spots > 1",
  },
  {
    type = "noise-expression",
    name = "extraction_dust_crests",
    expression = "extraction_asteroid_spots > 2",
  },
  {
    type = "noise-expression",
    name = "extraction_dust_lumpy",
    expression = "extraction_asteroid_spots > 3",
  },
  {
    type = "noise-expression",
    name = "extraction_dust_crater",
    expression = "(extraction_craters < 0.1) + (extraction_craters > 0.6) + (extraction_asteroid_spots < 0.5) == 0",
  },

--regolith
  {--regolith richness
    type = "noise-expression",
    name = "regolith_richness",
    --expression = "distance_from_center*richness",
    expression = "((extraction_asteroid_spots^2.5)*(white_noise + 3)*10*richness) + 1", --lol
    local_expressions =
    {
      richness = "control:regolith:richness",
      frequency = "control:regolith:frequency",
      size = "control:regolith:size",
    }
  },
  {--regolith placement
    type = "noise-expression",
    name = "regolith_probability",
    expression = "1"
  },


--general noise expressions
  {--white noise
    type = "noise-expression",
    name = "white_noise",
    expression = "abs(basis_noise{\z
    seed0 = map_seed,\z
    seed1 = 1,\z
    x = x,\z
    offset_x = 0.5,\z
    y = y,\z
    offset_y = 0.5,\z
    input_scale = 1,\z
    output_scale = 1\z
    })"
  },
  --wobbles
  {
    type = "noise-expression",
    name = "extraction_wobble_x", -- only add to input X or Y
    expression = "multioctave_noise{x = x, y = y, persistence = 0.6, seed0 = map_seed, seed1 = 2000, octaves = 3, input_scale = 1/25}"
  },
  {
    type = "noise-expression",
    name = "extraction_wobble_y", -- only add to input X or Y
    expression = "multioctave_noise{x = x, y = y, persistence = 0.6, seed0 = map_seed, seed1 = 3000, octaves = 3, input_scale = 1/25}"
  },
  {
    type = "noise-expression",
    name = "extraction_wobble_tiny_x", -- only add to input X or Y
    expression = "multioctave_noise{x = x, y = y, persistence = 0.6, seed0 = map_seed, seed1 = 4000, octaves = 2, input_scale = 1/5}"
  },
  {
    type = "noise-expression",
    name = "extraction_wobble_tiny_y", -- only add to input X or Y
    expression = "multioctave_noise{x = x, y = y, persistence = 0.6, seed0 = map_seed, seed1 = 5000, octaves = 2, input_scale = 1/5}"
  },

--asteroid extraction

  {--asteroid extraction control
    type = "noise-expression",
    name = "extraction_asteroid_spots",
    expression = "max(extraction_asteroid_spots_big + extraction_asteroid_spots_small, (starting_asteroid * 3.5))"
  },

  {
    type = "noise-expression",
    name = "starting_asteroid",
    expression = "starting_spot_at_angle{\z
			angle = map_seed_normalized * 3600,\z
    	distance = 0,\z
    	radius = 100,\z
    	x_distortion =  (extraction_wobble_x * 15) + (extraction_wobble_tiny_x * 3),\z
    	y_distortion =  (extraction_wobble_y * 15) + (extraction_wobble_tiny_y * 3)\z
			}"
  },

  {--big asteroids
    type = "noise-expression",
    name = "extraction_asteroid_spots_big",
    expression = "extraction_asteroid_spot_noise{\z
			seed1 = 1000,\z
      spacing = 150,\z
      radius = 250,\z
      favorability = asteroid_voids(x,y) -0.4,\z
      distortion_x = (extraction_wobble_x) + (extraction_wobble_tiny_x * 0.4),\z
      distortion_y = (extraction_wobble_y) + (extraction_wobble_tiny_y * 0.4),\z
      distortion_gain = 1/15\z
    }"
  },

  {--small asteroids
    type = "noise-expression",
    name = "extraction_asteroid_spots_small",
    expression = "extraction_asteroid_spot_noise{\z
			seed1 = 1,\z
      spacing = 20,\z
      radius = 20,\z
      favorability = asteroid_voids(x,y)^2-0.05,\z
      distortion_x = extraction_wobble_tiny_x,\z
      distortion_y = extraction_wobble_tiny_y,\z
      distortion_gain = 1/6\z
    }"
  },

  {--craters
    type = "noise-expression",
    name = "extraction_craters",
    expression = "extraction_asteroid_spot_noise{\z
			seed1 = 2000,\z
      spacing = 8,\z
      radius = 14,\z
      favorability = 1,\z
      distortion_x = extraction_wobble_tiny_x,\z
      distortion_y = extraction_wobble_tiny_y,\z
      distortion_gain = 1/20\z
    }"
  },

  {--craters
    type = "noise-expression",
    name = "extraction_cliff_craters",
    expression = "extraction_asteroid_spot_noise{\z
			seed1 = 3000,\z
      spacing = 32,\z
      radius = 40,\z
      favorability = 1,\z
      distortion_x = 0,\z
      distortion_y = 0,\z
      distortion_gain = 0\z
    } * -1 + 10"
  },


  { --base spot noise for asteroids
	  type = "noise-function",
	  name = "extraction_asteroid_spot_noise",
	  parameters = {"seed1", "radius", "spacing", "favorability", "distortion_x", "distortion_y", "distortion_gain"},
    expression = "spot_noise{\z
      x = x + (distortion_x * radius * distortion_gain),\z
      y = y + (distortion_y * radius * distortion_gain),\z
      seed0 = map_seed,\z
      seed1 = seed1,\z
      skip_span = 1,\z
      skip_offset = 1,\z
      region_size = spacing * 5,\z
      density_expression = favorability,\z
      spot_favorability_expression = 1,\z
      candidate_spot_count = 10,\z
      spot_quantity_expression = radius^2 * white_noise,\z
      spot_radius_expression = radius * white_noise,\z
      hard_region_target_quantity = false,\z
      basement_value = -1,\z
      maximum_spot_basement_radius = radius/2\z
    }"
  },
  {
	  type = "noise-function",
	  name = "asteroid_voids",
	  expression = [[
	  	abs(multioctave_noise{
	  		x = xx,
	  		y = yy,
	  		persistence = 0.8,
	  		seed0 = map_seed,
	  		seed1 = 2,
	  		octaves = 3,
	  		input_scale = 1/500,
	  		output_scale = 0.8
    })
	  ]],
	  parameters = {"xx", "yy"}
  }

  



})
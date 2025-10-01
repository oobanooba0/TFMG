data:extend{--arrival height (main biome map)
  {
	type = "noise-function",
	name = "arrival_height",
	expression = [[
		clamp(abs(multioctave_noise{
			x = xx,
			y = yy,
			persistence = 0.5,
			seed0 = map_seed,
			seed1 = 1,
			octaves = 4,
			input_scale = 1/200,
			output_scale = 0.7
		}	
		+ arrival_rough_noise(xx,yy)
		+ arrival_trenches(xx,yy,1) 
		+ arrival_trenches(xx,yy,100)
		+ arrival_trenches(xx,yy,200)
		),0,1)
		* clamp(-starting_ferric-0.3,0,1) 
		* clamp(-starting_mineral-0.3,0,1)
		* clamp(-starting_ice-0.3,0,1) 
		+ 1 * ceil(starting_ferric+0.3 >0)
		+ 0.5 * ceil(starting_mineral+0.3 >0)
		- 1 * ceil(starting_ice+0.3 >0)
	]],
	parameters = {"xx", "yy"}
  }
}
data:extend{--elevation (for cliffs)
  {
	type = "noise-expression",
	name = "arrival_elevation",
	expression = "(arrival_height(x,y)*-1000)+1000"
  }
}


data:extend{--arrival rough noise
	{
	type = "noise-function",
	name = "arrival_rough_noise",
	expression = [[
		multioctave_noise{
			x = xx,
			y = yy,
			persistence = 0.7,
			seed0 = map_seed,
			seed1 = 2,
			octaves = 6,
			input_scale = 1/4,
			output_scale = 0.07
		}
	]],
	parameters = {"xx", "yy"}
  }
}
data:extend {--distance from center
	{
    type = "noise-expression",
    name = "distance_from_center",
    expression = "(sqrt(x*x + y*y))",
  },
}
data:extend{--main function deciding where there are trenches.
	{
	type = "noise-function",
	name = "arrival_trenches",
	expression = [[
		10 * floor(
			abs(
				ridge(
					multioctave_noise{
						x = xx,
						y = yy,
						persistence = 0.45,
						seed0 = map_seed,
						seed1 = layer,
						octaves = 8,
						input_scale = 1/1000,
						output_scale = 150
					},
					0.2,1.05)
				 -arrival_trench_noise_large(xx,yy,layer) - arrival_rough_noise(xx,yy) * 0.5
		))
	]],
	parameters = {"xx", "yy", "layer"}
  }
}
data:extend{--arrival_trench_noise_large
	{
	type = "noise-function",--effectively decides what thickness a trench should be, down to 0, meaning no trench.
	name = "arrival_trench_noise_large",--mainly so trenches arent continuous
	expression = [[
		ridge(multioctave_noise{
			x = xx,
			y = yy,
			persistence = 0.4,
			seed0 = map_seed,
			seed1 = layer,
			octaves = 4,
			input_scale = 1/600,
			output_scale = 0.2
		},0,0.4)
	]],
	parameters = {"xx", "yy", "layer"}
  }
}
data:extend{--ice bed placement (I hope)
	{
	type = "noise-function",
	name = "arrival_ice_noise",
	expression = [[
			arrival_height(x, y) - multioctave_noise{
			x = x,
			y = y,
			persistence = 0.2,
			seed0 = map_seed,
			seed1 = 30,
			octaves = 2,
			input_scale = 1/100,
			output_scale = 0.2
		}
	]],
	parameters = {"xx", "yy"}
  }
}
data:extend({--arrival wobble
  {
    type = "noise-expression",
    name = "arrival_wobble_x", -- only add to input X or Y
    expression = "multioctave_noise{x = x, y = y, persistence = 0.7, seed0 = map_seed, seed1 = 2000, octaves = 3, input_scale = 1/10}"
  },
  {
    type = "noise-expression",
    name = "arrival_wobble_y", -- only add to input X or Y
    expression = "multioctave_noise{x = x, y = y, persistence = 0.7, seed0 = map_seed, seed1 = 3000, octaves = 3, input_scale = 1/10}"
  },
})


data:extend({--starting ore patches
  {
    type = "noise-expression",
    name = "starting_ferric",
    expression = "starting_spot_at_angle{\z
			angle = 0,\z
    	distance = 50,\z
    	radius = 12,\z
    	x_distortion =  arrival_wobble_x*4,\z
    	y_distortion =  arrival_wobble_y*4\z
			}"
  },
	{
    type = "noise-expression",
    name = "starting_mineral",
    expression = "starting_spot_at_angle{\z
			angle = 120,\z
    	distance = 70,\z
    	radius = 20,\z
    	x_distortion =  arrival_wobble_x*4,\z
    	y_distortion =  arrival_wobble_y*4\z
			}"
  },
	{
    type = "noise-expression",
    name = "starting_ice",
    expression = "starting_spot_at_angle{\z
			angle = 240,\z
    	distance = 50,\z
    	radius = 20,\z
    	x_distortion =  arrival_wobble_x*4,\z
    	y_distortion =  arrival_wobble_y*4\z
			}"
  },
})

data:extend({--arrival ore generations.
  {
    type = "noise-function",
    name = "arrival_simple_spot",
    parameters = {"seed1", "radius", "spacing", "favorability"},
    expression = "spot_noise{\z
      x = x + arrival_wobble_x* 0.5 * radius,\z
      y = y + arrival_wobble_y* 0.5 * radius,\z
      seed0 = map_seed,\z
      seed1 = seed1,\z
      skip_span = 1,\z
      skip_offset = 1,\z
      region_size = spacing * 5,\z
      density_expression = favorability,\z
      spot_favorability_expression = favorability,\z
      candidate_spot_count = 22,\z
      suggested_minimum_candidate_point_spacing = spacing,\z
      spot_quantity_expression = radius * radius,\z
      spot_radius_expression = radius,\z
      hard_region_target_quantity = 0,\z
      basement_value = -1,\z
      maximum_spot_basement_radius = radius * 2\z
    }"
  },
  {--ferric ore expression
    type = "noise-expression",
    name = "ferric_ore_richness",
    expression = "(distance_from_center*3+1000) * max(starting_ferric , (arrival_simple_spot(1, 12 * size ^ 0.5, 200 / frequency ^ 0.5,1))* richness / size)",
    local_expressions =
    {
      richness = "control:ferric_ore:richness",
      frequency = "control:ferric_ore:frequency",
      size = "control:ferric_ore:size",
			
    }
  },
  {--ferric ore placement
    type = "noise-expression",
    name = "ferric_ore_probability",
    expression = "max(starting_ferric*10,(control:ferric_ore:size > 0) * (ferric_ore_richness > 1) * ceil((arrival_height(x,y) >= 0.85)))"
  },
	{--mineral ore expression
    type = "noise-expression",
    name = "mineral_ore_richness",
    expression = "(distance_from_center*2+600) * max(starting_mineral , (arrival_simple_spot(1000, 40 * size ^ 0.5, 600 / frequency ^ 0.5,1)) * richness / size)",
    local_expressions =
    {
      richness = "control:mineral_ore:richness",
      frequency = "control:mineral_ore:frequency",
      size = "control:mineral_ore:size",
    }
  },
  {--mineral ore placement
    type = "noise-expression",
    name = "mineral_ore_probability",
    expression = "max(starting_mineral*10,(control:mineral_ore:size > 0) * (mineral_ore_richness > 1) * ceil((arrival_height(x,y) < 0.7)) * ceil((arrival_height(x,y) > 0.2)))"
  },
	{
    type = "noise-function",
    name = "arrival_spot_noise",
    parameters = {"seed", "count", "skip_offset", "region_size", "density", "radius", "favorability"},
    expression = "spot_noise{\z
			x = x,\z
      y = y,\z
      seed0 = map_seed,\z
      seed1 = seed,\z
      candidate_spot_count = count,\z
      suggested_minimum_candidate_point_spacing = 128,\z
      skip_span = 3,\z
      skip_offset = skip_offset,\z
      region_size = region_size,\z
      density_expression = density,\z
      spot_quantity_expression = radius * radius,\z
      spot_radius_expression = radius,\z
      hard_region_target_quantity = 0,\z
      spot_favorability_expression = favorability,\z
      basement_value = -1,\z
      maximum_spot_basement_radius = radius * 2}"
  },
  {
    type = "noise-expression",
    name = "ice_geyser_spots",
    expression = "arrival_spot_noise{\z
			seed = 3000,\z
      count = 1,\z
      skip_offset = 0,\z
      region_size = 80 / control:ice_geyser:frequency,\z
      density = 1,\z
      radius = 25 * sqrt(control:ice_geyser:size),\z
      favorability = 1}"
  },
	{
    type = "noise-expression",
    name = "ice_geyser_richness",
    expression = "distance_from_center+1000 * max(starting_ice, ice_geyser_spots) * control:ice_geyser:richness * 1000"
  },
  {
    type = "noise-expression",
    name = "ice_geyser_probability",
    expression = "max((starting_ice/10),(control:ice_geyser:size > 0) * (ice_geyser_spots * 0.020) * ceil(arrival_ice_noise(x,y) < -0.1))"
  },

})
data:extend{-- Ice worm
  {
    type = "noise-expression",
    name = "ice_worm_territory_radius",
    expression = 1200
  },
}
data:extend{-- small ice worm placement
  {
    type = "noise-expression",
    name = "small_ice_worm",
    expression = [[spot_noise{
			x = x,
			y = y,
			skip_span= 3,
			skip_offset = 0,
			density_expression = 1,
			spot_quantity_expression = 1,
			spot_radius_expression = 1,
			spot_favorability_expression = 1,
			seed0 = map_seed,
			seed1 = 0,
			basement_value = 0,
			maximum_spot_basement_radius = 1,
			region_size = ice_worm_territory_radius,
			candidate_point_count = 3,
			suggested_minimum_candidate_point_spacing = ice_worm_territory_radius/2
			}
		]]
  },
}
data:extend{-- medium ice worm placement
  {
    type = "noise-expression",
    name = "medium_ice_worm",
    expression = [[spot_noise{
			x = x,
			y = y,
			skip_span= 3,
			skip_offset = 1,
			density_expression = 1,
			spot_quantity_expression = 0.3,
			spot_radius_expression = 1,
			spot_favorability_expression = 1,
			seed0 = map_seed,
			seed1 = 0,
			basement_value = 0,
			maximum_spot_basement_radius = 1,
			region_size = ice_worm_territory_radius,
			candidate_point_count = 3,
			suggested_minimum_candidate_point_spacing = ice_worm_territory_radius/2
			}
		]]
  },
}
data:extend{-- big ice worm placement
  {
    type = "noise-expression",
    name = "big_ice_worm",
    expression = [[spot_noise{
			x = x,
			y = y,
			skip_span= 3,
			skip_offset = 2,
			density_expression = 1,
			spot_quantity_expression = 0.1,
			spot_radius_expression = 1,
			spot_favorability_expression = 1,
			seed0 = map_seed,
			seed1 = 0,
			basement_value = 0,
			maximum_spot_basement_radius = 1,
			region_size = ice_worm_territory_radius,
			candidate_point_count = 3,
			suggested_minimum_candidate_point_spacing = ice_worm_territory_radius/2
			}
		]]
  },
}
--ice worms
data.raw["segmented-unit"]["small-ice-worm"].autoplace = {
	force = "neutral",
	placement_density = 1,
	probability_expression = "small_ice_worm",
	order = "b-a"
}
data.raw["segmented-unit"]["medium-ice-worm"].autoplace = {
	force = "neutral",
	placement_density = 1,
	probability_expression = "medium_ice_worm",
	order = "b-b"
}
data.raw["segmented-unit"]["big-ice-worm"].autoplace = {
	force = "neutral",
	placement_density = 1,
	probability_expression = "big_ice_worm",
	order = "b-c"
}
--Red Biome
data.raw.tile["fulgoran-rock"].autoplace = {
	probability_expression = [[
	  arrival_height(x, y) - noise >= 1.05
	]],
	local_expressions = {
  noise = [[
		multioctave_noise{
			x = x,
			y = y,
			persistence = 0.7,
			seed0 = map_seed,
			seed1 = 20,
			octaves = 3,
			input_scale = 1/3,
			output_scale = 0.1
		}
	]],
  },
	order = "a[red]-a[dunes]"
}
data.raw.tile["fulgoran-dunes"].autoplace = {
	probability_expression = [[
	  arrival_height(x, y) - noise >= 0.95
	]],
	local_expressions = {
  noise = [[
		multioctave_noise{
			x = x,
			y = y,
			persistence = 0.6,
			seed0 = map_seed,
			seed1 = 22,
			octaves = 2,
			input_scale = 1/12,
			output_scale = 0.2
		}
	]],
  },
	order = "a[red]-b[sand]"
}
data.raw.tile["fulgoran-sand"].autoplace = {
	probability_expression = [[
	  arrival_height(x, y) - noise >= 0.9
	]],
	local_expressions = {
  noise = [[
		multioctave_noise{
			x = x,
			y = y,
			persistence = 0.5,
			seed0 = map_seed,
			seed1 = 21,
			octaves = 2,
			input_scale = 1/30,
			output_scale = 0.2
		}
	]],
  },
	order = "a[red]-c[rock]"
}
data.raw.tile["fulgoran-dust"].autoplace = {
	probability_expression = [[
		arrival_height(x, y) >= 0.85
	]],
	order = "a[red]-d[dust]"
}
--Dust Biome (midlands)
data.raw.tile["dust-lumpy"].autoplace = {
	probability_expression = [[
		arrival_height(x, y) - noise >= 0.7
	]],
	local_expressions = {
  noise = [[
		multioctave_noise{
			x = x,
			y = y,
			persistence = 0.7,
			seed0 = map_seed,
			seed1 = 13,
			octaves = 2,
			input_scale = 1/8,
			output_scale = 0.3
		}
	]],
  },
	order = "c[dust]-a[lumpy]"
}
data.raw.tile["dust-crests"].autoplace = {
	probability_expression = [[
		arrival_height(x, y) - noise >= 0.7
	]],
	local_expressions = {
  noise = [[
		multioctave_noise{
			x = x,
			y = y,
			persistence = 0.7,
			seed0 = map_seed,
			seed1 = 11,
			octaves = 2,
			input_scale = 1/8,
			output_scale = 0.3
		}
	]],
  },
	order = "c[dust]-b[crests]"
}
data.raw.tile["dust-patchy"].autoplace = {
	probability_expression = [[
  arrival_height(x, y) - noise >= 0.4
	]],
	local_expressions = {
  noise = [[
		multioctave_noise{
			x = x,
			y = y,
			persistence = 0.8,
			seed0 = map_seed,
			seed1 = 12,
			octaves = 3,
			input_scale = 1/30,
			output_scale = 0.2
		}
	]],
  },
	order = "c[dust]-c[patchy]"
}
data.raw.tile["dust-flat"].autoplace = {
	probability_expression = [[
		arrival_height(x, y) >= 0
	]],
	order = "c[dust]-d[flat]"
}
--ice biome
data.raw.tile["ice-smooth"].autoplace = {
	probability_expression = [[
		arrival_ice_noise(x, y) <= -0.1
	]],
	order = "b[ice]-a[flat]"
}
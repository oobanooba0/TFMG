data:extend{
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
		} + arrival_rough_noise(xx,yy) + arrival_trenches(xx,yy,1)+ arrival_trenches(xx,yy,100)+ arrival_trenches(xx,yy,200)),0,1)
	]],
	parameters = {"xx", "yy"}
  }
}

data:extend{
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

data:extend{
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

data:extend {--ferric ore placement
	{
    type = "noise-expression",
    name = "ferric_ore",
    expression = "((arrival_height(x, y) >= 0.85) * noise)",
		local_expressions = {
    noise = [[
		clamp((multioctave_noise{
			x = x,
			y = y,
			persistence = 0.5,
			seed0 = map_seed,
			seed1 = 40,
			octaves = 2,
			input_scale = 1/20,
			output_scale = 5
		}-2/(var("control:ferric_ore:size"))),0,5)
	]],
  },
	}
}

data:extend {
	{
    type = "noise-expression",
    name = "distance_from_center",
    expression = "(sqrt(x*x + y*y))",
  },
}


data:extend{-- Ice worm
  {
    type = "noise-expression",
    name = "ice_worm_territory_radius",
    expression = 800
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

data:extend{-- ice worm placement
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

data:extend{-- ice worm placement
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
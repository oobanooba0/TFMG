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
		} + arrival_rough_noise(xx, yy)),0,1)
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
		arrival_height(x, y) - noise <= -0.1
	]],
	local_expressions = {
  noise = [[
		multioctave_noise{
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
  },
	order = "b[ice]-a[flat]"
}

--data.raw.entity["cliff"]
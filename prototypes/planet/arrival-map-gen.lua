data:extend{
  {
    type = "noise-function",
    name = "arrival_biome",
    expression = [[
        abs(multioctave_noise{
            x = xx,
            y = yy,
            persistence = 0.5,
            seed0 = map_seed,
            seed1 = 1,
            octaves = 5,
            input_scale = 1/200,
            output_scale = 1
        })
    ]],
    parameters = {"xx", "yy"}
  }
}

data.raw.tile["dust-flat"].autoplace = {
    probability_expression = [[
        arrival_biome(x, y) >= 0.6
    ]],
    order = "a[dust]-a[flat]"
}

data.raw.tile["dust-crests"].autoplace = {
    probability_expression = [[
        arrival_biome(x, y) >= 0.5
    ]],
    order = "a[dust]-b[crests]"
}

data.raw.tile["fulgoran-dust"].autoplace = {
    probability_expression = [[
        arrival_biome(x, y) >= 0.1
    ]],
    order = "b[Red]-a[flat]"
}
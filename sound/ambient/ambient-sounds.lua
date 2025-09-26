data.raw ['ambient-sound']['main-menu'] = nil--to boldly delete the vanilla main menu music

data:extend({
--main menu
  {
    type = "ambient-sound",
    name = "PURPOSE",
    track_type = "menu-track",
    sound = {
      filename = "__TFMG-music__/main-menu/PURPOSE.ogg",
      volume = 1,
    }
  },
})
data:extend({--arrival
---main
  {
    type = "ambient-sound",
    name = "ENTROPY",
    track_type = "main-track",
    planet = "arrival",
    sound = {
      filename = "__TFMG-music__/arrival/ENTROPY.ogg",
      volume = 1,
    },
    weight = 10
  },
  {
    type = "ambient-sound",
    name = "TREMOR",
    track_type = "main-track",
    planet = "arrival",
    sound = {
      filename = "__TFMG-music__/arrival/TREMOR.ogg",
      volume = 1,
    },
    weight = 10
  },
---interludes
  {
    type = "ambient-sound",
    name = "Clock-Interlude",
    track_type = "interlude",
    planet = "arrival",
    sound = {
      filename = "__TFMG-music__/arrival/Clock-Interlude.ogg",
      volume = 0.5,
    },
    weight = 10
  },
})
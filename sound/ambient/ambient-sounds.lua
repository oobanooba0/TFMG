data:extend({
--main menu
  {
    type = "ambient-sound",
    name = "PURPOSE",
    track_type = "menu-track",
    sound = {
      filename = "__TFMG__/sound/ambient/main-menu/PURPOSE.ogg",
      volume = 1,
    }
  },
--arrival
---main
  {
    type = "ambient-sound",
    name = "ENTROPY",
    track_type = "main-track",
    planet = "arrival",
    sound = {
      filename = "__TFMG__/sound/ambient/arrival/ENTROPY.ogg",
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
      filename = "__TFMG__/sound/ambient/arrival/TREMOR.ogg",
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
      filename = "__TFMG__/sound/ambient/arrival/Clock-Interlude.ogg",
      volume = 0.5,
    },
    weight = 10
  },
---
})
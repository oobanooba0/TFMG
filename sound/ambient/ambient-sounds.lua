data.raw ['ambient-sound']['main-menu'] = nil--to boldly delete the vanilla main menu music


for _,track in pairs(data.raw ['ambient-sound']) do --removing the vanilla nauvis tracks. Normally I'd delete everything but space still needs some music that isnt just one track.
  if track.planet == "nauvis" then 
    data.raw['ambient-sound'][track.name] = nil 
  end
end

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
data:extend({
--Space
  --main
    {
      type = "ambient-sound",
      name = "FIELDS",
      track_type = "main-track",
      sound = {
        filename = "__TFMG-music__/space/FIELDS.ogg",
        volume = 1,
      },
      weight = 10
    },
    {
      type = "ambient-sound",
      name = "THERMAL",
      track_type = "main-track",
      sound = {
        filename = "__TFMG-music__/space/THERMAL.ogg",
        volume = 1,
      },
      weight = 10
    },
    {
      type = "ambient-sound",
      name = "EXPLOITATION",
      track_type = "main-track",
      sound = {
        filename = "__TFMG-music__/space/THERMAL.ogg",
        volume = 1,
      },
      weight = 10
    },
--arrival
  --main
    {
      type = "ambient-sound",
      name = "ENTROPY",
      track_type = "main-track",
      planet = "nauvis",
      sound = {
        filename = "__TFMG-music__/arrival/ENTROPY.ogg",
        volume = 1,
      },
      weight = 10
    },
    {
      type = "ambient-sound",
      name = "LIFE",
      track_type = "main-track",
      planet = "nauvis",
      sound = {
        filename = "__TFMG-music__/arrival/LIFE.ogg",
        volume = 1,
      },
      weight = 10
    },
    {
      type = "ambient-sound",
      name = "TREMOR",
      track_type = "main-track",
      planet = "nauvis",
      sound = {
        filename = "__TFMG-music__/arrival/TREMOR.ogg",
        volume = 1,
      },
      weight = 10
    },
  --interludes
    {
      type = "ambient-sound",
      name = "Clock-Interlude",
      track_type = "interlude",
      planet = "nauvis",
      sound = {
        filename = "__TFMG-music__/arrival/Clock-Interlude.ogg",
        volume = 0.7,
      },
      weight = 10
    },
    {
      type = "ambient-sound",
      name = "Count-Interlude",
      track_type = "interlude",
      planet = "nauvis",
      sound = {
        filename = "__TFMG-music__/arrival/Count-Interlude.ogg",
        volume = 0.7,
      },
      weight = 10
    },
    {
      type = "ambient-sound",
      name = "Spider-Steps-Interlude",
      track_type = "interlude",
      planet = "nauvis",
      sound = {
        filename = "__TFMG-music__/arrival/Spider-Steps-Interlude.ogg",
        volume = 0.7,
      },
      weight = 10
    },
    {
      type = "ambient-sound",
      name = "Wyrms-Interlude",
      track_type = "interlude",
      planet = "nauvis",
      sound = {
        filename = "__TFMG-music__/arrival/Wyrms-Interlude.ogg",
        volume = 0.7,
      },
      weight = 10
    },
    {
      type = "ambient-sound",
      name = "Reflections-Interlude",
      track_type = "interlude",
      planet = "nauvis",
      sound = {
        filename = "__TFMG-music__/arrival/Reflections-Interlude.ogg",
        volume = 0.7,
      },
      weight = 10
    },
    {
      type = "ambient-sound",
      name = "Decomposition-Interlude",
      track_type = "interlude",
      planet = "nauvis",
      sound = {
        filename = "__TFMG-music__/arrival/Decomposition-Interlude.ogg",
        volume = 0.7,
      },
      weight = 10
    },
})
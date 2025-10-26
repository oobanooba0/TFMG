--we're getting rid of the vanilla one, since it just straight up doesnt apply.
data.raw["map-gen-presets"] = {}

data:extend({
  {
  type = "map-gen-presets",
    name = "default",
    -- default changes nothing
    default =
    {
      default = true,
      order = "a"
    }
  }
})
data:extend({
  {
    type = "sound",
    name = "story-ticker",
    category = "gui-effect",
    priority = 10,
    filename = "__core__/sound/gui-menu-small.ogg",
    preload = true,
    aggregation = {max_count = 5, remove = true, priority = "newest"},
  }
})
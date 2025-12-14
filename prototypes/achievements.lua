local K = 1000
local M = 1000000
local G = 1000000000

--remove vanilla achivements
  data.raw ["achievement"] = {}
  data.raw ["build-entity-achievement"] = {}
  data.raw ["change-surface-achievement"] = {}
  data.raw ["combat-robot-count-achievement"] = {}
  data.raw ["complete-objective-achievement"] = {}
  data.raw ["construct-with-robots-achievement"] = {}
  data.raw ["create-platform-achievement"] = {}
  data.raw ["deconstruct-with-robots-achievement"] = {}
  data.raw ["deliver-by-robots-achievement"] = {}
  data.raw ["deplete-resource-achievement"] = {}
  data.raw ["destroy-cliff-achievement"] = {}
  data.raw ["dont-build-entity-achievement"] = {}
  data.raw ["dont-craft-manually-achievement"] = {}
  data.raw ["dont-kill-manually-achievement"] = {}
  data.raw ["dont-research-before-researching-achievement"] = {}
  data.raw ["dont-use-entity-in-energy-production-achievement"] = {}
  data.raw ["equip-armor-achievement"] = {}
  data.raw ["group-attack-achievement"] = {}
  data.raw ["kill-achievement"] = {}
  data.raw ["module-transfer-achievement"] = {}
  data.raw ["place-equipment-achievement"] = {}
  data.raw ["player-damaged-achievement"] = {}
  data.raw ["produce-achievement"] = {}
  data.raw ["produce-per-hour-achievement"] = {}
  data.raw ["research-achievement"] = {}
  data.raw ["research-with-science-pack-achievement"] = {}
  data.raw ["shoot-achievement"] = {}
  data.raw ["space-connection-distance-traveled-achievement"] = {}
  data.raw ["train-path-achievement"] = {}
  data.raw ["use-entity-in-energy-production-achievement"] = {}
  data.raw ["use-item-achievement"] = {}

data:extend({
--progression
  {--embrace purpose, build matter reconstructor
    type = "build-entity-achievement",
    name = "embrace-your-purpose",
    order = "a[progress]-a[embrace-your-purpose]",
    to_build = "matter-reconstructor",
    icon = "__base__/graphics/achievement/automate-this.png",
    icon_size = 128,
  },
  {--build scout-o-tron
    type = "achievement",
    name = "spiders",
    order = "a[progress]-b[spiders]-a",
    icon = "__base__/graphics/achievement/arachnophilia.png",
    icon_size = 128,
  },
  {--build constructron
    type = "achievement",
    name = "australia-irl",
    order = "a[progress]-b[spiders]-b",
    icon = "__base__/graphics/achievement/arachnophilia.png",
    icon_size = 128,
  },
  {--get attacked by ice worm
    type = "complete-objective-achievement",
    objective_condition = "rocket-launched",
    name = "they-move-below",
    order = "a[progress]-c[they-move-below]",
    icon = "__space-age__/graphics/achievement/get-off-my-lawn.png",
    icon_size = 128,
  },
  {--craft introspection science
    type = "produce-achievement",
    name = "self-reflection",
    order = "a[progress]-d[science]-a",
    item_product = "introspection-science",
    amount = 1,
    limited_to_one_game = false,
    icon = "__TFMG-assets-0__/achievements/introspection-science.png",
    icon_size = 128,
  },
  {--craft exploration science
    type = "produce-achievement",
    name = "terra-nullius",
    order = "a[progress]-d[science]-b",
    item_product = "exploration-science",
    amount = 1,
    limited_to_one_game = false,
    icon = "__TFMG-assets-0__/achievements/exploration-science.png",
    icon_size = 128,
  },
  {--craft exploitation science
    type = "produce-achievement",
    name = "bogo-sort",
    order = "a[progress]-d[science]-c",
    item_product = "exploitation-science",
    amount = 1,
    limited_to_one_game = false,
    icon = "__TFMG-assets-0__/achievements/exploitation-science.png",
    icon_size = 128,
  },
--fun facts
  {--long road to ruin
    type = "train-path-achievement",
    name = "long-road-to-ruin",
    order = "b[fun-facts]-a[train-tracks]",
    minimum_distance = 1000,
    icon = "__base__/graphics/achievement/getting-on-track.png",
    icon_size = 128,
  },
  {--and i would walk 5 miles
    type = "train-path-achievement",
    name = "and-i-would-walk-5-miles",
    order = "b[fun-facts]-a[train-tracks]-b",
    minimum_distance = 8047,
    icon = "__base__/graphics/achievement/getting-on-track-like-a-pro.png",
    icon_size = 128,
  },
  {--universal-paperclips
    type = "produce-achievement",
    name = "universal-paperclips",
    order = "b[fun-facts]-b[produce]-a",
    item_product = "conductive-coil",
    amount = 1*G,
    limited_to_one_game = false,
    icon = "__TFMG-assets-0__/achievements/universal-paperclips.png",
    icon_size = 128,
  },
-- other
  {--use solar power
    type = "achievement",
    name = "everyday-darkness",
    order = "c[other]-a[subtly-guide-the-player-into-playing-the-game-correctly]-a",
    icon = "__base__/graphics/achievement/steam-all-the-way.png",
    icon_size = 128,
  },
})


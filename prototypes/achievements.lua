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
  {
    type = "build-entity-achievement",
    name = "embrace-your-purpose",
    order = "a[progress]-a[embrace-your-purpose]",
    to_build = "matter-reconstructor",
    icon = "__base__/graphics/achievement/automate-this.png",
    icon_size = 128,
  },
  {
    type = "achievement",
    name = "spiders",
    order = "a[progress]-b[spiders]",
    icon = "__base__/graphics/achievement/arachnophilia.png",
    icon_size = 128,
  },
})


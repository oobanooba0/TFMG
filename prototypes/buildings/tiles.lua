--regular requires
  local tile_trigger_effects = require("__space-age__.prototypes.tile.tile-trigger-effects")
  local tile_pollution = require("__space-age__.prototypes.tile.tile-pollution-values")
  local tile_collision_masks = require("__base__/prototypes/tile/tile-collision-masks")

  local space_platform_tile_animations = require("__space-age__.prototypes.tile.platform-tile-animations")

  local base_sounds = require("__base__/prototypes/entity/sounds")
  local base_tile_sounds = require("__base__/prototypes/tile/tile-sounds")
  local space_age_tile_sounds = require("__space-age__/prototypes/tile/tile-sounds")

  local tile_graphics = require("__base__/prototypes/tile/tile-graphics")
  local tile_spritesheet_layout = tile_graphics.tile_spritesheet_layout

  space_age_tiles_util = space_age_tiles_util or {}

  default_transition_group_id = default_transition_group_id or 0
  water_transition_group_id = water_transition_group_id or 1
  out_of_map_transition_group_id = out_of_map_transition_group_id or 2
  lava_transition_group_id = lava_transition_group_id or 3

--custom collision mask
  local platform_foundation_collision_mask = {layers={ground_tile=true,platform=true}}


--heavy space platform
  local HSP = data.raw.tile["space-platform-foundation"]
  HSP.weight = 5000
  HSP.allows_being_covered = true

data:extend({
  {
    type = "tile",
    name = "light-space-platform-foundation",
    order = "a[artificial]-d[utility]-c[light-space-platform-foundation]",
    subgroup = "artificial-tiles",
    minable = {mining_time = 0.5, result = "light-space-platform-foundation"},
    mined_sound = base_sounds.deconstruct_bricks(0.8),
    is_foundation = true,
    allows_being_covered = true,
    tint = {0.8,1,1},
    max_health = 50,
    weight = 500,
    collision_mask = platform_foundation_collision_mask,
    layer = 15,
    dying_explosion = "space-platform-foundation-explosion",
    trigger_effect = tile_trigger_effects.landfill_trigger_effect(),
    bound_decoratives =
    {
      "space-platform-decorative-pipes-2x1",
      "space-platform-decorative-pipes-1x2",
      "space-platform-decorative-pipes-1x1",
      "space-platform-decorative-4x4",
      "space-platform-decorative-2x2",
      "space-platform-decorative-1x1",
      "space-platform-decorative-tiny",
    },
    build_animations = space_platform_tile_animations.top_animation,
    build_animations_background = space_platform_tile_animations.animation,
    built_animation_frame = 32,
    sprite_usage_surface = "space",
    variants =
    {
      main =
      {
        {
          picture = "__space-age__/graphics/terrain/space-platform/space-platform-1x1.png",
          count = 16,
          size = 1,
          scale = 0.5
        },
        {
          picture = "__space-age__/graphics/terrain/space-platform/space-platform-2x2.png",
          count = 16,
          size = 2,
          probability = 0.75,
          scale = 0.5
        },
      },
      transition =
      {
        draw_background_layer_under_tiles = true,
        --outer_corner_variations_in_group = 8,
        side_variations_in_group = 16,
        double_side_variations_in_group = 4,

        overlay_layout =
        {
          inner_corner =
          {
            spritesheet = "__space-age__/graphics/terrain/space-platform/space-platform-inner-corner.png",
            count = 16,
            scale = 0.5
          },
          outer_corner =
          {
            spritesheet = "__space-age__/graphics/terrain/space-platform/space-platform-outer-corner.png",
            count = 16,
            scale = 0.5
          },
          side =
          {
            spritesheet = "__space-age__/graphics/terrain/space-platform/space-platform-side.png",
            count = 32,
            scale = 0.5
          },
          double_side =
          {
            spritesheet = "__space-age__/graphics/terrain/space-platform/space-platform-double-side.png",
            count = 8,
            scale = 0.5
          },
          u_transition =
          {
            spritesheet = "__space-age__/graphics/terrain/space-platform/space-platform-u.png",
            count = 4,
            scale = 0.5
          },
          o_transition =
          {
            spritesheet = "__space-age__/graphics/terrain/space-platform/space-platform-o.png",
            count = 1,
            scale = 0.5
          }
        },
        background_layout =
        {
          inner_corner =
          {
            spritesheet = "__space-age__/graphics/terrain/space-platform/space-platform-inner-corner-background.png",
            count = 16,
            scale = 0.5,
            tile_height = 8
          },
          outer_corner =
          {
            spritesheet = "__space-age__/graphics/terrain/space-platform/space-platform-outer-corner-background.png",
            count = 16,
            scale = 0.5,
            tile_height = 8
          },
          side =
          {
            spritesheet = "__space-age__/graphics/terrain/space-platform/space-platform-side-background.png",
            count = 32,
            scale = 0.5,
            tile_height = 8
          },
          double_side =
          {
            spritesheet = "__space-age__/graphics/terrain/space-platform/space-platform-double-side-background.png",
            count = 8,
            scale = 0.5,
            tile_height = 8
          },
          u_transition =
          {
            spritesheet = "__space-age__/graphics/terrain/space-platform/space-platform-u-background.png",
            count = 4,
            scale = 0.5,
            tile_height = 8
          },
          o_transition = nil
        },
        mask_layout =
        {
          inner_corner =
          {
            spritesheet = "__space-age__/graphics/terrain/space-platform/space-platform-inner-corner-mask.png",
            count = 16,
            scale = 0.5
          },
          outer_corner =
          {
            spritesheet = "__space-age__/graphics/terrain/space-platform/space-platform-outer-corner-mask.png",
            count = 16,
            scale = 0.5
          },
          side =
          {
            spritesheet = "__space-age__/graphics/terrain/space-platform/space-platform-side-mask.png",
            count = 32,
            scale = 0.5
          },
          double_side =
          {
            spritesheet = "__space-age__/graphics/terrain/space-platform/space-platform-double-side-mask.png",
            count = 8,
            scale = 0.5
          },
          u_transition =
          {
            spritesheet = "__space-age__/graphics/terrain/space-platform/space-platform-u-mask.png",
            count = 4,
            scale = 0.5
          },
          o_transition =
          {
            spritesheet = "__space-age__/graphics/terrain/space-platform/space-platform-o-mask.png",
            count = 1,
            scale = 0.5
          }
        }
      },
    },
    walking_sound = base_tile_sounds.walking.concrete,
    build_sound = space_age_tile_sounds.building.space_platform,
    map_color = {63, 71, 69},
    scorch_mark_color = {r = 0.373, g = 0.307, b = 0.243, a = 1.000}
  },
})
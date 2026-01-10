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
  
  local patch_for_inner_corner_of_transition_between_transition = tile_graphics.patch_for_inner_corner_of_transition_between_transition

--custom collision mask
  local platform_foundation_collision_mask = {layers={ ground_tile = true, platform = true, artificial_ground = true, }}
  local scaffold_collision_mask = {layers={ ground_tile = true, platform = true, artificial_ground = true, unstable = true}}


--heavy space platform
  local HSP = data.raw.tile["space-platform-foundation"] --halal snack pack
  HSP.weight = 10000 --had 50000
  HSP.allows_being_covered = true


data:extend({
  
  {--depleted regolith
    type = "tile",
    name = "depleted-regolith",
    order = "a[artificial]-d[utility]-f[depleted-regolith]",
    subgroup = "artificial-tiles",
    minable = {mining_time = 0.5, result = "depleted-regolith"},
    mined_sound = base_sounds.deconstruct_bricks(0.8),
    is_foundation = false,
    collision_mask = tile_collision_masks.ground(),
    layer = 20,
    transitions = data.raw.tile["landfill"].transitions,
    transitions_between_transitions = data.raw.tile["landfill"].transitions_between_transitions,
    trigger_effect = tile_trigger_effects.landfill_trigger_effect(),

    variants =
    {
      transition = tile_graphics.generic_masked_tile_transitions1,

      material_background =
      {
        picture = "__base__/graphics/terrain/landfill.png",
        count = 8,
        scale = 0.5
      }
    },
    walking_sound = base_tile_sounds.walking.dirt,
    build_sound = base_tile_sounds.building.landfill,
    map_color={57, 39, 26},
    scorch_mark_color = {r = 0.329, g = 0.242, b = 0.177, a = 1.000}
  },
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
    weight = 1000, --big
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
  {--ultralight scaffold
    type = "tile",
    name = "ultralight-scaffold",
    order = "a[artificial]-d[utility]-e[ultralight-scaffold]",
    subgroup = "artificial-tiles",
    minable = {mining_time = 0.5, result = "ultralight-scaffold"},
    mined_sound = base_sounds.deconstruct_bricks(0.8),
    is_foundation = false, --for whatever reason, this does the trick. But i hate you.
    allows_being_covered = false,
    tint = {1,1,1,1},
    max_health = 5,
    weight = 200, --superlightweight
    collision_mask = scaffold_collision_mask,
    layer = 16,
    dying_explosion = "space-platform-foundation-explosion",
    trigger_effect = tile_trigger_effects.landfill_trigger_effect(),
    build_animations = space_platform_tile_animations.top_animation,
    build_animations_background = space_platform_tile_animations.animation,
    built_animation_frame = 32,
    sprite_usage_surface = "space",
    particle_tints =
    {
      primary = {0, 0, 0, 0},
      secondary = {0, 0, 0, 0},
    },
    variants =
    {
      main =
      {
        {
          picture = "__TFMG-assets-0__/tiles/ultralight-scaffolding/main.png",
          count = 1,
          size = 1,
          scale = 0.5,
        }
      },
      transition =
      {
        --background_layer_offset = 1,
        --background_layer_group = "zero",
        --offset_background_layer_by_tile_layer = true,
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
          o_transition =
          {
            spritesheet = "__space-age__/graphics/terrain/space-platform/space-platform-u-background.png",
            count = 4,
            scale = 0.5,
            tile_height = 8
          },
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
          },
        },
      },
      material_background = {
        picture = "__TFMG-assets-0__/tiles/ultralight-scaffolding/main.png",
        count = 1,
        scale = 0.5,
      },
      material_texture_width_in_tiles = 1,
      material_texture_height_in_tiles = 1,
    },
    walking_sound = base_tile_sounds.walking.concrete,
    build_sound = space_age_tile_sounds.building.space_platform,
    map_color = {63, 71, 69},
    scorch_mark_color = {r = 0.373, g = 0.307, b = 0.243, a = 1.000}
  },
})
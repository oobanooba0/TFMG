local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")
local movement_triggers = require("__base__.prototypes.entity.movement-triggers")


function create_scout_o_tron(arguments)
local scale = arguments.scale
local leg_scale = scale * arguments.leg_scale
local body_height = 2 * scale * leg_scale
local scout_o_tron_resistances ={}
local scout_o_tron_leg_resistances = util.table.deepcopy(scout_o_tron_resistances)
scout_o_tron_leg_resistances[4] = { type = "explosion", percent = 100 }

data:extend(
{
  {
    type = "spider-vehicle",
    name = arguments.name,
    collision_box = {{-1 * scale, -1 * scale}, {1 * scale, 1 * scale}},
    sticker_box = {{-1.5 * scale, -1.5 * scale}, {1.5 * scale, 1.5 * scale}},
    selection_box = {{-1 * scale, -1 * scale}, {1 * scale, 1 * scale}},
    drawing_box_vertical_extension = 3 * scale,
    icon = "__base__/graphics/icons/spidertron.png",
    mined_sound = sounds.deconstruct_large(0.8),
    open_sound = { filename = "__base__/sound/spidertron/spidertron-door-open.ogg", volume= 0.45 },
    close_sound = { filename = "__base__/sound/spidertron/spidertron-door-close.ogg", volume = 0.4 },
    working_sound =
    {
      sound = { filename = "__base__/sound/spidertron/spidertron-vox.ogg", volume = 0.35 },
      activate_sound = { filename = "__base__/sound/spidertron/spidertron-activate.ogg", volume = 0.5 },
      deactivate_sound = { filename = "__base__/sound/spidertron/spidertron-deactivate.ogg", volume = 0.5 },
      match_speed_to_activity = true,
      activity_to_speed_modifiers =
      {
        multiplier = 6.0,
        minimum = 1.0,
        offset = 0.93333333333
      }
    },
    weight = 1,
    braking_force = 1,
    friction_force = 1,
    flags = {"placeable-neutral", "player-creation", "placeable-off-grid"},
    minable = {mining_time = 1, result = arguments.name},
    max_health = 3000,
    resistances = util.table.deepcopy(scout_o_tron_resistances),
    minimap_representation =
    {
      filename = "__base__/graphics/entity/spidertron/spidertron-map.png",
      flags = {"icon"},
      size = {128, 128},
      scale = 0.5
    },
    selected_minimap_representation =
    {
      filename = "__base__/graphics/entity/spidertron/spidertron-map-selected.png",
      flags = {"icon"},
      size = {128, 128},
      scale = 0.5
    },
    corpse = "spidertron-remnants",
    dying_explosion = "spidertron-explosion",
    energy_per_hit_point = 1,
    guns = { "spidertron-rocket-launcher-1", "spidertron-rocket-launcher-2", "spidertron-rocket-launcher-3", "spidertron-rocket-launcher-4" },
    inventory_size = 80,
    equipment_grid = "spidertron-equipment-grid",
    trash_inventory_size = 20,
    height = body_height,
    alert_icon_shift = { 0, -body_height },
    torso_rotation_speed = 0.005,
    chunk_exploration_radius = 3,
    selection_priority = 60,
    graphics_set = spidertron_torso_graphics_set(scale),
    energy_source =
    {
      type = "void"
    },
    movement_energy_consumption = "250kW",
    automatic_weapon_cycling = true,
    chain_shooting_cooldown_modifier = 0.5,
    spider_engine =
    {
      legs =
      {
        { -- 1
          leg = arguments.name .. "-leg-1",
          mount_position = util.by_pixel(0  * scale, -10 * scale),
          ground_position = {0  * leg_scale, -2  * leg_scale},
          walking_group = 1,
          leg_hit_the_ground_trigger = get_leg_hit_the_ground_trigger()
        },
        { -- 2
          leg = arguments.name .. "-leg-2",
          mount_position = util.by_pixel(15  * scale, 10  * scale),
          ground_position = {2  * leg_scale, 1.5  * leg_scale},
          walking_group = 2,
          leg_hit_the_ground_trigger = get_leg_hit_the_ground_trigger()
        },
        { -- 3
          leg = arguments.name .. "-leg-3",
          mount_position = util.by_pixel(-15  * scale, 10  * scale),
          ground_position = {-2  * leg_scale, 1.5  * leg_scale},
          walking_group = 3,
          leg_hit_the_ground_trigger = get_leg_hit_the_ground_trigger()
        },
      },
    },
    is_military_target = true,
    allow_remote_driving = true,
  },
  make_spidertron_leg(arguments.name, leg_scale, arguments.leg_thickness, arguments.leg_movement_speed, 1, spidertron_leg_resistances),
  make_spidertron_leg(arguments.name, leg_scale, arguments.leg_thickness, arguments.leg_movement_speed, 2, spidertron_leg_resistances),
  make_spidertron_leg(arguments.name, leg_scale, arguments.leg_thickness, arguments.leg_movement_speed, 3, spidertron_leg_resistances),
})
end

create_scout_o_tron{
    name = "scout-o-tron",
    scale = 0.8,
    leg_scale = 1.8, -- relative to scale
    leg_thickness = 0.6, -- relative to leg_scale
    leg_movement_speed = 1,
}
local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")
local movement_triggers = require("__base__.prototypes.entity.movement-triggers")
local TFMG = require("__TFMG__.util.TFMG")

---scout o tron
  function create_scout_o_tron(arguments)
    local scale = arguments.scale
    local leg_scale = scale * arguments.leg_scale
    local body_height = 1.8 * scale * leg_scale
    local scout_o_tron_resistances ={}
    local scout_o_tron_leg_resistances = util.table.deepcopy(scout_o_tron_resistances)
    scout_o_tron_leg_resistances[4] = { type = "explosion", percent = 100 }

    data:extend({
      {--scout o tron
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
      surface_conditions = TFMG.conditions.not_space,
      weight = 1,
      braking_force = 1,
      friction_force = 1,
      flags = {"placeable-neutral", "player-creation", "placeable-off-grid"},
      minable = {mining_time = 1, result = arguments.name},
      max_health = 1000,
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
      inventory_size = 20,
      equipment_grid = "scout-o-tron-equipment-grid",
      trash_inventory_size = 10,
      height = body_height,
      alert_icon_shift = { 0, -body_height },
      torso_rotation_speed = 0.025,
      chunk_exploration_radius = 5,
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
        walking_group_overlap = 0.1,
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
      make_scout_o_tron_leg(arguments.name, leg_scale, arguments.leg_thickness, arguments.leg_movement_speed, 1, spidertron_leg_resistances),
      make_scout_o_tron_leg(arguments.name, leg_scale, arguments.leg_thickness, arguments.leg_movement_speed, 2, spidertron_leg_resistances),
      make_scout_o_tron_leg(arguments.name, leg_scale, arguments.leg_thickness, arguments.leg_movement_speed, 3, spidertron_leg_resistances),
    })
  end
  function make_scout_o_tron_leg(spidertron_name, scale, leg_thickness, movement_speed, number, leg_resistances)
    return
    {
      type = "spider-leg",
      name = spidertron_name .. "-leg-" .. number,
      hidden = true,
      localised_name = {"entity-name.scout'o'tron-leg"},
      collision_box = {{-0.05, -0.05}, {0.05, 0.05}},
      selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
      icon = "__base__/graphics/icons/spidertron.png",
      walking_sound_volume_modifier = 0.8,
      walking_sound_speed_modifier = 0.5,
      target_position_randomisation_distance = 0.25 * scale,
      minimal_step_size = 1 * scale,
      working_sound =
      {
        match_progress_to_activity = true,
        sound = sounds.spidertron_leg,
      },
      stretch_force_scalar = 3 / (3.5 * scale), -- longer legs, weaker stretch force
      knee_height = 2.5 * scale,
      knee_distance_factor = 0.4,
      initial_movement_speed = 0.06 * movement_speed,
      movement_acceleration = 0.03 * movement_speed,
      max_health = 100,
      resistances = util.table.deepcopy(leg_resistances),
      base_position_selection_distance = 6 * scale,
      movement_based_position_selection_distance = 6 * scale,
      selectable_in_game = false,
      alert_when_damaged = false,
      graphics_set = create_spidertron_leg_graphics_set(scale * leg_thickness, number)
    }
  end
  create_scout_o_tron{
      name = "scout-o-tron",
      scale = 0.75,
      leg_scale = 1.8, -- relative to scale
      leg_thickness = 0.6, -- relative to leg_scale
      leg_movement_speed = 2.5,
  }
--constructron
  function create_constructron(arguments)
    local scale = arguments.scale
    local leg_scale = scale * arguments.leg_scale
    local body_height = arguments.body_height * scale * leg_scale
    local constructron_resistances ={}
    local constructron_leg_resistances = util.table.deepcopy(constructron_resistances)
    constructron_leg_resistances[4] = { type = "explosion", percent = 100 }

    data:extend({
      {--constructron
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
            multiplier = 4.0,
            minimum = 0.5,
            offset = 0.93333333333
          }
        },
        weight = 2,
        braking_force = 1,
        friction_force = 1,
        flags = {"placeable-neutral", "player-creation", "placeable-off-grid"},
        surface_conditions = TFMG.conditions.not_space,
        minable = {mining_time = 1, result = arguments.name},
        max_health = 1000,
        resistances = util.table.deepcopy(constructron_resistances),
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
        inventory_size = 100,
        equipment_grid = "constructron-equipment-grid",
        trash_inventory_size = 20,
        height = body_height,
        alert_icon_shift = { 0, -body_height },
        torso_rotation_speed = 0.005,
        chunk_exploration_radius = 2,
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
          walking_group_overlap = 0,
          legs =
          {
            { -- 1
              leg = arguments.name .. "-leg-1",
              mount_position = util.by_pixel(15  * scale, -22 * scale),
              ground_position = {2.6  * leg_scale, -2.4  * leg_scale},
              walking_group = 1,
              leg_hit_the_ground_trigger = get_leg_hit_the_ground_trigger()
            },
            { -- 2
              leg = arguments.name .. "-leg-2",
              mount_position = util.by_pixel(23  * scale, -10  * scale),
              ground_position = {3  * leg_scale, -2.2  * leg_scale},
              walking_group = 2,
              leg_hit_the_ground_trigger = get_leg_hit_the_ground_trigger()
            },
            { -- 3
              leg = arguments.name .. "-leg-3",
              mount_position = util.by_pixel(25  * scale, 4  * scale),
              ground_position = {3  * leg_scale, 2.2  * leg_scale},
              walking_group = 1,
              leg_hit_the_ground_trigger = get_leg_hit_the_ground_trigger()
            },
            { -- 4
              leg = arguments.name .. "-leg-4",
              mount_position = util.by_pixel(15  * scale, 17  * scale),
              ground_position = {2.6  * leg_scale, 2.4  * leg_scale},
              walking_group = 2,
              leg_hit_the_ground_trigger = get_leg_hit_the_ground_trigger()
            },
            { -- 5
              leg = arguments.name .. "-leg-5",
              mount_position = util.by_pixel(-15 * scale, -22 * scale),
              ground_position = {-2.6 * leg_scale, -2.4 * leg_scale},
              walking_group = 2,
              leg_hit_the_ground_trigger = get_leg_hit_the_ground_trigger()
            },
            { -- 6
              leg = arguments.name .. "-leg-6",
              mount_position = util.by_pixel(-23 * scale, -10 * scale),
              ground_position = {-3 * leg_scale, -2.2 * leg_scale},
              walking_group = 1,
              leg_hit_the_ground_trigger = get_leg_hit_the_ground_trigger()
            },
            { -- 7
              leg = arguments.name .. "-leg-7",
              mount_position = util.by_pixel(-25 * scale, 4 * scale),
              ground_position = {-3 * leg_scale, 2.2 * leg_scale},
              walking_group = 1,
              leg_hit_the_ground_trigger = get_leg_hit_the_ground_trigger()
            },
            { -- 8
              leg = arguments.name .. "-leg-8",
              mount_position = util.by_pixel(-15 * scale, 17 * scale),
              ground_position = {-2.6 * leg_scale, 2.4 * leg_scale},
              walking_group = 2,
              leg_hit_the_ground_trigger = get_leg_hit_the_ground_trigger()
            }
          },
        },
      is_military_target = true,
      allow_remote_driving = true,
      },
      make_constructron_leg(arguments.name, leg_scale, arguments.leg_thickness, arguments.leg_movement_speed, 1, spidertron_leg_resistances),
      make_constructron_leg(arguments.name, leg_scale, arguments.leg_thickness, arguments.leg_movement_speed, 2, spidertron_leg_resistances),
      make_constructron_leg(arguments.name, leg_scale, arguments.leg_thickness, arguments.leg_movement_speed, 3, spidertron_leg_resistances),
      make_constructron_leg(arguments.name, leg_scale, arguments.leg_thickness, arguments.leg_movement_speed, 4, spidertron_leg_resistances),
      make_constructron_leg(arguments.name, leg_scale, arguments.leg_thickness, arguments.leg_movement_speed, 5, spidertron_leg_resistances),
      make_constructron_leg(arguments.name, leg_scale, arguments.leg_thickness, arguments.leg_movement_speed, 6, spidertron_leg_resistances),
      make_constructron_leg(arguments.name, leg_scale, arguments.leg_thickness, arguments.leg_movement_speed, 7, spidertron_leg_resistances),
      make_constructron_leg(arguments.name, leg_scale, arguments.leg_thickness, arguments.leg_movement_speed, 8, spidertron_leg_resistances),
    })
  end
  function make_constructron_leg(spidertron_name, scale, leg_thickness, movement_speed, number, leg_resistances)
    return
    {
      type = "spider-leg",
      name = spidertron_name .. "-leg-" .. number,
      hidden = true,
      localised_name = {"entity-name.constructron-leg"},
      collision_box = {{-0.05, -0.05}, {0.05, 0.05}},
      selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
      icon = "__base__/graphics/icons/spidertron.png",
      walking_sound_volume_modifier = 0.8,
      walking_sound_speed_modifier = 0.5,
      target_position_randomisation_distance = 0.25 * scale,
      minimal_step_size = 0.5 * scale,
      working_sound =
      {
        match_progress_to_activity = true,
        sound = sounds.spidertron_leg,
      },
      stretch_force_scalar = 2.5 / (3.5 * scale), -- longer legs, weaker stretch force
      knee_height = 1.7 * scale,
      knee_distance_factor = 0.4,
      initial_movement_speed = 0.06 * movement_speed,
      movement_acceleration = 0.03 * movement_speed,
      max_health = 100,
      resistances = util.table.deepcopy(leg_resistances),
      base_position_selection_distance = 6 * scale,
      movement_based_position_selection_distance = 4 * scale,
      selectable_in_game = false,
      alert_when_damaged = false,
      graphics_set = create_spidertron_leg_graphics_set(scale * leg_thickness, number)
    }
  end
  create_constructron{
    name = "constructron",
    scale = 1.3,
    leg_scale = 0.9, -- relative to scale
    leg_thickness = 1.5, -- relative to leg_scale
    leg_movement_speed = 1,
    body_height = 1,
  } 
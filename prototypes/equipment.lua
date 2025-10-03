data:extend({
    {--roboport 1
    type = "roboport-equipment",
    name = "roboport-1-equipment",
    take_result = "roboport-1",
    sprite =
    {
      filename = "__base__/graphics/equipment/personal-roboport-equipment.png",
      width = 128,
      height = 128,
      priority = "medium",
      scale = 0.5
    },
    shape =
    {
      width = 2,
      height = 2,
      type = "full"
    },
    energy_source =
    {
      type = "electric",
      buffer_capacity = "16MJ",
      input_flow_limit = "2MW",
      usage_priority = "secondary-input"
    },
    charging_energy = "1MW",
    robot_limit = 8,
    construction_radius = 16,
    spawn_and_station_height = 0.4,
    spawn_and_station_shadow_height_offset = 0.5,
    charge_approach_distance = 2.6,
    robots_shrink_when_entering_and_exiting = true,

    recharging_animation =
    {
      filename = "__base__/graphics/entity/roboport/roboport-recharging.png",
      draw_as_glow = true,
      priority = "high",
      width = 37,
      height = 35,
      frame_count = 16,
      scale = 1.5,
      animation_speed = 0.5
    },
    recharging_light = {intensity = 0.2, size = 3, color = {r = 0.5, g = 0.5, b = 1.0}},
    stationing_offset = {0, -0.6},
    charging_station_shift = {0, 0.5},
    charging_station_count = 2,
    charging_station_count_affected_by_quality = true,
    charging_distance = 1.6,
    charging_threshold_distance = 5,
    categories = {"spider"}
  },
  {--solar cell 1
    type = "solar-panel-equipment",
    name = "solar-cell-equipment",
    take_result = "solar-cell",
    performance_at_day = 1,
    performance_at_night = 0.2,--these solar panels work at night so you dont get hardstuck
    sprite =
    {
      filename = "__base__/graphics/equipment/solar-panel-equipment.png",
      width = 64,
      height = 64,
      priority = "medium",
      scale = 1
    },
    shape =
    {
      width = 3,
      height = 1,
      type = "full"
    },
    energy_source =
    {
      type = "electric",
      usage_priority = "primary-output"
    },
    power = "500kW",
    categories = {"spider"}
  },
  {
    type = "movement-bonus-equipment",
    name = "mechanical-leg-equipment",
    take_result = "mechanical-leg",
    sprite =
    {
      filename = "__base__/graphics/equipment/exoskeleton-equipment.png",
      width = 128,
      height = 256,
      priority = "medium",
      scale = 0.5
    },
    shape =
    {
      width = 1,
      height = 3,
      type = "full"
    },
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input"
    },
    energy_consumption = "100kW",
    movement_bonus = 0.25,
    categories = {"spider"}
  },
  {--capacitor
    type = "battery-equipment",
    name = "capacitor-equipment",
    take_result = "capacitor-discharged",
    sprite =
    {
      filename = "__TFMG-assets-0__/icons/items/capacitor-charged.png",
      width = 64,
      height = 64,
      priority = "medium",
      scale = 0.5
    },
    shape =
    {
      width = 1,
      height = 2,
      type = "full"
    },
    energy_source =
    {
      type = "electric",
      buffer_capacity = "15MJ",
      usage_priority = "tertiary"
    },
    categories = {"spider"}
  },
})
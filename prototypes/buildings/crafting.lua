local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")
local simulations = require("__base__.prototypes.factoriopedia-simulations")
--vanilla building updates.
  local mining_drill = data.raw["mining-drill"]["electric-mining-drill"]
  mining_drill.mining_speed = 1
  mining_drill.energy_usage = "0.5MW"
  mining_drill.module_slots = 4
  local pumpjack = data.raw["mining-drill"]["pumpjack"]
  pumpjack.energy_usage = "1MW"
  pumpjack.module_slots = 4
--rocket silo updates
local function rocketsilopipes()--borrowed from talander
	return {
		north = {
			filename = "__TFMG-assets-0__/buildings/rocket-silo/rocketsilopipe-N.png",
			priority = "extra-high",
			width = 71,
			height = 76,
			shift = util.by_pixel(2.25, 23),
			scale = 0.5,
		},
		east = {
			filename = "__TFMG-assets-0__/buildings/rocket-silo/rocketsilopipe-E.png",
			priority = "extra-high",
			width = 42,
			height = 76,
			shift = util.by_pixel(-24.5, 1),
			scale = 0.5,
		},
		south = {
			filename = "__TFMG-assets-0__/buildings/rocket-silo/rocketsilopipe-S.png",
			priority = "extra-high",
			width = 88,
			height = 61,
			shift = util.by_pixel(0, -31.25),
			scale = 0.5,
		},
		west = {
			filename = "__TFMG-assets-0__/buildings/rocket-silo/rocketsilopipe-W.png",
			priority = "extra-high",
			width = 39,
			height = 73,
			shift = util.by_pixel(25.75, 1.25),
			scale = 0.5,
		},
	}
end

local rocket_silo = table.deepcopy(data.raw["rocket-silo"]["rocket-silo"])
rocket_silo.fixed_recipe = nil
rocket_silo.rocket_parts_required = 100
rocket_silo.fluid_boxes = {
  {
    production_type = "input",
    pipe_picture = rocketsilopipes(),
    pipe_covers = pipecoverspictures(),
    volume = 200,
    pipe_connections = {
      { flow_direction = "input", direction = defines.direction.north, position = { 2, -4 }},
      { flow_direction = "input", direction = defines.direction.east, position = { 4, 2 }},
      { flow_direction = "input", direction = defines.direction.south, position = { -2, 4 }},
      { flow_direction = "input", direction = defines.direction.west, position = { -4, -2 }}
      },
  },
  {
    production_type = "input",
    pipe_picture = rocketsilopipes(),
    pipe_covers = pipecoverspictures(),
    volume = 200,
    pipe_connections = {
      { flow_direction = "input", direction = defines.direction.north, position = { -2, -4 }},
      { flow_direction = "input", direction = defines.direction.east, position = { 4, -2 }},
      { flow_direction = "input", direction = defines.direction.south, position = { 2, 4 }},
      { flow_direction = "input", direction = defines.direction.west, position = { -4, 2 }}
      },
    }
  }
data:extend{rocket_silo}

--Supercomputer combinators
  local pixel = 1/32
  local supercomputer_input = table.deepcopy(data.raw["constant-combinator"]["constant-combinator"])
  supercomputer_input.name = "supercomputer-input"
  supercomputer_input.collision_mask = {layers = {},not_colliding_with_itself = true}
  supercomputer_input.minable = nil
  supercomputer_input.hidden = true
  supercomputer_input.hidden_in_factoriopedia = true
  supercomputer_input.selection_priority = 51
  supercomputer_input.sprites =
    make_4way_animation_from_spritesheet({ layers =
      {
        {
          scale = 0.5,
          filename = "__TFMG-assets-0__/buildings/supercomputer/supercomputer-input.png",
          width = 114,
          height = 102,
        },
        {
          scale = 0.5,
          filename = "__base__/graphics/entity/combinator/constant-combinator-shadow.png",
          width = 98,
          height = 66,
          shift = util.by_pixel(8.5, 1.5),
          draw_as_shadow = true
        }
      }
    })
  data:extend{supercomputer_input}
  
  local supercomputer_output = table.deepcopy(data.raw["constant-combinator"]["constant-combinator"])
  supercomputer_output.name = "supercomputer-output"
  supercomputer_output.collision_mask = {layers = {},not_colliding_with_itself = true}
  supercomputer_output.minable = nil
  supercomputer_output.hidden = true
  supercomputer_output.hidden_in_factoriopedia = true
  supercomputer_output.selection_priority = 51
  supercomputer_output.sprites =
    make_4way_animation_from_spritesheet({ layers =
      {
        {
          scale = 0.5,
          filename = "__TFMG-assets-0__/buildings/supercomputer/supercomputer-output.png",
          width = 114,
          height = 102,
        },
        {
          scale = 0.5,
          filename = "__base__/graphics/entity/combinator/constant-combinator-shadow.png",
          width = 98,
          height = 66,
          shift = util.by_pixel(8.5, 1.5),
          draw_as_shadow = true
        }
      }
    })
  data:extend{supercomputer_output}
--supercomputer graphics definition
  local function rotate(coordinate)--rotate a pair of coordinates 90 degrees around 0,0
    local rotated_coordinate = {-coordinate[2],coordinate[1]}
  return rotated_coordinate end

  local function mirror(coordinate)--flip a pair of coordinates along the x axis
      local mirrored_coordinate = {-coordinate[1],coordinate[2]}
  return mirrored_coordinate end

  local function supercomputer_graphics(direction,flip)
    local computer_base = {
        filename = "__Krastorio2Assets__/buildings/quantum-computer/quantum-computer.png",
        priority = "high",
        width = 400,
        height = 420,
        shift = { 0, -0.2 },
        frame_count = 48,
        line_length = 8,
        animation_speed = 0.25,
        scale = 0.90,
      }
    local computer_shadow = {
        filename = "__Krastorio2Assets__/buildings/quantum-computer/quantum-computer-sh.png",
        priority = "medium",
        width = 402,
        height = 362,
        shift = { 0.19, 0.315 },
        frame_count = 1,
        repeat_count = 48,
        draw_as_shadow = true,
        animation_speed = 0.25,
        scale = 0.90,
      }
    local width = 114
    local height = 102
    local input_shift = {3, 5}
    local output_shift = {-3, 5}
    if flip then
      input_shift = mirror(input_shift)
      output_shift = mirror(output_shift)
    end
    for i = 1,direction do
      input_shift = rotate(input_shift)
      output_shift = rotate(output_shift)
    end
    direction = direction + 2
    if direction >= 4 then direction = direction - 4 end
    return {
      computer_base,
      {
        scale = 0.5,
        filename = "__TFMG-assets-0__/buildings/supercomputer/supercomputer-input.png",
        width = width,
        x = width * direction,
        height = height,
        shift = input_shift,
        frame_count = 1,
        repeat_count = 48,
      },
      {
        scale = 0.5,
        filename = "__TFMG-assets-0__/buildings/supercomputer/supercomputer-output.png",
        width = width,
        x = width * direction,
        height = height,
        shift = output_shift,
        frame_count = 1,
        repeat_count = 48,
      },
      computer_shadow,
    }
  end
  local supercomputer_working_visualisations = {
    {
      draw_as_light = true,
      animation = {
        filename = "__Krastorio2Assets__/buildings/quantum-computer/quantum-computer-light.png",
        priority = "extra-high",
        width = 400,
        height = 420,
        shift = { 0, -0.2 },
        frame_count = 48,
        line_length = 8,
        animation_speed = 0.25,
        scale = 0.90,
      },
    },
    {
      draw_as_glow = true,
      blend_mode = "additive-soft",
      animation = {
        filename = "__Krastorio2Assets__/buildings/quantum-computer/quantum-computer-glow.png",
        priority = "extra-high",
        width = 400,
        height = 420,
        shift = { 0, -0.2 },
        frame_count = 48,
        line_length = 8,
        animation_speed = 0.25,
        scale = 0.90,
      },
    },
    {
      light = {
        intensity = 0.85,
        size = 5,
        shift = { 0.0, 0.0 },
        color = { r = 0.35, g = 0.75, b = 1 },
      },
    },
  }

--TFMG buildings
data:extend({
  {--matter reconstructor
    type = "assembling-machine",
    name = "matter-reconstructor",
    icon = "__Krastorio2Assets__/icons/entities/stabilizer-charging-station.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = "matter-reconstructor"},
    max_health = 1000,
    corpse = "assembling-machine-1-remnants",
    dying_explosion = "assembling-machine-1-remnants",
    icon_draw_specification = {shift = {0, -0.5}},
    icons_positioning =
    {
      {inventory_index = defines.inventory.crafter_modules, shift = {0,0.2}, max_icons_per_row = 4, scale = 0.3}
    },
    collision_box = {{-0.7, -0.7}, {0.7, 0.7}},
    selection_box = {{-0.9, -0.9}, {0.9, 0.9}},
    damaged_trigger_effect = hit_effects.entity(),
    circuit_wire_max_distance = assembling_machine_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions["assembling-machine"],
    alert_icon_shift = util.by_pixel(0, -12),
    graphics_set = {
      animation = {
        layers = {
          {
            filename = "__Krastorio2Assets__/buildings/stabilizer-charging-station/stabilizer-charging-station.png",
            priority = "high",
            width = 170,
            height = 170,
            frame_count = 80,
            line_length = 10,
            animation_speed = 0.4,
            scale = 0.4,
          },
          {
            filename = "__Krastorio2Assets__/buildings/stabilizer-charging-station/stabilizer-charging-station-sh.png",
            priority = "high",
            width = 170,
            height = 144,
            frame_count = 80,
            line_length = 8,
            animation_speed = 0.4,
            shift = { 0.23, 0.262 },
            draw_as_shadow = true,
            scale = 0.4,
          },
        },
      },
      water_reflection = {
        pictures = {
          filename = "__Krastorio2Assets__/buildings/stabilizer-charging-station/stabilizer-charging-station-reflection.png",
          priority = "extra-high",
          width = 20,
          height = 25,
          shift = util.by_pixel(0, 40),
          variation_count = 1,
          scale = 5,
        },
        rotate = false,
        orientation_to_variation = false,
      },
      working_visualisations = {
        {
          animation = {
            filename = "__Krastorio2Assets__/buildings/stabilizer-charging-station/stabilizer-charging-station-light.png",
            priority = "high",
            width = 170,
            height = 170,
            frame_count = 80,
            line_length = 10,
            animation_speed = 0.4,
            scale = 0.4,
            draw_as_light = true,
          },
        },
      },
    },
    crafting_categories = {
      "matter-reconstructor",
      "assembling-machine"
    },
    crafting_speed = 10,
    energy_source =
    {
      type = "electric",
    usage_priority = "secondary-input",
    emissions_per_minute = { pollution = 1 }
    },
    energy_usage = "0.5MW",
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    module_slots = 12,
    allowed_effects = { "consumption", "speed", "productivity", "pollution" , "quality"},
    impact_category = "metal",
    working_sound =
    {
      sound = {filename = "__base__/sound/assembling-machine-t1-1.ogg", volume = 0.5, audible_distance_modifier = 0.5},
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },
    TFMG_thermal = {
      max_working_temperature = 1024,
      max_safe_temperature = 1337,
      heat_ratio = 0.01,
      surface_conditions = {
        {
        property = "pressure",
        min = 0,
        max = 0,
        }
      },
      connections = {
        { position = {-0.5, -0.5}, direction = 0},
        { position = {0.5, -0.5}, direction = 4},
        { position = {0.5, 0.5}, direction = 8},
        { position = {-0.5, 0.5}, direction = 12},
      },
    }
  },
  {--Assembling machine
    type = "assembling-machine",
    name = "assembling-machine",
    icon = "__base__/graphics/icons/assembling-machine-3.png",
    flags = {"placeable-neutral","placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = "assembling-machine"},
    max_health = 400,
    corpse = "assembling-machine-3-remnants",
    dying_explosion = "assembling-machine-3-explosion",
    icon_draw_specification = {shift = {0, -0.3}},
    circuit_wire_max_distance = assembling_machine_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions["assembling-machine"],
    alert_icon_shift = util.by_pixel(0, -12),
    fluid_boxes =
    {
      {
        production_type = "input",
        pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections = {{ flow_direction="input", direction = defines.direction.north, position = {0, -1}}},
        secondary_draw_orders = { north = -1 },
      },
      {
        production_type = "output",
        pipe_picture = assembler3pipepictures(),
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections = {{ flow_direction="output", direction = defines.direction.south, position = {0, 1}}},
        secondary_draw_orders = { north = -1 },
      },
    },
    fluid_boxes_off_when_no_fluid_recipe = true,
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    impact_category = "metal",
    working_sound =
    {
      sound = {filename = "__base__/sound/assembling-machine-t3-1.ogg", volume = 0.45, audible_distance_modifier = 0.5},
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    damaged_trigger_effect = hit_effects.entity(),
    drawing_box_vertical_extension = 0.2,
    graphics_set =
    {
      animation_progress = 0.5,
      animation =
      {
        layers =
        {
          {
            filename = "__base__/graphics/entity/assembling-machine-3/assembling-machine-3.png",
            priority = "high",
            width = 214,
            height = 237,
            frame_count = 32,
            line_length = 8,
            shift = util.by_pixel(0, -0.75),
            scale = 0.5
          },
          {
            filename = "__base__/graphics/entity/assembling-machine-3/assembling-machine-3-shadow.png",
            priority = "high",
            width = 260,
            height = 162,
            frame_count = 32,
            line_length = 8,
            draw_as_shadow = true,
            shift = util.by_pixel(28, 4),
            scale = 0.5
          }
        }
      }
    },
    crafting_categories = {
      "assembling-machine","assembling-machine-pure"
    },
    crafting_speed = 1,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = { pollution = 2 },
    },
    energy_usage = "1MW",
    module_slots = 6,
    allowed_effects = {"consumption", "speed", "productivity", "pollution", "quality"},
    TFMG_thermal = {
      max_working_temperature = 250,
      max_safe_temperature = 350,
      heat_ratio = 0.5,
      surface_conditions = {
        {
        property = "pressure",
        min = 0,
        max = 0,
        }
      },
      connections = {
        { position = {0, -1}, direction = 0},
        { position = {1, 0}, direction = 4},
        { position = {0, 1}, direction = 8},
        { position = {-1, 0}, direction = 12},
      },
    }
  },
  {--furnace
    type = "furnace",
    name = "furnace",
    icon = "__base__/graphics/icons/electric-furnace.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = "furnace"},
    circuit_wire_max_distance = furnace_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions["electric-furnace"],
    max_health = 350,
    corpse = "electric-furnace-remnants",
    dying_explosion = "electric-furnace-explosion",
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    damaged_trigger_effect = hit_effects.entity(),
    icon_draw_specification = {shift = {0, -0.1}},
    icons_positioning =
    {
      {inventory_index = defines.inventory.crafter_modules, shift = {0, 0.8}, max_icons_per_row = 4}
    },
    module_slots = 4,
    allowed_effects = {"consumption", "speed", "productivity", "pollution", "quality"},
    crafting_categories = {"furnace"},
    result_inventory_size = 1,
    crafting_speed = 1,
    energy_usage = "2.5MW",
    source_inventory_size = 1,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = { pollution = 1 }
    },
    impact_category = "metal",
    open_sound = sounds.electric_large_open,
    close_sound = sounds.electric_large_close,
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/electric-furnace.ogg",
        volume = 0.85,
        modifiers = volume_multiplier("main-menu", 4.2),
        advanced_volume_control = {attenuation = "exponential"},
        audible_distance_modifier = 0.7,
      },
      max_sounds_per_prototype = 4,
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },
    graphics_set =
    {
      animation =
      {
        layers =
        {
          {
            filename = "__base__/graphics/entity/electric-furnace/electric-furnace.png",
            priority = "high",
            width = 239,
            height = 219,
            shift = util.by_pixel(0.75, 5.75),
            scale = 0.5
          },
          {
            filename = "__base__/graphics/entity/electric-furnace/electric-furnace-shadow.png",
            priority = "high",
            width = 227,
            height = 171,
            draw_as_shadow = true,
            shift = util.by_pixel(11.25, 7.75),
            scale = 0.5
          }
        }
      },
      working_visualisations =
      {
        {
          fadeout = true,
          animation =
          {
            layers =
            {
              {
                filename = "__base__/graphics/entity/electric-furnace/electric-furnace-heater.png",
                priority = "high",
                width = 60,
                height = 56,
                frame_count = 12,
                animation_speed = 0.5,
                draw_as_glow = true,
                shift = util.by_pixel(1.75, 32.75),
                scale = 0.5
              },
              {
                filename = "__base__/graphics/entity/electric-furnace/electric-furnace-light.png",
                blend_mode = "additive",
                width = 202,
                height = 202,
                repeat_count = 12,
                draw_as_glow = true,
                shift = util.by_pixel(1, 0),
                scale = 0.5,
              },
            }
          },
        },
        {
          fadeout = true,
          animation =
          {
            filename = "__base__/graphics/entity/electric-furnace/electric-furnace-ground-light.png",
            blend_mode = "additive",
            width = 166,
            height = 124,
            draw_as_light = true,
            shift = util.by_pixel(3, 69),
            scale = 0.5,
          },
        },
        {
          animation =
          {
            filename = "__base__/graphics/entity/electric-furnace/electric-furnace-propeller-1.png",
            priority = "high",
            width = 37,
            height = 25,
            frame_count = 4,
            animation_speed = 0.5,
            shift = util.by_pixel(-20.5, -18.5),
            scale = 0.5
          }
        },
        {
          animation =
          {
            filename = "__base__/graphics/entity/electric-furnace/electric-furnace-propeller-2.png",
            priority = "high",
            width = 23,
            height = 15,
            frame_count = 4,
            animation_speed = 0.5,
            shift = util.by_pixel(3.5, -38),
            scale = 0.5
          }
        }
      },
      water_reflection =
      {
        pictures =
        {
          filename = "__base__/graphics/entity/electric-furnace/electric-furnace-reflection.png",
          priority = "extra-high",
          width = 24,
          height = 24,
          shift = util.by_pixel(5, 40),
          variation_count = 1,
          scale = 5
        },
        rotate = false,
        orientation_to_variation = false
      }
    },
    TFMG_thermal = {
      max_working_temperature = 400,
      max_safe_temperature = 500,
      heat_ratio = 0.8,
      surface_conditions = {
        {
        property = "pressure",
        min = 0,
        max = 0,
        }
      },
      connections = {--totally pointless, as this is the default connection set in TFMG_thermal, but it feels wrong not to define it explicitly
        { position = {1, -1}, direction = 0},
        { position = {-1, -1}, direction = 0},
        { position = {1, 1}, direction = 4},
        { position = {1, -1}, direction = 4},
        { position = {1, 1}, direction = 8},
        { position = {-1, 1}, direction = 8},
        { position = {-1, 1}, direction = 12},
        { position = {-1, -1}, direction = 12},
      },
    }
  },
  {--supercomputer
    type = "assembling-machine",
    name = "supercomputer",
    icon = "__Krastorio2Assets__/icons/entities/quantum-computer.png",
    flags = {"placeable-neutral","placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = "supercomputer"},
    max_health = 400,
    corpse = "assembling-machine-2-remnants",
    dying_explosion = "assembling-machine-2-explosion",
    icon_draw_specification = {shift = {0, -0.3}, scale = 2},
    icons_positioning =
    {
      {inventory_index = defines.inventory.crafter_modules, shift = {0, 1.2}, max_icons_per_row = 5}
    },
    circuit_wire_max_distance = assembling_machine_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions["assembling-machine"], --leaving this,since circuit connections may still be useful to the player
    alert_icon_shift = util.by_pixel(0, -12),
    resistances =
    {
      {
        type = "fire",
        percent = 70
      }
    },
    fluid_boxes =--ill have to do something with these at some point. but enabling these is required to make this entity rotatable
    {
      {
        production_type = "input",
        --pipe_picture = assembler2pipepictures(),
        --pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections = {{ flow_direction="input", direction = defines.direction.north, position = {3, 5} }},
        secondary_draw_orders = { north = -1 },
        draw_only_when_connected = true,
      },
      {
        production_type = "output",
        --pipe_picture = assembler2pipepictures(),
        --pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections = {{ flow_direction="output", direction = defines.direction.north, position = {-3, 5} }},
        secondary_draw_orders = { north = -1 },
        draw_only_when_connected = true,
      }
    },
    fluid_boxes_off_when_no_fluid_recipe = false,
    open_sound = { filename = "__Krastorio2Assets__/sounds/buildings/open.ogg", volume = 1 },
    close_sound = { filename = "__Krastorio2Assets__/sounds/buildings/close.ogg", volume = 1 },
    --id love a working sound, but its awful.
    impact_category = "metal",
    collision_box = {{-5.2, -5.2}, {5.2, 5.2}},
    selection_box = {{-5.5, -5.5}, {5.5, 5.5}},
    damaged_trigger_effect = hit_effects.entity(),
    drawing_box_vertical_extension = 0.2,
    graphics_set = {--this is a pain in the ass, but whatever
      animation = {
        north = { layers = supercomputer_graphics(0,false), },
        east = { layers = supercomputer_graphics(1,false), },
        south = { layers = supercomputer_graphics(2,false), },
        west = { layers = supercomputer_graphics(3,false), },
      },
      working_visualisations = supercomputer_working_visualisations
    },
    graphics_set_flipped = {
      animation = {
        north = { layers = supercomputer_graphics(0,true), },
        east = { layers = supercomputer_graphics(1,true), },
        south = { layers = supercomputer_graphics(2,true), },
        west = { layers = supercomputer_graphics(3,true), },
      },
      working_visualisations = supercomputer_working_visualisations
    },
    crafting_categories = {
      "supercomputer"
    },
    crafting_speed = 60,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = { pollution = 2 },
    },
    energy_usage = "100MW",
    module_slots = 5,
    allowed_effects = {"pollution", "quality", "consumption"},
    TFMG_thermal = {
      max_working_temperature = 105,
      max_safe_temperature = 120,
      heat_ratio = 1,
      connections = {
        { position = {-4, -5}, direction = 0},
        { position = {-2, -5}, direction = 0},
        { position = {0, -5}, direction = 0},
        { position = {2, -5}, direction = 0},
        { position = {4, -5}, direction = 0},
      },
    },
  },
  {--chemistry-plant
    type = "assembling-machine",
    name = "chemistry-plant",
    icon = "__base__/graphics/icons/chemical-plant.png",
    flags = {"placeable-neutral","placeable-player", "player-creation"},
    minable = {mining_time = 0.1, result = "chemistry-plant"},
    max_health = 300,
    corpse = "chemical-plant-remnants",
    dying_explosion = "chemical-plant-explosion",
    icon_draw_specification = {shift = {0, -0.3}},
    icons_positioning =
    {
      {inventory_index = defines.inventory.crafter_modules, max_icons_per_row = 4}
    },
    circuit_wire_max_distance = assembling_machine_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions["chemical-plant"],
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    damaged_trigger_effect = hit_effects.entity(),
    drawing_box_vertical_extension = 0.4,
    graphics_set =
    {
      animation = make_4way_animation_from_spritesheet({ layers =
      {
        {
          filename = "__base__/graphics/entity/chemical-plant/chemical-plant.png",
          width = 220,
          height = 292,
          frame_count = 24,
          line_length = 12,
          shift = util.by_pixel(0.5, -9),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/chemical-plant/chemical-plant-shadow.png",
          width = 312,
          height = 222,
          repeat_count = 24,
          shift = util.by_pixel(27, 6),
          draw_as_shadow = true,
          scale = 0.5
        }
      }}),
      working_visualisations =
      {
        {
          apply_recipe_tint = "primary",
          north_animation =
          {
            filename = "__base__/graphics/entity/chemical-plant/chemical-plant-liquid-north.png",
            frame_count = 24,
            line_length = 6,
            width = 66,
            height = 44,
            shift = util.by_pixel(23, 15),
            scale = 0.5
          },
          east_animation =
          {
            filename = "__base__/graphics/entity/chemical-plant/chemical-plant-liquid-east.png",
            frame_count = 24,
            line_length = 6,
            width = 70,
            height = 36,
            shift = util.by_pixel(0, 22),
            scale = 0.5
          },
          south_animation =
          {
            filename = "__base__/graphics/entity/chemical-plant/chemical-plant-liquid-south.png",
            frame_count = 24,
            line_length = 6,
            width = 66,
            height = 42,
            shift = util.by_pixel(0, 17),
            scale = 0.5
          },
          west_animation =
          {
            filename = "__base__/graphics/entity/chemical-plant/chemical-plant-liquid-west.png",
            frame_count = 24,
            line_length = 6,
            width = 74,
            height = 36,
            shift = util.by_pixel(-10, 13),
            scale = 0.5
          }
        },
        {
          apply_recipe_tint = "secondary",
          north_animation =
          {
            filename = "__base__/graphics/entity/chemical-plant/chemical-plant-foam-north.png",
            frame_count = 24,
            line_length = 6,
            width = 62,
            height = 42,
            shift = util.by_pixel(24, 15),
            scale = 0.5
          },
          east_animation =
          {
            filename = "__base__/graphics/entity/chemical-plant/chemical-plant-foam-east.png",
            frame_count = 24,
            line_length = 6,
            width = 68,
            height = 36,
            shift = util.by_pixel(0, 22),
            scale = 0.5
          },
          south_animation =
          {
            filename = "__base__/graphics/entity/chemical-plant/chemical-plant-foam-south.png",
            frame_count = 24,
            line_length = 6,
            width = 60,
            height = 40,
            shift = util.by_pixel(1, 17),
            scale = 0.5
          },
          west_animation =
          {
            filename = "__base__/graphics/entity/chemical-plant/chemical-plant-foam-west.png",
            frame_count = 24,
            line_length = 6,
            width = 68,
            height = 28,
            shift = util.by_pixel(-9, 15),
            scale = 0.5
          }
        },
        {
          apply_recipe_tint = "tertiary",
          fadeout = true,
          constant_speed = true,
          north_position = util.by_pixel_hr(-30, -161),
          east_position = util.by_pixel_hr(29, -150),
          south_position = util.by_pixel_hr(12, -134),
          west_position = util.by_pixel_hr(-32, -130),
          render_layer = "wires",
          animation =
          {
            filename = "__base__/graphics/entity/chemical-plant/chemical-plant-smoke-outer.png",
            frame_count = 47,
            line_length = 16,
            width = 90,
            height = 188,
            animation_speed = 0.5,
            shift = util.by_pixel(-2, -40),
            scale = 0.5
          }
        },
        {
          apply_recipe_tint = "quaternary",
          fadeout = true,
          constant_speed = true,
          north_position = util.by_pixel_hr(-30, -161),
          east_position = util.by_pixel_hr(29, -150),
          south_position = util.by_pixel_hr(12, -134),
          west_position = util.by_pixel_hr(-32, -130),
          render_layer = "wires",
          animation =
          {
            filename = "__base__/graphics/entity/chemical-plant/chemical-plant-smoke-inner.png",
            frame_count = 47,
            line_length = 16,
            width = 40,
            height = 84,
            animation_speed = 0.5,
            shift = util.by_pixel(0, -14),
            scale = 0.5
          }
        }
      }
    },
    impact_category = "metal-large",
    open_sound = {filename = "__base__/sound/open-close/fluid-open.ogg", volume = 0.55},
    close_sound = {filename = "__base__/sound/open-close/fluid-close.ogg", volume = 0.54},
    working_sound =
    {
      sound = sound_variations("__base__/sound/chemical-plant", 3, 0.5),
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },
    crafting_speed = 1,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = { pollution = 4 }
    },
    energy_usage = "2MW",
    crafting_categories = {"chemistry-plant"},
    module_slots = 4,
    allowed_effects = {"consumption", "speed", "productivity", "pollution", "quality"},
    fluid_boxes =
    {
      {
        production_type = "input",
        pipe_covers = pipecoverspictures(),
        volume = 200,
        pipe_connections =
        {
          {
            flow_direction="input",
            direction = defines.direction.north,
            position = {-1, -1}
          }
        }
      },
      {
        production_type = "input",
        pipe_covers = pipecoverspictures(),
        volume = 200,
        pipe_connections =
        {
          {
            flow_direction="input",
            direction = defines.direction.north,
            position = {1, -1}
          }
        }
      },
      {
        production_type = "input",
        pipe_covers = pipecoverspictures(),
        volume = 200,
        pipe_connections =
        {
          {
            flow_direction="input",
            direction = defines.direction.west,
            position = {-1, 0}
          }
        }
      },
      {
        production_type = "output",
        pipe_covers = pipecoverspictures(),
        volume = 200,
        pipe_connections =
        {
          {
            flow_direction = "output",
            direction = defines.direction.south,
            position = {-1, 1}
          }
        }
      },
      {
        production_type = "output",
        pipe_covers = pipecoverspictures(),
        volume = 100,
        pipe_connections =
        {
          {
            flow_direction = "output",
            direction = defines.direction.south,
            position = {1, 1}
          }
        }
      },
      {
        production_type = "output",
        pipe_covers = pipecoverspictures(),
        volume = 100,
        pipe_connections =
        {
          {
            flow_direction = "output",
            direction = defines.direction.east,
            position = {1, 0}
          }
        }
      },
    },
    water_reflection =
    {
      pictures =
      {
        filename = "__base__/graphics/entity/chemical-plant/chemical-plant-reflection.png",
        priority = "extra-high",
        width = 28,
        height = 36,
        shift = util.by_pixel(5, 60),
        variation_count = 4,
        scale = 5
      },
      rotate = false,
      orientation_to_variation = true
    },
    TFMG_thermal = {
      max_working_temperature = 320,
      max_safe_temperature = 355,
      heat_ratio = 0.45,
      surface_conditions = {
        {
        property = "pressure",
        min = 0,
        max = 0,
        }
      },
      connections = {--totally pointless, as this is the default connection set in TFMG_thermal, but it feels wrong not to define it explicitly
        { position = {1, 1}, direction = 4},
        { position = {1, -1}, direction = 4},
        { position = {-1, 1}, direction = 12},
        { position = {-1, -1}, direction = 12},
      },
    }
  },
  {--refinery
    type = "assembling-machine",
    name = "refinery",
    icon = "__base__/graphics/icons/oil-refinery.png",
    flags = {"placeable-neutral","player-creation"},
    minable = {mining_time = 0.2, result = "refinery"},
    max_health = 350,
    corpse = "oil-refinery-remnants",
    dying_explosion = "oil-refinery-explosion",
    icon_draw_specification = {scale = 2, shift = {0, -0.3}},
    icons_positioning =
    {
      {inventory_index = defines.inventory.crafter_modules, shift = {0, 1.2}, max_icons_per_row = 3}
    },
    circuit_wire_max_distance = assembling_machine_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions["oil-refinery"],
    collision_box = {{-2.4, -2.4}, {2.4, 2.4}},
    collision_mask = {layers={item=true, object=true, player=true, water_tile=true, elevated_rail=true, is_object=true, is_lower_object=true, meltable=true}},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    damaged_trigger_effect = hit_effects.entity(),
    drawing_box_vertical_extension = 0.3,
    crafting_categories = {"refinery"},
    crafting_speed = 1,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = { pollution = 6 }
    },
    energy_usage = "4MW",
    module_slots = 6,
    allowed_effects = {"consumption", "speed", "productivity", "pollution", "quality"},
    graphics_set =
    {
      animation = make_4way_animation_from_spritesheet(
      {
        layers =
        {
          {
            filename = "__base__/graphics/entity/oil-refinery/oil-refinery.png",
            width = 386,
            height = 430,
            shift = util.by_pixel(0, -7.5),
            scale = 0.5
          },
          {
            filename = "__base__/graphics/entity/oil-refinery/oil-refinery-shadow.png",
            width = 674,
            height = 426,
            shift = util.by_pixel(82.5, 26.5),
            draw_as_shadow = true,
            scale = 0.5
          }
        }
      }),

      working_visualisations =
      {
        {
          fadeout = true,
          constant_speed = true,
          north_position = util.by_pixel(34, -65),
          east_position = util.by_pixel(-52, -61),
          south_position = util.by_pixel(-59, -82),
          west_position = util.by_pixel(57, -58),
          animation =
          {
            filename = "__base__/graphics/entity/oil-refinery/oil-refinery-fire.png",
            line_length = 10,
            width = 40,
            height = 81,
            frame_count = 60,
            animation_speed = 0.75,
            scale = 0.5,
            draw_as_glow = true,
            shift = util.by_pixel(0, -14.25)
          },
        },
        {
          fadeout = true,
          north_animation =
          {
            filename = "__base__/graphics/entity/oil-refinery/oil-refinery-light.png",
            width = 321,
            height = 205,
            blend_mode = "additive",
            draw_as_glow = true,
            shift = util.by_pixel(-1, -50),
            scale = 0.5,
          },
          east_animation =
          {
            filename = "__base__/graphics/entity/oil-refinery/oil-refinery-light.png",
            width = 321,
            x = 321;
            height = 205,
            blend_mode = "additive",
            draw_as_glow = true,
            shift = util.by_pixel(-1, -50),
            scale = 0.5,
          },
          south_animation =
          {
            filename = "__base__/graphics/entity/oil-refinery/oil-refinery-light.png",
            width = 321,
            x = 321 * 2;
            height = 205,
            blend_mode = "additive",
            draw_as_glow = true,
            shift = util.by_pixel(-1, -50),
            scale = 0.5,
          },
          west_animation =
          {
            filename = "__base__/graphics/entity/oil-refinery/oil-refinery-light.png",
            width = 321,
            x = 321 * 3;
            height = 205,
            blend_mode = "additive",
            draw_as_glow = true,
            shift = util.by_pixel(-1, -50),
            scale = 0.5,
          },
        }
      }
    },
    impact_category = "metal-large",
    open_sound = sounds.metal_large_open,
    close_sound = sounds.metal_large_close,
    working_sound =
    {
      sound = { filename = "__base__/sound/oil-refinery.ogg" },
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },
    fluid_boxes =
    {
      {
        production_type = "input",
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections =
        {
          {
            flow_direction="input",
            direction = defines.direction.south,
            position = {-1, 2}
          }
        }
      },
      {
        production_type = "input",
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections =
        {
          {
            flow_direction="input",
            direction = defines.direction.south,
            position = {1, 2}
          }
        }
      },
      {
        production_type = "output",
        pipe_covers = pipecoverspictures(),
        volume = 100,
        pipe_connections =
        {
          {
            flow_direction = "output",
            direction = defines.direction.north,
            position = {-2, -2}
          }
        }
      },
      {
        production_type = "output",
        pipe_covers = pipecoverspictures(),
        volume = 100,
        pipe_connections =
        {
          {
            flow_direction = "output",
            direction = defines.direction.north,
            position = {0, -2}
          }
        }
      },
      {
        production_type = "output",
        pipe_covers = pipecoverspictures(),
        volume = 100,
        pipe_connections =
        {
          {
            flow_direction = "output",
            direction = defines.direction.north,
            position = {2, -2}
          }
        }
      }
    },
    water_reflection =
    {
      pictures =
      {
        filename = "__base__/graphics/entity/oil-refinery/oil-refinery-reflection.png",
        priority = "extra-high",
        width = 40,
        height = 48,
        shift = util.by_pixel(5, 95),
        variation_count = 4,
        scale = 5
      },
      rotate = false,
      orientation_to_variation = true
    },
    TFMG_thermal = {
      max_working_temperature = 400,
      max_safe_temperature = 450,
      heat_ratio = 0.7,
      surface_conditions = {
        {
        property = "pressure",
        min = 0,
        max = 0,
        }
      },
      connections = {
        { position = {-1, -2}, direction = 0},
        { position = {1, -2}, direction = 0},
        { position = {-2, 2}, direction = 8},
        { position = {0, 2}, direction = 8},
        { position = {2, 2}, direction = 8},
      },
    }
  },
  {--micro assembler
    type = "assembling-machine",
    name = "micro-assembler",
    icon = "__base__/graphics/icons/assembling-machine-2.png",
    flags = {"placeable-neutral","placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = "micro-assembler"},
    max_health = 400,
    corpse = "assembling-machine-3-remnants",
    dying_explosion = "assembling-machine-3-explosion",
    icon_draw_specification = {shift = {0, -0.1}, scale = 0.75},
    icons_positioning =
    {
      {inventory_index = defines.inventory.crafter_modules, shift = {0, 0.4}, max_icons_per_row = 3, scale = 0.3}
    },
    circuit_wire_max_distance = assembling_machine_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions["assembling-machine"],
    alert_icon_shift = util.by_pixel(0, -12),
    fluid_boxes =
    {
      {
        production_type = "input",
        pipe_picture = assembler2pipepictures(),
        pipe_covers = pipecoverspictures(),
        draw_only_when_connected = true,
        volume = 1000,
        pipe_connections = {
          { flow_direction="input", direction = defines.direction.north, position = {0, -0.5} },
          { flow_direction="input", direction = defines.direction.east, position = {0, -0.5} },
          { flow_direction="input", direction = defines.direction.west, position = {0, -0.5} },
        },
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "output",
        pipe_picture = assembler2pipepictures(),
        pipe_covers = pipecoverspictures(),
        draw_only_when_connected = true,
        volume = 1000,
        pipe_connections = {
          { flow_direction="output", direction = defines.direction.south, position = {0, 0.5} },
          { flow_direction="output", direction = defines.direction.east, position = {0, 0.5} },
          { flow_direction="output", direction = defines.direction.west, position = {0, 0.5} },
        },
        secondary_draw_orders = { north = -1 }
      },
    },
    fluid_boxes_off_when_no_fluid_recipe = true,
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    impact_category = "metal",
    working_sound =
    {
      sound = {filename = "__base__/sound/assembling-machine-t3-1.ogg", volume = 0.45, audible_distance_modifier = 0.5},
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },
    collision_box = {{-0.3, -0.8}, {0.3, 0.8}},
    selection_box = {{-0.5, -1}, {0.5, 1}},
    damaged_trigger_effect = hit_effects.entity(),
    drawing_box_vertical_extension = 0.2,
    graphics_set =
    {
      animation_progress = 0.5,
      animation = {
        north = {
          layers =
          {
            {
              filename = "__TFMG-assets-0__/buildings/micro-assembler/micro-assembler-vertical.png",
              priority = "high",
              width = 71,
              height = 145,
              frame_count = 32,
              line_length = 8,
              shift = util.by_pixel(0, -0.75),
              scale = 0.5
            },
            {
              filename = "__TFMG-assets-0__/buildings/micro-assembler/micro-assembler-vertical-shadow.png",
              priority = "high",
              width = 65,
              height = 108,
              frame_count = 32,
              line_length = 8,
              draw_as_shadow = true,
              shift = util.by_pixel(28, 4),
              scale = 0.5
            }
          }
        },
        east = {
          layers =
          {
            {
              filename = "__TFMG-assets-0__/buildings/micro-assembler/micro-assembler-horizontal.png",
              priority = "high",
              width = 142,
              height = 72,
              frame_count = 32,
              line_length = 8,
              shift = util.by_pixel(0, -0.75),
              scale = 0.5
            },
            {
              filename = "__TFMG-assets-0__/buildings/micro-assembler/micro-assembler-horizontal-shadow.png",
              priority = "high",
              width = 130,
              height = 54,
              frame_count = 32,
              line_length = 8,
              draw_as_shadow = true,
              shift = util.by_pixel(28, 4),
              scale = 0.5
            }
          }
        },
        south = {
          layers =
          {
            {
              filename = "__TFMG-assets-0__/buildings/micro-assembler/micro-assembler-vertical.png",
              priority = "high",
              width = 71,
              height = 145,
              frame_count = 32,
              line_length = 8,
              shift = util.by_pixel(0, -0.75),
              scale = 0.5
            },
            {
              filename = "__TFMG-assets-0__/buildings/micro-assembler/micro-assembler-vertical-shadow.png",
              priority = "high",
              width = 65,
              height = 108,
              frame_count = 32,
              line_length = 8,
              draw_as_shadow = true,
              shift = util.by_pixel(28, 4),
              scale = 0.5
            }
          }
        },
        west = {
          layers =
          {
            {
              filename = "__TFMG-assets-0__/buildings/micro-assembler/micro-assembler-horizontal.png",
              priority = "high",
              width = 142,
              height = 72,
              frame_count = 32,
              line_length = 8,
              shift = util.by_pixel(0, -0.75),
              scale = 0.5
            },
            {
              filename = "__TFMG-assets-0__/buildings/micro-assembler/micro-assembler-horizontal-shadow.png",
              priority = "high",
              width = 130,
              height = 54,
              frame_count = 32,
              line_length = 8,
              draw_as_shadow = true,
              shift = util.by_pixel(28, 4),
              scale = 0.5
            }
          }
        },
      }
    },
    crafting_categories = {
      "micro-assembler",
    },
    crafting_speed = 1,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = { pollution = 2 },
    },
    energy_usage = "1.5MW",
    module_slots = 3,
    allowed_effects = {"consumption", "speed", "productivity", "pollution", "quality"},
    TFMG_thermal = {
      max_working_temperature = 250,
      max_safe_temperature = 350,
      heat_ratio = 0.5,
      surface_conditions = {
        {
        property = "pressure",
        min = 0,
        max = 0,
        }
      },
      connections = {
        { position = {0, -0.5}, direction = 0},
        { position = {0, -0.5}, direction = 4},
        { position = {0, 0.5}, direction = 8},
        { position = {0, 0.5}, direction = 12},
      },
    }
  },
  {--Small crusher
    type = "assembling-machine",
    name = "small-crusher",
    icon = "__space-age__/graphics/icons/crusher.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = "small-crusher"},
    max_health = 350,
    corpse = "crusher-remnants",
    dying_explosion = "electric-furnace-explosion",
    circuit_wire_max_distance = 9,
    circuit_connector = circuit_connector_definitions["crusher"],
    collision_box = {{-0.7, -1.2}, {0.7, 1.2}},
    selection_box = {{-1, -1.5}, {1, 1.5}},
    damaged_trigger_effect = hit_effects.entity(),
    icons_positioning =
    {
      {inventory_index = defines.inventory.crafter_modules, shift = {0, 0.3}, max_icons_per_row = 3}
    },
    icon_draw_specification = {shift = {0, -0.45}},
    crafting_categories = {"small-crusher"},
    crafting_speed = 1,
    energy_usage = "1.5MW",
    module_slots = 3,
    allowed_effects = {"consumption", "speed", "productivity", "pollution", "quality"},
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = { pollution = 1 }
    },
    open_sound = sounds.mech_small_open,
    close_sound = sounds.mech_small_close,
    working_sound =
    {
      sound =
      {
        filename = "__space-age__/sound/entity/crusher/crusher-loop.ogg",
        volume = 0.8,
        audible_distance_modifier = 0.6,
      },
      fade_in_ticks = 4,
      fade_out_ticks = 20,
      max_sounds_per_prototype = 3
    },
    graphics_set = require("__space-age__.prototypes.entity.crusher-pictures"),
    water_reflection =
    {
      pictures =
      {
        filename = "__space-age__/graphics/entity/crusher/crusher-reflection.png",
        priority = "extra-high",
        width = 24,
        height = 24,
        shift = util.by_pixel(5, 40-32),
        variation_count = 1,
        scale = 5
      },
      rotate = false,
      orientation_to_variation = false
    },
    TFMG_thermal = {
      max_working_temperature = 300,
      max_safe_temperature = 450,
      heat_ratio = 0.7,
      surface_conditions = {
        {
        property = "pressure",
        min = 0,
        max = 0,
        }
      },
      connections = {
        { position = {0.5, 1}, direction = 4},
        { position = {0.5, -1}, direction = 4},
        { position = {-0.5, 1}, direction = 12},
        { position = {-0.5, -1}, direction = 12},
      },
    }
  },
})
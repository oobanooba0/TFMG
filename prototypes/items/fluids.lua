--vanilla auto_barrel is no more
  for _, fluid in pairs(data.raw.fluid) do
  	fluid.auto_barrel = false
  end

--uber_barrel = {} to barrel fluid, Uber_barrel is opt in, as I want deliberate choices to be made regarding fluid barreling.
--default_import_location is used to define the barrels default import location
--density can be used to change the quantity of fluid that goes in a barrel. --default 100
--thiccness changes the barrel/unbarrel time
--crafting_categories sets which machines can craft em
--mass sets the mass of a barrel, default is 10

--pipent = true to remove fluid from pipes

--vanilla fluid updates
  local water = data.raw.fluid["water"]
  water.uber_barrel = {}
  water.default_temperature = 0

  local steam = data.raw.fluid["steam"]
  steam.default_temperature = 0

  local LFO_value = "250kJ"
  local thruster_fuel = data.raw.fluid["thruster-fuel"]
  thruster_fuel.uber_barrel = {}
  thruster_fuel.pipent = true
  thruster_fuel.default_temperature = -183
  thruster_fuel.fuel_value = LFO_value

  local thruster_oxidizer = data.raw.fluid["thruster-oxidizer"]
  thruster_oxidizer.uber_barrel = {}
  thruster_oxidizer.pipent = true
  thruster_oxidizer.default_temperature = -253
  thruster_oxidizer.fuel_value = LFO_value


data:extend({
  {
    type = "fluid",
    name = "hydrocarbon-slush",
    icon = "__space-age__/graphics/icons/fluid/lithium-brine.png",
    subgroup = "fluid",
    order = "a[raw-fluid]-a[arrival]",
    default_temperature = 0,
    max_temperature = 100,
    base_color = {0.8, 0.85, 0.8},
    flow_color = {0.6, 0.65, 0.6},
    --uber_barrel = {},
  },
  {
    type = "fluid",
    name = "short-chain-hydrocarbons",
    fuel_value = "1.5MJ",
    icon = "__base__/graphics/icons/fluid/petroleum-gas.png",
    subgroup = "fluid",
    order = "b[intermediate-fluid]-a",
    default_temperature = 15,
    base_color = {0.3, 0.1, 0.3},
    flow_color = {0.8, 0.8, 0.8},
    uber_barrel = {},
  },
  {
    type = "fluid",
    name = "organic-sludge",
    icon = "__base__/graphics/icons/fluid/lubricant.png",
    subgroup = "fluid",
    order = "b[intermediate-fluid]-b",
    default_temperature = 37,
    base_color = {0.15, 0.32, 0.03},
    flow_color = {0.43, 0.75, 0.31},
    --uber_barrel = {},
  },
  {
    type = "fluid",
    name = "ferric-solution",
    icon = "__TFMG-assets-0__/icons/fluids/ferric-solution.png",
    subgroup = "fluid",
    order = "b[intermediate-fluid]-c",
    default_temperature = 95,
    base_color = {0.5, 0.1, 0.0},
    flow_color = {0.7, 0.2, 0.0},
    uber_barrel = {},
  },
  {
    type = "fluid",
    name = "mineral-lubricant",
    icon = "__base__/graphics/icons/fluid/light-oil.png",
    subgroup = "fluid",
    order = "b[intermediate-fluid]-d",
    default_temperature = 15,
    base_color = {0.15, 0.32, 0.03},
    flow_color = {0.43, 0.75, 0.31},
    uber_barrel = {},
  },
})
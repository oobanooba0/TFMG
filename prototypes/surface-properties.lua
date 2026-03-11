--surface property changes
	data.raw["surface-property"]["pressure"].hidden = true
	data.raw["surface-property"]["magnetic-field"].hidden = true --not used anywhere, might as well hide it

data:extend({
  {
    type = "surface-property",
    name = "spacetime-flow-viscosity",
    default_value = 1
  },
  {
    type = "surface-property",
    name = "oxygen",
    default_value = 0
  },
  {
    type = "surface-property",
    name = "TFMG-pressure",
    default_value = 0
  },
  {
    type = "surface-property",
    name = "bot-usage",
    default_value = 1,
    hidden = true,
  },
})
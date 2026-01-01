local TFMG = {}

--item mass functions
	function TFMG.rocket_capacity(capacity) --returns a mass corresponding to the number of items wanted in a rocket
    local rocket_capacity = data.raw["utility-constants"]["default"].rocket_lift_weight
    local weight = rocket_capacity/capacity
	return weight end

	TFMG.conditions = {--defining particular surface condition groups, to save some time.
  	space = {--Surface conditions for space
  	  {property = "gravity",min = 0,max = 0},
  	  {property = "pressure",min = 0,max = 0}
  	},
		not_space = {--for any body with gravity
  	  {property = "gravity",min = 0.1},
  	},
		atmosphere = {--for any body with an atmosphere
  	  {property = "gravity",min = 0.1},
  	  {property = "pressure",min = 10}
  	},
		oxygen = {--for any body with atmospheric oxygen
  	  {property = "gravity",min = 0.1},
  	  {property = "pressure",min = 100},
  	  {property = "oxygen",min = 15},
  	},
		arrival = {--For recipes hard exclusive to arrival.
			{property = "gravity",min = 0.1},
  	  {property = "pressure",min = 100},
  	  {property = "oxygen", min = 95 },
		}
	}

return TFMG
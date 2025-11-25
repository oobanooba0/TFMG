local TFMG = {}

--item mass functions
	function TFMG.rocket_capacity(capacity) --returns a mass corresponding to the number of items wanted in a rocket
    local rocket_capacity = data.raw["utility-constants"]["default"].rocket_lift_weight
    local weight = rocket_capacity/capacity
	return weight end


return TFMG
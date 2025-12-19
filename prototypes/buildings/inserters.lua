--Up top for convenience
--in revolutions per second
local inserter_1_rotation_speed = 1/60
--in tiles per second?
local inserter_1_extension_speed = 2/60

local long_arm_speed_multiplier = 2/3

--remember that revolutions per second =/= actions per second. Actual speeds vary depending on circumstances.

local hit_effects = require ("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")

local inserter_1 = data.raw["inserter"]["inserter"]
inserter_1.rotation_speed = inserter_1_rotation_speed
inserter_1.extension_speed = inserter_1_extension_speed

local long_inserter_1 = data.raw["inserter"]["long-handed-inserter"]
long_inserter_1.rotation_speed = inserter_1_rotation_speed*long_arm_speed_multiplier
long_inserter_1.extension_speed = inserter_1_extension_speed*long_arm_speed_multiplier
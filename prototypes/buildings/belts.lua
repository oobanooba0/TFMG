--- Easy belt speed tuning here.

local belt_1_speed = 15/480 --Belt speeds can only change in 1.875 increments, so 16 doesnt work :(
local belt_2_speed = 30/480

local belt_1 = data.raw["transport-belt"]["transport-belt"]
belt_1.speed = belt_1_speed

local belt_2 = data.raw["transport-belt"]["fast-transport-belt"]
belt_2.speed = belt_2_speed


local underground_1 = data.raw["underground-belt"]["underground-belt"]
underground_1.speed = belt_1_speed
underground_1.max_distance = 8

local underground_2 = data.raw["underground-belt"]["fast-underground-belt"]
underground_2.speed = belt_2_speed
underground_2.max_distance = 10

local splitter_1 = data.raw["splitter"]["splitter"]
splitter_1.speed = belt_1_speed

local splitter_2 = data.raw["splitter"]["fast-splitter"]
splitter_2.speed = belt_2_speed








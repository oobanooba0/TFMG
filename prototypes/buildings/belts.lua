--- Easy belt speed tuning here.

local belt_1_speed = 15/480 --Belt speeds can only change in 1.875 increments, so 16 doesnt work :(
local belt_2_speed = 30/480

local belt_1 = table.deepcopy(data.raw["transport-belt"]["transport-belt"])
belt_1.name = "transport-belt-1"
belt_1.minable.result = "transport-belt-1"
belt_1.speed = belt_1_speed
belt_1.next_upgrade = "transport-belt-2"
belt_1.related_underground_belt = "underground-belt-1"
data.extend{belt_1}

local belt_2 = table.deepcopy(data.raw["transport-belt"]["fast-transport-belt"])
belt_2.name = "transport-belt-2"
belt_2.minable.result = "transport-belt-2"
belt_2.speed = belt_2_speed
belt_2.next_upgrade = nil
belt_2.related_underground_belt = "underground-belt-2"
data.extend{belt_2}

local underground_1 = table.deepcopy(data.raw["underground-belt"]["underground-belt"])
underground_1.name = "underground-belt-1"
underground_1.minable.result = "underground-belt-1"
underground_1.speed = belt_1_speed
underground_1.next_upgrade = "underground-belt-2"
data.extend{underground_1}

local underground_2 = table.deepcopy(data.raw["underground-belt"]["fast-underground-belt"])
underground_2.name = "underground-belt-2"
underground_2.minable.result = "underground-belt-2"
underground_2.speed = belt_2_speed
underground_2.next_upgrade = nil
data.extend{underground_2}

local splitter_1 = table.deepcopy(data.raw["splitter"]["splitter"])
splitter_1.name = "splitter-1"
splitter_1.minable.result = "splitter-1"
splitter_1.speed = belt_1_speed
splitter_1.next_upgrade = "splitter-2"
data.extend{splitter_1}

local splitter_2 = table.deepcopy(data.raw["splitter"]["fast-splitter"])
splitter_2.name = "splitter-2"
splitter_2.minable.result = "splitter-2"
splitter_2.speed = belt_2_speed
splitter_2.next_upgrade = nil
data.extend{splitter_2}








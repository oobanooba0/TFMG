--This file contains more generic functions and utility for runtime.

local TFMG = {}

function TFMG.block(content) --prints content in the console as a block
  game.print(serpent.block(content))
end

function TFMG.line(content) --prints content in the console as a line
  game.print(serpent.line(content))
end

function TFMG.parse_chunk_area(chunk_area) --convert the inconveniently indexed chunk_area into an actually useful pair of coordinates
local area = {{chunk_area["left_top"]["x"],chunk_area["left_top"]["y"]},{chunk_area["right_bottom"]["x"],chunk_area["right_bottom"]["y"]}}
return area end

function TFMG.random_table_entry(table)--get random entry from table.
  local random_table_entry = table[math.random(1,#table)]
  return random_table_entry
end

function TFMG.scramble(table)--randomises the order of a list. Does not create a new list.
  for index = #table, 2, -1 do
    local newindex = math.random(index)
    table[index], table[newindex] = table[newindex] , table[index] --Never knew you could do such a thing.
  end
end

function TFMG.newscramble(table)--randomises the order of the list, preserving the original one, and returning a new one.
  local newtable = {}
  for i = 1, #table do
    newtable[i] = table[i]
  end
  TFMG.scramble(newtable)
return newtable end

function TFMG.append(table_1,table_2) --appends table 2s entries to table 1, doesnt preserve original talbe
  for _,v in pairs(table_2) do
    table.insert(table_1,v)
  end
end

function TFMG.global_achievement(achievement) --unlock an achievement for every player
  local players = game.connected_players
  for _,v in pairs(players) do
    v.unlock_achievement(achievement)
  end
end

function TFMG.force_storage(keys,data) --give a list of keys and data. and this function will create the appropriate directory in storage
  local subtable = storage
  for i = 1,(#keys - 1) do
    local key = keys[i]
    if not subtable[key] then subtable[key] = {} end
    subtable = subtable[key]
  end
  subtable[keys[#keys]] = data
  --TFMG.block(storage[keys[1]])
end

function TFMG.direction(position1,position2)--returns the direction, in radians, that coordinate 1 is from coordinate 2.
  --cause sometimes coordinates are given like {x,y} and sometimes like {x = x, y = y} this should deal with both cases.
  local x1 = position1[1] or position1.x
  local x2 = position2[1] or position2.x
  local y1 = position1[2] or position1.y
  local y2 = position2[2] or position2.y
  local xdelta = x2-x1
  local ydelta = y2-y1

  theta = math.atan2(ydelta,xdelta)
  --so basically this yeilds the angle in radiens ranging from negative 2pi to 2pi with 0 being on the + y axis going clockwise. Thats a bit annoying.
return theta end


return TFMG
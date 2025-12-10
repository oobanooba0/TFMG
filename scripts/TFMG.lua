local TFMG = {}

function TFMG.block(content)
  game.print(serpent.block(content))
end

function TFMG.line(content)
  game.print(serpent.line(content))
end

function TFMG.parse_chunk_area(chunk_area) --convert the stupidly indexed chunk_area into an actually useful pair of coordinates
local area = {{chunk_area["left_top"]["x"],chunk_area["left_top"]["y"]},{chunk_area["right_bottom"]["x"],chunk_area["right_bottom"]["y"]}}
return area end

function TFMG.random_table_entry(table)--get random entry from table
  local random_table_entry = table[math.random(1,#table)]
  return random_table_entry
end

function TFMG.scramble(table)--randomises the order of a list. Does not create a new list.
  for index = #table, 2, -1 do
    local newindex = math.random(index)
    table[index], table[newindex] = table[newindex] , table[index] --Never knew you could do such a thing.
  end
end

function TFMG.newscramble(table)
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

return TFMG
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

return TFMG
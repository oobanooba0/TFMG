local function unpipe_prototype(machine)--replace the old machine fluid box with a new one
  local fluid_boxes = table.deepcopy(machine.fluid_boxes)--we must copy, else we edit the original while we reference it which is bad
  local new_fluid_boxes = {}
  for _,fluid_box in pairs(fluid_boxes) do
    table.insert(new_fluid_boxes,fluid_box)
    local unpipe_fluid_box = table.deepcopy(fluid_box)
    --unpipe_fluid_box.pipe_covers = nil
    --unpipe_fluid_box.pipe_picture = nil
    for _,unpipe_connection in pairs(unpipe_fluid_box.pipe_connections) do
      unpipe_connection.connection_type = "underground"
      unpipe_connection.max_underground_distance = 1
      unpipe_connection.connection_category = "unpipe"
    end
    table.insert(new_fluid_boxes,unpipe_fluid_box)
  end
  machine.fluid_boxes = new_fluid_boxes
end

unpipe_prototype(data.raw["assembling-machine"]["assembling-machine"])
unpipe_prototype(data.raw["assembling-machine"]["chemistry-plant"])
unpipe_prototype(data.raw["assembling-machine"]["refinery"])
unpipe_prototype(data.raw["assembling-machine"]["micro-assembler"])
unpipe_prototype(data.raw["rocket-silo"]["rocket-silo"])



local function fluid_ingredient_declare_index(ingredient,index)
  if ingredient.fluidbox_index then return end
  if data.raw.fluid[ingredient.name].pipent then ingredient.fluidbox_index = index*2
    else ingredient.fluidbox_index = index*2-1
  end
end

for _,recipe in pairs(data.raw.recipe) do
  if recipe.ingredients then 
    local ingredient_i = 1
    for _,ingredient in pairs(recipe.ingredients) do
      if ingredient.type == "fluid" then
        fluid_ingredient_declare_index(ingredient,ingredient_i)
        ingredient_i = ingredient_i + 1
      end
    end
  end
  if recipe.results then
    local ingredient_i = 1
    for _,ingredient in pairs(recipe.results) do
      if ingredient.type == "fluid" then
        fluid_ingredient_declare_index(ingredient,ingredient_i)
        ingredient_i = ingredient_i + 1
      end
    end
  end
end

--- pipe connection category handler
--- 
local function handle_fluid_box_cat(fluid_box)
  for _,connection in pairs(fluid_box.pipe_connections) do
    if connection.connection_type ~= "linked" then
      local category = connection.connection_category
      if not category then 
        connection.connection_category = {"normal","pipe-2"}
      elseif category[1] == "normal" then
        table.insert(connection.connection_category,"pipe-2")
      end
    end
  end
end

local function pipe_2_cat_add(prototype_class)
  for _,building in pairs(prototype_class) do
    if building.fluid_boxes then--recursively for buildings with many fluid boxes,
      for _,fluid_box in pairs(building.fluid_boxes) do handle_fluid_box_cat(fluid_box) end
      elseif building.fluid_box then do --singularly for buildings with just the one
        handle_fluid_box_cat(building.fluid_box)
      end
    end
  end
end

pipe_2_cat_add(data.raw["assembling-machine"])
pipe_2_cat_add(data.raw["boiler"])
pipe_2_cat_add(data.raw["pump"])
pipe_2_cat_add(data.raw["fluid-turret"])
pipe_2_cat_add(data.raw["furnace"])
pipe_2_cat_add(data.raw["fusion-generator"])
pipe_2_cat_add(data.raw["fusion-reactor"])
pipe_2_cat_add(data.raw["thruster"])
pipe_2_cat_add(data.raw["infinity-pipe"])
pipe_2_cat_add(data.raw["mining-drill"])
pipe_2_cat_add(data.raw["offshore-pump"])
pipe_2_cat_add(data.raw["reactor"])
pipe_2_cat_add(data.raw["rocket-silo"])
pipe_2_cat_add(data.raw["storage-tank"])
pipe_2_cat_add(data.raw["valve"])

--lookup table from recipe-category to the machine in data.raw which owns them.
--this also acts as the master list of machines that even *have* unpipable connections in them
local unpipe_lookup = { 
  ["assembling-machine"] = data.raw["assembling-machine"]["assembling-machine"],
  ["chemistry-plant"] = data.raw["assembling-machine"]["chemistry-plant"],
  ["refinery"] = data.raw["assembling-machine"]["refinery"],
  ["micro-assembler"] = data.raw["assembling-machine"]["micro-assembler"],
  ["rocket-building"] = data.raw["rocket-silo"]["rocket-silo"],
}


local function fluid_ingredient_declare_index(ingredient,index,box_count)
  if ingredient.fluidbox_index then return end --if the fluidbox index of a recipe has been specifically declared, don't run any script. (For example 0, to use the autoindexing of the game)
  if data.raw.fluid[ingredient.name].pipent then
    ingredient.fluidbox_index = index + box_count
  else
    ingredient.fluidbox_index = index
  end
end

for _,recipe in pairs(data.raw.recipe) do
  local machine = unpipe_lookup[recipe.category]
  if machine and machine.fluid_boxes then
    --at this point, the unpipe boxes haven't been added yet, so the number of boxes is the amount of regular, pipable boxes.
    local input_boxes = 0
    local output_boxes = 0
    for _,fluid_box in pairs(machine.fluid_boxes) do
      if fluid_box.production_type == "input" then
        input_boxes = input_boxes + 1
      elseif fluid_box.production_type == "output" then
        output_boxes = output_boxes + 1
      end
    end

    if recipe.ingredients then
      local ingredient_i = 1
      for _,ingredient in pairs(recipe.ingredients) do
        if ingredient.type == "fluid" then
          fluid_ingredient_declare_index(ingredient,ingredient_i,input_boxes)
          ingredient_i = ingredient_i + 1
        end
      end
    end
    if recipe.results then
      local ingredient_i = 1
      for _,ingredient in pairs(recipe.results) do
        if ingredient.type == "fluid" then
          fluid_ingredient_declare_index(ingredient,ingredient_i,output_boxes)
          ingredient_i = ingredient_i + 1
        end
      end
    end
  end
end


--

local function unpipe_prototype(machine)--replace the old machine fluid box with a new one
  local fluid_boxes = table.deepcopy(machine.fluid_boxes)--we must copy, else we edit the original while we reference it which is bad
  local new_fluid_boxes = {}

  for _,fluid_box in pairs(fluid_boxes) do --first we add the regular fluid boxes (so that when autoindex applies to recipes, the nothing fluid goes to them first)
    table.insert(new_fluid_boxes,fluid_box)
  end

  for _,fluid_box in pairs(fluid_boxes) do --now we add the unpipable ones after.
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



for _,machine in pairs(unpipe_lookup) do --for every machine in the lookup table, we'll add the unpipe connections.
  unpipe_prototype(machine)
end

--after this point, machines now have their unpipe fluidboxes




--- pipe connection category handler
--- 
local function fluid_box_add_pipe2_category(fluid_box) --add pipe 2 connection category to any connections in the fluid box which connect to pipes
  for _,connection in pairs(fluid_box.pipe_connections) do
    if connection.connection_type ~= "linked" then
      local categories = connection.connection_category
      if not categories or categories == "default" then --if no categories defined or is a simple string then we need to add pipe 2
        connection.connection_category = {"default","pipe-2"}
      elseif type(categories) == "table" then--if categories is a table, we need to check each string within it to see if it has a default connection category.
        for _,category in pairs(categories) do
          if category == "default" then
            table.insert(connection.connection_category,"pipe-2")
          break end --ooh look at that, its a break! if we find default, we skip checking the rest of that table.
        end
      end
    end
  end
end

local function handle_pipe_2_category(prototype_class) --generic script for prootypes which could have some combination of fluid boxes
  for _,building in pairs(prototype_class) do
    if building.fluid_boxes then--recursively for buildings with many fluid boxes.
      for _,fluid_box in pairs(building.fluid_boxes) do fluid_box_add_pipe2_category(fluid_box) end
    end
    --theres alot of different kinds of fluid boxes buildings might have, I think i've got them all.
    if building.fluid_box then fluid_box_add_pipe2_category(building.fluid_box) end--singularly for buildings with just the one
    if building.output_fluid_box then fluid_box_add_pipe2_category(building.output_fluid_box) end
    if building.input_fluid_box then fluid_box_add_pipe2_category(building.input_fluid_box) end
  end
end

local function handle_pipe_2_category_simple(prototype_class) --for entities that can only have one fluid box
  for _,building in pairs(prototype_class) do
    if building.fluid_box then fluid_box_add_pipe2_category(building.fluid_box) end
  end
end

local function handle_pipe_2_category_thruster(prototype_class) --only thrusters can have these anyway.
  for _,building in pairs(prototype_class) do
    fluid_box_add_pipe2_category(building.fuel_fluid_box)
    fluid_box_add_pipe2_category(building.oxidizer_fluid_box)
  end
end

local function handle_pipe_2_category_energy_source(prototype_class)--for prototypes which can have a fluid energy source
  for _,building in pairs(prototype_class) do
    if building.energy_source and building.energy_source.fluid_box then
      fluid_box_add_pipe2_category(building.energy_source.fluid_box)
    end
  end
end

handle_pipe_2_category(data.raw["assembling-machine"])
handle_pipe_2_category(data.raw["boiler"])
handle_pipe_2_category(data.raw["furnace"])
handle_pipe_2_category(data.raw["fusion-generator"])
handle_pipe_2_category(data.raw["fusion-reactor"])
handle_pipe_2_category(data.raw["mining-drill"])
handle_pipe_2_category(data.raw["reactor"])
handle_pipe_2_category(data.raw["rocket-silo"])
handle_pipe_2_category_simple(data.raw["generator"])
handle_pipe_2_category_simple(data.raw["infinity-pipe"])
handle_pipe_2_category_simple(data.raw["offshore-pump"])
handle_pipe_2_category_simple(data.raw["storage-tank"])
handle_pipe_2_category_simple(data.raw["valve"])
handle_pipe_2_category_simple(data.raw["fluid-turret"])
handle_pipe_2_category_simple(data.raw["pump"])
handle_pipe_2_category_thruster(data.raw["thruster"])
handle_pipe_2_category_energy_source(data.raw["reactor"])
if not mods["pushbutton"] then
    return
end

if data.raw["technology"]["introspection-science-pack"] then
table.insert(data.raw["technology"]["introspection-science-pack"].effects, {type = "unlock-recipe",recipe = "pushbutton"})
end

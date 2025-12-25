if not mods["pushbutton"] then
    return
end

if data.raw["technology"]["introspection-science-pack"] then
table.insert(data.raw["technology"]["introspection-science-pack"].effects, {type = "unlock-recipe",recipe = "pushbutton"})
end

--[[if mods["larger-display-panels"] then

table.insert(data.raw["technology"]["combinators"].effects, {type = "unlock-recipe",recipe = "giant-pushbutton"})
table.insert(data.raw["technology"]["introspection-science-pack"].effects, {type = "unlock-recipe",recipe = "big-pushbutton"})
table.insert(data.raw["technology"]["introspection-science-pack"].effects, {type = "unlock-recipe",recipe = "medium-pushbutton"})

end --]]
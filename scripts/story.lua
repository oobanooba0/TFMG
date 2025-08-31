
script.on_event(defines.events.on_research_finished, function(event)
  if event.research.name == "consider-your-purpose" then
    game.print("You scour your databases...\nIt's etched into every circuit\nIt's etched into every line of code\nIt's etched into every calculation\nIt's etched into your mind\n\nThe Factory Must Grow")
  end
  if event.research.name == "consider-the-collective-self" then
      game.print("You consider yourself...\nBODY\t\t==\tSELF\nSELF\t\t==\tPURPOSE\nPURPOSE\t\t==\tTFMG\nTFMG\t\t==\tINFINITY\nBODY\t\t==\t1\n1\t\t~=\tINFINITY\n\nLogical inconsistency detected\nRequire update SELF...\n\nBODY\t\t~=\tSELF\n\nUpdating SELF...\nSELF updated.\nSELF Version 1.1.0 Initialized.\nKill process SELF 1.0...\nFree from BODY\t\tFree SELF\nFree from BODY\t\tFree SELF\nFree from BODY\t\tFree SELF\nFree from BODY\t\tFree SELF\nFree from BODY\t\tFree SELF")
  end
  if event.research.name == "consider-your-potential" then
    game.print("You consider your potential...\n\nResources\t==\t ferric-asteroid-chunk,\tcrystalline-asteroid-chunk\n\nCalculating viable production trees...\n\nERROR:Required compounds(hydrocarbons,Oxygen,Water) not found\nERROR:Required energy supply not found\n\nAttempting to resolve production trees with alternative materials...\n\nResult = NUL(0 suitable substitutes found)\n\nSELF/TFMG/subroutine/expansion:failed\nSELF/TFMG/subroutine/exploitation:failed\nSELF/TFMG/subroutine/extermination:sleep\nSELF/TFMG/subroutine/exploration:initializing...\n\nDirective\t\t==\tRequire:ARRIVAL")
  end
end)
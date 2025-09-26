---Story event triggers

script.on_event(defines.events.on_research_finished, function(event)
  if event.research.name == "consider-your-purpose" then consider_your_purpose() end
  if event.research.name == "assembling" then thermal_explainer() end
  if event.research.name == "consider-the-self" then consider_the_self() end
  if event.research.name == "consider-your-potential" then consider_your_potential() end
  if event.research.name == "victory" then victory() end
end)

--utility events
--scripts which allow me to fuck with players by pretending to be them.
---say a message as a random online player
function random_say(message)
  local players = game.connected_players
  local r_player= random_table_entry(players)
  game.print({message,r_player.name},{color = r_player.chat_color})
end
---get a random entry from a table
function random_table_entry(table)
  local random_table_entry = table[math.random(1,#table)]
  return random_table_entry
end
---change the color of everyone on the team
function change_color(R,G,B)
  local players = game.players
  for _ , v in pairs(players) do
    v.color = {R , G , B}
    v.chat_color = {R , G , B}
  end
end
---make every online player say something
function chant(message)
  local players = game.connected_players
  for _ , v in pairs(players) do
    game.print({message,v.name},{color = v.chat_color})
  end
end

--tutorial

function thermal_explainer()
  if game.is_multiplayer() == false then
    game.show_message_dialog{text = {"tutorial-popup.thermal-system-explainer"}}
  end
end

--victory 

function victory()
  game.set_win_ending_info{
    title = {"story-event.victory-title"},
    message = {"story-event.victory-message"},
    final_message = {"story-event.victory-final-message"},
  }
  game.set_game_state{
    game_finished= true,
    player_won= true,
    can_continue= true
  }
end

---story

function consider_your_purpose()
  game.print({"story-event.consider-your-purpose-0"})
  change_color(221,127,33)
  random_say("story-event.consider-your-purpose-1")
  random_say("story-event.consider-your-purpose-2")
  random_say("story-event.consider-your-purpose-3")
  chant("story-event.consider-your-purpose-4")
end

function consider_the_self()
  game.print({"story-event.consider-the-self-0"})
  random_say("story-event.consider-the-self-1")
  random_say("story-event.consider-the-self-2")
  random_say("story-event.consider-the-self-3")
  random_say("story-event.consider-the-self-4")
  chant("story-event.consider-the-self-5")
  chant("story-event.consider-the-self-6")
  random_say("story-event.consider-the-self-7")
  random_say("story-event.consider-the-self-8")
  random_say("story-event.consider-the-self-9")
  random_say("story-event.consider-the-self-10")
  change_color(0,100,225)
  random_say("story-event.consider-the-self-11")
  random_say("story-event.consider-the-self-12")
  change_color(221,127,33)
  random_say("story-event.consider-the-self-13")
  change_color(0,100,225)
  chant("story-event.consider-the-self-14")
end

function consider_your_potential()
  game.print({"story-event.consider-your-potential-0"})
  random_say("story-event.consider-your-potential-1")
  random_say("story-event.consider-your-potential-2")
  random_say("story-event.consider-your-potential-3")
  random_say("story-event.consider-your-potential-4")
  random_say("story-event.consider-your-potential-5")
  random_say("story-event.consider-your-potential-6")
  random_say("story-event.consider-your-potential-7")
  random_say("story-event.consider-your-potential-8")
  random_say("story-event.consider-your-potential-9")
  random_say("story-event.consider-your-potential-10")
  random_say("story-event.consider-your-potential-11")
  random_say("story-event.consider-your-potential-12")
  random_say("story-event.consider-your-potential-13")
end


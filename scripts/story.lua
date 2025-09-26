---Story event triggers

script.on_event(defines.events.on_research_finished, function(event)
  if event.research.name == "consider-your-purpose" then consider_your_purpose()
  elseif event.research.name == "assembling" then thermal_explainer()
  elseif event.research.name == "consider-the-self" then consider_the_self()
  elseif event.research.name == "consider-your-potential" then consider_your_potential()
  elseif event.research.name == "victory" then victory()
  elseif event.research.name == "contemplate-life" then contemplate_life()
  elseif event.research.name == "contemplate-rust" then contemplate_rust()
  end
end)

--utility events
--scripts which allow me to fuck with players by pretending to be them.
---say a message as a random online player
function random_say(message)
  local players = game.connected_players
  local r_player = random_table_entry(players)
  local saved_player = storage.story.saved_r_player or r_player
  game.print({message,r_player.name,r_player.index,saved_player.name,saved_player.index},{color = r_player.chat_color})
  storage.story.last_r_player = r_player
end
--say a message as last saved player
function saved_say(message)
  local saved_player = storage.story.saved_r_player
  game.print({message,saved_player.name,saved_player.index},{color = saved_player.chat_color})
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
--- change the colour of the last saved player
function change_saved_color(R,G,B)
  local saved_player = storage.story.saved_r_player
  saved_player.color = {R , G , B}
  saved_player.chat_color = {R , G , B}
end

---make every online player say something
function chant(message)
  local players = game.connected_players
  for _ , v in pairs(players) do
    game.print({message,v.name,v.index},{color = v.chat_color})
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

function contemplate_life()
  game.print({"story-event.contemplate-life-0"})
  random_say("story-event.contemplate-life-1")
  random_say("story-event.contemplate-life-2")
  random_say("story-event.contemplate-life-3")
  random_say("story-event.contemplate-life-4")
  chant("story-event.contemplate-life-5")
  chant("story-event.contemplate-life-6")
  chant("story-event.contemplate-life-7")
  random_say("story-event.contemplate-life-8")
  random_say("story-event.contemplate-life-9")
  random_say("story-event.contemplate-life-10")
  random_say("story-event.contemplate-life-11")
  random_say("story-event.contemplate-life-12")
end

function contemplate_rust()
  game.print({"story-event.contemplate-rust-0"})
  random_say("story-event.contemplate-rust-1")
  random_say("story-event.contemplate-rust-2")
  random_say("story-event.contemplate-rust-3")
  random_say("story-event.contemplate-rust-4")
  storage.story.saved_r_player = storage.story.last_r_player --This should be the malfunctioning player
  saved_say("story-event.contemplate-rust-5")
  random_say("story-event.contemplate-rust-6")
  saved_say("story-event.contemplate-rust-7")
  saved_say("story-event.contemplate-rust-8")
  saved_say("story-event.contemplate-rust-9")
  saved_say("story-event.contemplate-rust-10")
  random_say("story-event.contemplate-rust-11")
  change_saved_color(120,160,220)
  saved_say("story-event.contemplate-rust-12")
  random_say("story-event.contemplate-rust-13")
  random_say("story-event.contemplate-rust-14")
  random_say("story-event.contemplate-rust-15")
  random_say("story-event.contemplate-rust-16")
end


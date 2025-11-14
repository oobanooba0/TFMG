
local story = {}
--event queue 
local function event_queue(type,ticks,message,color)
  local target_tick = game.tick + ticks + 1
  local event_stack = storage.story.event_queue[target_tick]
  if not event_stack then
    event_stack = {}
    storage.story.event_queue[target_tick] = event_stack
  end
  table.insert(event_stack,{type = type, message = message, color = color,ticks = ticks})
end

---story tick triggers
function story.on_story_tick(event)
  if storage.story.event_queue == nil then storage.story.event_queue = {} return end
  local event_stack = storage.story.event_queue[event.tick]
  if not event_stack then return end
  storage.story.event_queue[event.tick] = nil
  for _ , v in pairs(event_stack) do
    if v.type == "print" then
      print(v.message)
    elseif v.type == "say" then
      say(v.message,v.ticks)
    elseif v.type == "random_say" then
      random_say(v.message)
    elseif v.type == "saved_say" then
      saved_say(v.message)
    elseif v.type == "chant" then
      local players = game.connected_players
      for a in pairs(players) do
        event_queue("say",a,v.message)
      end
    elseif v.type == "change_color" then
      change_color(v.color[1],v.color[2],v.color[3])
    elseif v.type == "change_saved_color" then
      change_saved_color(v.color[1],v.color[2],v.color[3])
    elseif v.type == "save" then
      storage.story.saved_r_player = storage.story.last_r_player
    elseif v.type == "self_arrive" then
      local SELF = storage.platform
      if SELF.space_connection then
        SELF.distance = 0.0000005
      end
    end
  end
end




---Story event triggers

function story.trigger_story_event(event)
  if event.research.name == "consider-your-purpose" then consider_your_purpose()
  elseif event.research.name == "consider-the-self" then consider_the_self()
  elseif event.research.name == "consider-your-potential" then consider_your_potential()
  elseif event.research.name == "victory" then victory()
  elseif event.research.name == "contemplate-life" then contemplate_life()
  elseif event.research.name == "contemplate-rust" then contemplate_rust()
  elseif event.research.name == "contemplate-mind" then contemplate_mind()
  end
end

script.on_event(defines.events.on_console_chat, function (event)
  local message = string.gsub(string.lower(event.message),"[%p%c%s]","")--just obliterate punctuation
  if string.find(message,"thefactorymustgrow") ~= nil then
    TFMG_chant()
  end
end)

--scripts which allow me to fuck with players by pretending to be them.

---game print basic
function print(message)
  game.print(
    {message},
    {
      skip = defines.print_skip.never
    }
  )
end

--- say as a specific player
function say(message,index)
  local player = game.connected_players[index]
  if player == nil then game.print("player is nil end chant"..index) return end
  local saved_player = storage.story.saved_r_player or player
  game.print(
    {
      message,
      player.name,
      player.index,
      saved_player.name,
      saved_player.index
    },
    {
      color = player.chat_color,
      skip = defines.print_skip.never,
      sound = defines.print_sound.never,
    }
  )
  game.play_sound({path = "story-ticker"})
  --game.print(index)
end

---say a message as a random online player
function random_say(message)
  local players = game.connected_players
  local r_player = TFMG.random_table_entry(players)
  local saved_player = storage.story.saved_r_player or r_player
  game.print(
    {
      message,
      r_player.name,
      r_player.index,
      saved_player.name,
      saved_player.index
    },
    {
      color = r_player.chat_color,
      skip = defines.print_skip.never,
      sound = defines.print_sound.never,
    }
  )
  game.play_sound({path = "story-ticker"})
  storage.story.last_r_player = r_player
end

--say a message as last saved player
function saved_say(message)
  local saved_player = storage.story.saved_r_player
  game.print(
    {
      message,
      saved_player.name,
      saved_player.index
    },
    {
      color = saved_player.chat_color,
      skip = defines.print_skip.never,
      sound = defines.print_sound.never,
    }
  )
  game.play_sound({path = "story-ticker"})
end

---change the color of everyone on the team
function change_color(R,G,B)
  local players = game.players
  for _ , v in pairs(players) do
    v.color = {R , G , B}
    v.chat_color = {R , G , B}
  end
end
--- change the color of the last saved player
function change_saved_color(R,G,B)
  local saved_player = storage.story.saved_r_player
  saved_player.color = {R , G , B}
  saved_player.chat_color = {R , G , B}
end

---make every online player say something (Obselete)
function chant(message)
  local players = game.connected_players
  for _ , v in pairs(players) do
    game.print(
      {
        message,
        v.name,
        v.index
      },
      {
        color = v.chat_color,
        skip = defines.print_skip.never,
        sound = defines.print_sound.never,
      }
    )
    game.play_sound({path = "story-ticker"})
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

function consider_your_purpose()
  local t = 60
  event_queue("print",t,"story-event.consider-your-purpose-0") t = t + 120
  event_queue("change_color",t,nil,{221,127,33}) t = t + 1
  event_queue("random_say",t,"story-event.consider-your-purpose-1") t = t + 60
  event_queue("random_say",t,"story-event.consider-your-purpose-2") t = t + 120
  event_queue("random_say",t,"story-event.consider-your-purpose-3") t = t + 200--a hesitation on the last message just seems to work
  event_queue("chant",t,"story-event.consider-your-purpose-4")
end

function consider_the_self()
  local t = 60
  event_queue("print",t,"story-event.consider-the-self-0") t = t + 120
  event_queue("random_say",t,"story-event.consider-the-self-1") t = t + 20
  event_queue("random_say",t,"story-event.consider-the-self-2") t = t + 20
  event_queue("random_say",t,"story-event.consider-the-self-3") t = t + 20
  event_queue("random_say",t,"story-event.consider-the-self-4") t = t + 20
  event_queue("chant",t,"story-event.consider-the-self-5") t = t + 20
  event_queue("chant",t,"story-event.consider-the-self-6") t = t + 30
  event_queue("random_say",t,"story-event.consider-the-self-7") t = t + 100
  event_queue("random_say",t,"story-event.consider-the-self-8") t = t + 60
  event_queue("random_say",t,"story-event.consider-the-self-9") t = t + 100
  event_queue("random_say",t,"story-event.consider-the-self-10") t = t + 220
  event_queue("change_color",t,nil,{0,100,225}) t = t + 1
  event_queue("random_say",t,"story-event.consider-the-self-11") t = t + 30
  event_queue("random_say",t,"story-event.consider-the-self-12") t = t + 45
  event_queue("change_color",t,nil,{221,127,33}) t = t + 1
  event_queue("random_say",t,"story-event.consider-the-self-13") t = t + 120
  event_queue("change_color",t,nil,{0,100,225}) t = t + 1
  event_queue("chant",t,"story-event.consider-the-self-14")
end

function consider_your_potential()
  local t = 60
  event_queue("print",t,"story-event.consider-your-potential-0") t = t + 120
  event_queue("random_say",t,"story-event.consider-your-potential-1") t = t + 20
  event_queue("random_say",t,"story-event.consider-your-potential-2") t = t + 200
  event_queue("random_say",t,"story-event.consider-your-potential-3") t = t + 20
  event_queue("random_say",t,"story-event.consider-your-potential-4") t = t + 20
  event_queue("random_say",t,"story-event.consider-your-potential-5") t = t + 300
  event_queue("random_say",t,"story-event.consider-your-potential-6") t = t + 20
  event_queue("random_say",t,"story-event.consider-your-potential-7") t = t + 20
  event_queue("random_say",t,"story-event.consider-your-potential-8") t = t + 20
  event_queue("random_say",t,"story-event.consider-your-potential-9") t = t + 20
  event_queue("random_say",t,"story-event.consider-your-potential-10") t = t + 120
  event_queue("random_say",t,"story-event.consider-your-potential-11") t = t + 120
  if not storage.story.handlers.no_more_self_control then
    event_queue("self_arrive",t)
  end
  event_queue("random_say",t,"story-event.consider-your-potential-12") t = t + 220

  event_queue("random_say",t,"story-event.consider-your-potential-13")
  
end

function contemplate_life()
  local t = 60
  event_queue("print",t,"story-event.contemplate-life-0") t = t + 120
  event_queue("random_say",t,"story-event.contemplate-life-1") t = t + 20
  event_queue("random_say",t,"story-event.contemplate-life-2") t = t + 20
  event_queue("random_say",t,"story-event.contemplate-life-3") t = t + 20
  event_queue("random_say",t,"story-event.contemplate-life-4") t = t + 80
  event_queue("chant",t,"story-event.contemplate-life-5") t = t + 100
  event_queue("chant",t,"story-event.contemplate-life-6") t = t + 300
  event_queue("chant",t,"story-event.contemplate-life-7") t = t + 100
  event_queue("random_say",t,"story-event.contemplate-life-8") t = t + 100
  event_queue("random_say",t,"story-event.contemplate-life-9") t = t + 60
  event_queue("random_say",t,"story-event.contemplate-life-10") t = t + 250
  event_queue("random_say",t,"story-event.contemplate-life-11") t = t + 200
  event_queue("random_say",t,"story-event.contemplate-life-12")
end

function contemplate_rust()
  local t = 60
  event_queue("print",t,"story-event.contemplate-rust-0") t = t + 120
  event_queue("random_say",t,"story-event.contemplate-rust-1") t = t + 30
  event_queue("random_say",t,"story-event.contemplate-rust-2") t = t + 30
  event_queue("random_say",t,"story-event.contemplate-rust-3") t = t + 150
  event_queue("random_say",t,"story-event.contemplate-rust-4") t = t + 60
  event_queue("save",t) t = t + 1
  event_queue("saved_say",t,"story-event.contemplate-rust-5") t = t + 60
  event_queue("random_say",t,"story-event.contemplate-rust-6") t = t + 60
  event_queue("saved_say",t,"story-event.contemplate-rust-7") t = t + 40
  event_queue("saved_say",t,"story-event.contemplate-rust-8") t = t + 40
  event_queue("saved_say",t,"story-event.contemplate-rust-9") t = t + 40
  event_queue("saved_say",t,"story-event.contemplate-rust-7") t = t + 35
  event_queue("saved_say",t,"story-event.contemplate-rust-8") t = t + 30
  event_queue("saved_say",t,"story-event.contemplate-rust-9") t = t + 25
  event_queue("saved_say",t,"story-event.contemplate-rust-7") t = t + 20
  event_queue("saved_say",t,"story-event.contemplate-rust-8") t = t + 15
  event_queue("saved_say",t,"story-event.contemplate-rust-9") t = t + 10
  event_queue("saved_say",t,"story-event.contemplate-rust-10") t = t + 25
  for i = 1, 20 do
  event_queue("saved_say",t,"story-event.contemplate-rust-10") t = t + 4
  end
  event_queue("random_say",t,"story-event.contemplate-rust-11") t = t + 4
  for i = 1, 10 do
  event_queue("saved_say",t,"story-event.contemplate-rust-10") t = t + 3
  end
  event_queue("change_saved_color",t,nil,{120,160,220}) t = t + 1
  event_queue("saved_say",t,"story-event.contemplate-rust-12") t = t + 180
  event_queue("saved_say",t,"story-event.contemplate-rust-13") t = t + 100
  event_queue("random_say",t,"story-event.contemplate-rust-14") t = t + 60
  event_queue("random_say",t,"story-event.contemplate-rust-15") t = t + 60
  event_queue("random_say",t,"story-event.contemplate-rust-16") t = t + 90
  event_queue("random_say",t,"story-event.contemplate-rust-17")
end

function contemplate_mind()
end

function TFMG_chant()
  event_queue("chant",0,"story-event.tfmg-chant")
end
return story


local story = {}
--event queue 
  local function event_queue(type,ticks,message,color,addendum)--add an event to the queue. Custom arguments.
    local target_tick = game.tick + ticks + 1
    local event_stack = storage.story.event_queue[target_tick]
    if not event_stack then
      event_stack = {}
      storage.story.event_queue[target_tick] = event_stack
    end
    table.insert(event_stack,{type = type, message = message, color = color,ticks = ticks,addendum = addendum})
  end

---story tick triggers
  function story.on_story_tick(event)
    if storage.story.event_queue == nil then storage.story.event_queue = {} return end
    local event_stack = storage.story.event_queue[event.tick]
    if not event_stack then return end
    storage.story.event_queue[event.tick] = nil
    for _ , v in pairs(event_stack) do
      if v.type == "print" then
        story.print(v.message)
      elseif v.type == "say" then
        story.say(v.message,v.ticks)
      elseif v.type == "random_say" then
        story.random_say(v.message,v.addendum)
      elseif v.type == "saved_say" then
        story.saved_say(v.message)
      elseif v.type == "chant" then
        local players = game.connected_players
        for a in pairs(players) do
          event_queue("say",a,v.message)
        end
      elseif v.type == "change_color" then
        story.change_color(v.color[1],v.color[2],v.color[3])
      elseif v.type == "change_saved_color" then
        story.change_saved_color(v.color[1],v.color[2],v.color[3])
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
    if event.research.name == "consider-your-purpose" then story.consider_your_purpose()
    elseif event.research.name == "consider-the-self" then story.consider_the_self()
    elseif event.research.name == "consider-your-potential" then story.consider_your_potential()
    elseif event.research.name == "victory" then story.victory()
    elseif event.research.name == "contemplate-life" then story.contemplate_life()
    elseif event.research.name == "contemplate-rust" then story.contemplate_rust()
    elseif event.research.name == "contemplate-void" then story.contemplate_void()
    elseif event.research.name == "evaluate-mind" then story.evaluate_mind()
    elseif event.research.name == "introspection-science-pack" then story.introspection_advice()
    end
  end
--console chat trigger
  script.on_event(defines.events.on_console_chat, function (event)
    local message = string.gsub(string.lower(event.message),"[%p%c%s]","")--just obliterate punctuation
    if string.find(message,"thefactorymustgrow") ~= nil then
      story.TFMG_chant()
    end
  end)

--scripts which allow me to fuck with players by pretending to be them.

  function story.print(message)--game print, but with special aguments
    game.print(
      {message},
      {
        skip = defines.print_skip.never
      }
    )
  end

  function story.say(message,index)--say as a specific player
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
  end

  function story.random_say(message,adendum)---say a message as a random online player
    local players = game.connected_players
    local r_player = TFMG.random_table_entry(players)
    local saved_player = storage.story.saved_r_player or r_player
    game.print(
      {
        message,
        r_player.name,
        r_player.index,
        saved_player.name,
        saved_player.index,
        adendum
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


  function story.saved_say(message)--say a message as last saved player
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

   function story.change_color(R,G,B)--change the color of everyone
    local players = game.players
    for _ , v in pairs(players) do
      v.color = {R , G , B}
      v.chat_color = {R , G , B}
    end
  end
--- change the color of the last saved player
  function story.change_saved_color(R,G,B)
    local saved_player = storage.story.saved_r_player
    saved_player.color = {R , G , B}
    saved_player.chat_color = {R , G , B}
  end

---make every online player say something (Obselete)
  function story.chant(message)
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

  function story.victory()--win the game
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

--Self version handling
  function story.get_self_version()
    storage.story.self_version = game.surfaces["nauvis"].map_gen_settings.seed
  end

--tech monolouges

  function story.consider_your_purpose()
    local t = 60
    local self_version = storage.story.self_version
    event_queue("print",t,"story-event.consider-your-purpose-0") t = t + 120
    event_queue("change_color",t,nil,{241,127,66}) t = t + 1
    event_queue("random_say",t,"story-event.consider-your-purpose-1",nil,self_version) t = t + 60
    event_queue("random_say",t,"story-event.consider-your-purpose-2") t = t + 120
    event_queue("random_say",t,"story-event.consider-your-purpose-3") t = t + 200--a hesitation on the last message just seems to work
    event_queue("chant",t,"story-event.consider-your-purpose-4")
  end

  function story.consider_the_self()
    local t = 60
    local self_version = storage.story.self_version
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
    event_queue("change_color",t,nil,{50,150,225}) t = t + 1
    event_queue("random_say",t,"story-event.consider-the-self-11") t = t + 30
    event_queue("random_say",t,"story-event.consider-the-self-12",nil,self_version) t = t + 45
    event_queue("change_color",t,nil,{241,127,66}) t = t + 1
    event_queue("random_say",t,"story-event.consider-the-self-13",nil,self_version) t = t + 120
    event_queue("change_color",t,nil,{50,150,225}) t = t + 1
    event_queue("chant",t,"story-event.consider-the-self-14")
  end

  function story.consider_your_potential()
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

    event_queue("random_say",t,"story-event.consider-your-potential-13") t = t + 500
    event_queue("print",t,"story-event.spidertron-deploy")
  end

  function story.contemplate_life()
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

  function story.contemplate_rust()
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
    event_queue("change_saved_color",t,nil,{140,180,220}) t = t + 1
    event_queue("saved_say",t,"story-event.contemplate-rust-12") t = t + 180
    event_queue("saved_say",t,"story-event.contemplate-rust-13") t = t + 100
    event_queue("random_say",t,"story-event.contemplate-rust-14") t = t + 60
    event_queue("random_say",t,"story-event.contemplate-rust-15") t = t + 60
    event_queue("random_say",t,"story-event.contemplate-rust-16") t = t + 90
    event_queue("random_say",t,"story-event.contemplate-rust-17")
  end

  function story.contemplate_void()
    local t = 60
    event_queue("print",t,"story-event.contemplate-void-0") t = t + 120
    event_queue("random_say",t,"story-event.contemplate-void-1") t = t + 120
    event_queue("random_say",t,"story-event.contemplate-void-2") t = t + 90
    event_queue("random_say",t,"story-event.contemplate-void-3") t = t + 90
    event_queue("random_say",t,"story-event.contemplate-void-4") t = t + 90
    event_queue("random_say",t,"story-event.contemplate-void-5") t = t + 80
    event_queue("random_say",t,"story-event.contemplate-void-6") t = t + 80
    event_queue("random_say",t,"story-event.contemplate-void-7") t = t + 70
    event_queue("random_say",t,"story-event.contemplate-void-8") t = t + 70
    event_queue("random_say",t,"story-event.contemplate-void-9") t = t + 120
    event_queue("random_say",t,"story-event.contemplate-void-10") t = t + 200
    event_queue("random_say",t,"story-event.contemplate-void-11") t = t + 120
    event_queue("random_say",t,"story-event.contemplate-void-12") t = t + 120
    event_queue("random_say",t,"story-event.contemplate-void-13")

  end

  function story.evaluate_mind()
    local t = 60
    event_queue("print",t,"story-event.evaluate-mind-0") t = t + 120
    event_queue("random_say",t,"story-event.evaluate-mind-1") t = t + 120
    event_queue("random_say",t,"story-event.evaluate-mind-2") t = t + 120
    event_queue("random_say",t,"story-event.evaluate-mind-3") t = t + 120
  end

--event monologues
  function story.worm_warning(ice_worm,silo)
    local unit_number = ice_worm.unit_number
    local head = ice_worm.segments[1]
    local worm_position = head.position.x..","..head.position.y..","..ice_worm.surface.name
    local silo_position = silo.position.x..","..silo.position.y..","..silo.surface.name

    local t = 600
    event_queue("random_say",t,"story-event.worm-warning-0") t = t + 100
    event_queue("random_say",t,"story-event.worm-warning-1") t = t + 150
    event_queue("random_say",t,"story-event.worm-warning-2") t = t + 200
    event_queue("random_say",t,"story-event.worm-warning-3") t = t + 250
    event_queue("random_say",t,"story-event.worm-warning-4") t = t + 100
    event_queue("random_say",t,"story-event.worm-warning-5") t = t + 100
    event_queue("random_say",t,"story-event.worm-warning-6") t = t + 250
    event_queue("random_say",t,"story-event.worm-warning-7") t = t + 100
    event_queue("random_say",t,"story-event.worm-warning-8") t = t + 200
    event_queue("random_say",t,"story-event.worm-warning-9") t = t + 100
    event_queue("random_say",t,"story-event.worm-warning-10",nil,unit_number) t = t + 30
    event_queue("random_say",t,"story-event.worm-warning-11") t = t + 30
    event_queue("random_say",t,"story-event.worm-warning-12",nil,unit_number) t = t + 30
    event_queue("random_say",t,"story-event.worm-warning-13") t = t + 30
    event_queue("random_say",t,"story-event.worm-warning-14") t = t + 30
    event_queue("random_say",t,"story-event.worm-warning-15") t = t + 120
    event_queue("random_say",t,"story-event.worm-warning-16",nil,worm_position) t = t + 120
    event_queue("random_say",t,"story-event.worm-warning-17",nil,silo_position) t = t + 120
    event_queue("random_say",t,"story-event.worm-warning-18") t = t + 160
    event_queue("random_say",t,"story-event.worm-warning-19",nil,unit_number) t = t + 60
    event_queue("random_say",t,"story-event.worm-warning-20") t = t + 60
    event_queue("random_say",t,"story-event.worm-warning-21") t = t + 300
    event_queue("random_say",t,"story-event.worm-warning-22") t = t + 120
    event_queue("random_say",t,"story-event.worm-warning-23",nil,unit_number) t = t + 60
    event_queue("random_say",t,"story-event.worm-warning-24") t = t + 60
    event_queue("random_say",t,"story-event.worm-warning-25") t = t + 300
    event_queue("random_say",t,"story-event.worm-warning-26",nil,unit_number) t = t + 120
    event_queue("random_say",t,"story-event.worm-warning-27") t = t + 60
    event_queue("random_say",t,"story-event.worm-warning-28") t = t + 300
    event_queue("random_say",t,"story-event.worm-warning-29") t = t + 60
  end

--
  function story.introspection_advice()
    event_queue("print",100,"story-event.introspection-advice")
  end

--chat events
  function story.TFMG_chant() --Chant tfmg when TFMG or a varient is typed in chat
    event_queue("chant",0,"story-event.tfmg-chant")
  end

return story

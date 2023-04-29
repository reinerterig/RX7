engine.name = 'RX7'

ps = include('lib/Presets')

m = midi.connect(1)
m.event = function(data) 
            tab.print(midi.to_msg(data)) 
          end

alg = 0

function set_alg(a)
  alg = a
  local preset = ps.get_preset(a)
  if preset ~= nil then
    screen.clear()
    screen.move(0, 10)
    screen.text("Preset Index: " .. preset.index)
    screen.move(0, 20)
    screen.text("Preset Name: " .. preset.name)
    screen.update()
  end
end

function enc(n, delta)
  if n == 3 then
    local new_alg = util.clamp(alg + delta, 0, #ps.presets)
    set_alg(new_alg)
  end
end

m.event = function(data)
  local d = midi.to_msg(data)
  if d.type == "note_on" then
    engine.NoteOn(d.note,d.vel,alg)
  elseif d.type == "note_off" then
    engine.NoteOff(d.note)
  end
end

function init()
  screen.clear()
  screen.update()
end

function rerun()
  norns.script.load(norns.state.script)
end

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'lib'))

require 'planetwars'
require 'finchbot'

$bot = Finch::Bot.new([])

map_data = ''
loop do
  current_line = gets.strip
  if current_line.length >= 2 and current_line[0..1] == "go"
    pw = PlanetWars.new(map_data)
    $bot.do_turn(pw)
    pw.finish_turn
    map_data = ''
  else
    map_data += current_line + "\n"
  end
end

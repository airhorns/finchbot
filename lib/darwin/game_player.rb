require "open4"
require 'system_timer'
module Finch
  class GamePlayer
    @queue = :games
    @max_turn_length = 600
    def self.perform(bot1, bot2, map, id)
      SystemTimer.timeout_after((@max_turn_length+15).seconds) do
        cmd = "java -jar tools/PlayGame.jar #{map} 5000 #{@max_turn_length} logs/log.txt \"#{bot1}\" \"#{bot2}\""
        puts "Running: #{cmd}"

        pid, stdin, stdout, stderr = Open4::popen4 cmd
        puts "pid        : #{ pid }"
        stdout.read
        output = stderr.read
        score = self.parse_output(output)
        puts "score      : #{ score }"
        s = Finch::Chromosome.find(id["$oid"])
        s.scores.create!(:rating => score, :player1 => bot1, :player2 => bot2, :map => map)
      end
    end

    def self.parse_output(string)
      if string.match("WARNING: player 2 timed out")
        return -1 * (@max_turn_length + 1)
      else
        turns = string.scan(/Turn \d{1,3}/).length
        if string.match("Player 2 Wins!")
          winner = 1
        else
          winner = -1
        end
        return (@max_turn_length - turns) * winner
      end
    end
  end
end
require "open4"
require 'system_timer'
module Finch
  class GamePlayer
    @queue = :games
    @max_turn_count = 600
    @max_turn_length = 5000
    def self.perform(bot1, bot2, map, id)
      chromosome = Finch::Chromosome.find(id)
      SystemTimer.timeout_after(((@max_turn_count*@max_turn_length)+15).seconds) do
        cmd = "java -jar tools/PlayGame.jar #{map} #{@max_turn_length} #{@max_turn_count} logs/log.txt \"#{bot1}\" \"#{bot2}\""
        puts "Running: #{cmd}"

        pid, stdin, stdout, stderr = Open4::popen4 cmd
        puts "pid        : #{ pid }"
        stdout.read
        output = stderr.read
        score = self.parse_output(output)
        puts "score      : #{ score }"
        chromosome.scores.create!(:rating => score, :player1 => bot1, :player2 => bot2, :map => map)
      end
    end

    def self.parse_output(string)
      if string.match("WARNING: player 2 timed out")
        return -1 * (@max_turn_count + 1)
      else
        turns = string.scan(/Turn \d{1,3}/).length
        if string.match("Player 2 Wins!")
          winner = 1
        else
          winner = -1
        end
        return (@max_turn_count - turns) * winner
      end
    end
  end
end
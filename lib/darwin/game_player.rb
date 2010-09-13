require "open3"
module Finch
  class GamePlayer
    def play(bot1, bot2, map)
      str = "java -jar tools/PlayGame.jar #{map} 1000 1000 logs/log#{Time.now.to_i}.txt \"#{bot1}\" \"#{bot2}\""
      puts str
      output = ""
      Open3.popen3(str) { |stdin, stdout, stderr|
        output = stdout.read
        errors = stderr.read
        puts errors
      }
      self.parse_output(output)
    end

    def parse_output(string)
      if string.match("WARNING: player 2 timed out")
        return -1001
      else
        turns = string.scan(/Turn \d{1,3}/).length
        if string.match("Player 2 Wins!")
          winner = 1
        else
          winner = -1
        end
        return (1000 - turns) * winner
      end
    end
  end
end
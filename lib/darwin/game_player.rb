require "open4"
module Finch
  class GamePlayer
    def play(bot1, bot2, map)
      cmd = "java -jar tools/PlayGame.jar #{map} 1000 1000 logs/log#{Time.now.to_i}.txt \"#{bot1}\" \"#{bot2}\" "
      puts "Running: #{cmd}"

      # pid, stdin, stdout, stderr = Open4::popen4 cmd
      # ignored, status = Process::waitpid2 pid
      # puts "pid        : #{ pid }"
      # output = stdout.read.strip
      # puts "stdout     : #{ output }"
      # puts "stderr     : #{ stderr.read.strip }"
      # puts "status     : #{ status.inspect }"
      # puts "exitstatus : #{ status.exitstatus }"
      # puts "Playing complete."

      output = `#{cmd}`

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
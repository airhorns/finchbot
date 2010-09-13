module Finch
  class IncomingAngle < Angle
    def opinion
      fleets = destination.incoming_fleets
      fleets.select {|f| f.owner == $FINCH }.collect(&:num_ships).sum / (1 + fleets.select {|f| f.owner == $ENEMY }.collect(&:num_ships).sum)
    end
  end
end
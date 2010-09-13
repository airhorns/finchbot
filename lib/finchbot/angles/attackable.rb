module Finch
  class AttackableAngle < Angle
    def opinion
      if destination.owner != $FINCH
        Finch.pw.distance(source, destination) / (destination.num_ships + 1)
      else
        0
      end
    end
  end
end
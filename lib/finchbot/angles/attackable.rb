module Finch
  class AttackableAngle < Angle
    def opinion(source, destination)
      if destination.owner != $FINCH && source.num_ships > 10
        1
      else
        0
      end
    end
  end
end
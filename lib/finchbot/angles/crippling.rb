module Finch
  class CripplingAngle < Angle
    def opinion
      if destination.owner == $ENEMY
        destination.num_ships / Finch.pw.distance(source, destination)
      else
        0
      end
    end
  end
end
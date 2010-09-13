module Finch
  class DefendableAngle < Angle
    def opinion
      source.num_ships - destination.num_ships
    end
  end
end
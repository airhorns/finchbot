
module Finch
  class DefenseAssistAngle < Angle
    def opinion(source, destination)
      return 0 if destination.owner != $FINCH

      attackers = destination.incoming_fleets.inject(Array.new(Finch.lookahead, 0)) do |acc, fleet|
        slug = fleet.turns_remaining
        if slug < acc.length
          acc[slug] += fleet.num_ships
        end
        acc
      end

      travel_time = Finch.pw.distance(source, destination)
      if source.num_ships/2 > attackers[0...travel_time-1].sum
        1
      else
        0
      end

    end
  end
end
# Try to win planets which we could easily
module Finch
  class BattlerAngle < Angle
    def opinion
      fleets = destination.incoming_fleets
      my_enroute_fleets = fleets.select {|f| f.owner == $FINCH }.collect(&:num_ships).sum
      their_enroute_fleets = fleets.select {|f| f.owner == $ENEMY }.collect(&:num_ships).sum
      # We need to conquer their incoming fleets and maybe the planet's native force
      ships_needed = their_enroute_fleets - my_enroute_fleets + (destination.owner == $FINCH ? -1 * destination.num_ships : destination.num_ships) + 1
      return 0 if ships_needed <= 0
      reserve(ships_needed)
      return 1.0 / ships_needed
    end
  end
end
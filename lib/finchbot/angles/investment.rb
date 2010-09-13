module Finch
  class InvestmentAngle < Angle
    def opinion
      reserve_conquering_fleet!
      destination.growth_rate / (source.growth_rate + 1)
    end
  end
end
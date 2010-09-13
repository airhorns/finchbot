module Finch
  class InvestmentAngle < Angle
    def self.calculate_investments
      calculations = []
      Finch.pw.my_planets.each do |src|
        calculations[src.id] = []
        Finch.pw.not_my_planets.each do |dest|
          # How good is the growth rate in comparison to how many ships would be generated while not doing so
#          calculations[src.id][dest.id] = (dest.growth_rate * 10) / ((src.growth_rate * Finch.pw.distance(src, dest)))
          calculations[src.id][dest.id] = dest.growth_rate / (src.growth_rate + 1)
        end
      end
      calculations
    end

    def opinion
      Finch.pw.calculations[:investments] ||= self.class.calculate_investments
      calcs = Finch.pw.calculations[:investments]
      if(calcs[source.id][destination.id])
        reserve_conquering_fleet!
        calcs[source.id][destination.id]
      else
        0
      end
    end
  end
end
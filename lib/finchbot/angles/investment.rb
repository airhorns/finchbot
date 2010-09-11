module Finch
  class InvestmentAngle < Angle
    def find_best_investments
      calculations = []
      Finch.pw.my_planets.each do |src|
        calculations[src.id] = []
        Finch.pw.not_my_planets.each do |dest|
          # How good is the growth rate in comparison to how many ships would be generated while not doing so
          calculations[src.id][dest.id] = dest.growth_rate / (src.growth_rate * Finch.pw.distance(src, dest))
        end
      end
      calculations
    end
    def opinion(source, destination)
      @calculations ||= self.find_best_investments
      @calculations[source.id][destination.id] || 0
    end
  end
end
require "open4"
require 'system_timer'
module Finch
  class FitnessCalculator
    @queue = :calculations
    def self.perform(id)
      chromosome = Finch::Chromosome.find(id)
      chromosome.fitness = (chromosome.scores.collect {|s| s.rating.to_i || 0 }.sum / chromosome.scores.length)
      chromosome.complete = true
      chromosome.save!
    end
  end
end
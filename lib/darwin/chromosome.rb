module Finch
  class Chromosome

    attr_accessor :data
    attr_accessor :normalized_fitness
    attr_accessor :fitness

    def initialize(data)
      @data = data
    end

    # The fitness method quantifies the optimality of a solution
    # (that is, a chromosome) in a genetic algorithm so that that particular
    # chromosome may be ranked against all the other chromosomes.
    #
    # Optimal chromosomes, or at least chromosomes which are more optimal,
    # are allowed to breed and mix their datasets by any of several techniques,
    # producing a new generation that will (hopefully) be even better.
    def fitness
      return @fitness if @fitness
      maps = Array.new(99) do |i|
        "maps/map#{i+1}.txt"
      end

      bots = ["RandomBot", "BullyBot", "DualBot", "ProspectorBot", "RageBot"].collect do |s|
        "java -jar example_bots/#{s}.jar"
      end
      finch = "/Users/hornairs/.rvm/rubies/ruby-1.9.2-rc2/bin/ruby mybot.rb #{self.data.join(" ")}"
      scores = []
      maps[0..2].each do |map|
        bots[1..3].each do |bot|
          scores.push GamePlayer.new.play(bot, finch, map)
        end
      end

      @fitness = scores.sum / scores.length
      return @fitness
    end

    def self.mutate(chromosome)
      if chromosome.normalized_fitness && rand < ((1 - chromosome.normalized_fitness) * 0.3)
        data = chromosome.data
        index = rand(data.length-1)
        data[index] = data[index] + ((rand - 0.5) * data[index])
        chromosome.data = data
        chromosome.fitness = nil
      end
    end

    def self.reproduce(a, b)
      data_size = Finch.parameter_count-2
      crossover = rand(data_size)
      spawn = a.data[0..crossover] + b.data[crossover+1..-1]
      return self.class.new(spawn)
    end

    # Initializes an individual solution (chromosome) for the initial
    # population. Usually the chromosome is generated randomly, but you can
    # use some problem domain knowledge, to generate a
    # (probably) better initial solution.
    def self.seed
      seed = Array.new(Finch.parameter_count) do |i|
        rand
      end
      return Chromosome.new(seed)
    end
  end
end

module Ai4r
  module GeneticAlgorithm
    class GeneticSearch
      def generate_initial_population
       @population = []
       @population_size.times do
         population << Finch::Chromosome.seed
       end
      end

      def reproduction(selected_to_breed)
        offsprings = []
        0.upto(selected_to_breed.length/2-1) do |i|
          offsprings << Finch::Chromosome.reproduce(selected_to_breed[2*i], selected_to_breed[2*i+1])
        end
        @population.each do |individual|
          Finch::Chromosome.mutate(individual)
        end
        return offsprings
      end
    end
  end
end
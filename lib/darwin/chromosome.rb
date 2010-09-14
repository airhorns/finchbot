module Finch
  class Score
    include Mongoid::Document
    field :player_1
    field :player_2
    field :map
    field :rating
    embedded_in :chromosome, :inverse_of => :scores
  end

  class Chromosome
    include Mongoid::Document
    Finch.parameters.each do |a|
      field a, :type => Float
    end
    field :fitness
    field :normalized_fitness
    field :enqueued, :type => Boolean, :default => false
    field :complete, :type => Boolean, :default => false
    embeds_many :scores

    attr_accessor :data

    def initialize(data)
      @data = data
      Finch.parameters.each do |p|
        self[p] = data.pop
      end
    end

    # The fitness method quantifies the optimality of a solution
    # (that is, a chromosome) in a genetic algorithm so that that particular
    # chromosome may be ranked against all the other chromosomes.
    #
    # Optimal chromosomes, or at least chromosomes which are more optimal,
    # are allowed to breed and mix their datasets by any of several techniques,
    # producing a new generation that will (hopefully) be even better.
    # Fitness method is provided by Mongoid ORM

    # Method to enqueue the jobs needed to calculate this chromosome's fitness
    def queue_fitness_calculations
      maps = Array.new(99) do |i|
        "maps/map#{i+1}.txt"
      end

      bot = Hash.new ["RandomBot", "BullyBot", "DualBot", "ProspectorBot", "RageBot"].collect do |s|
        [s.intern, "java -jar example_bots/#{s}.jar"]
      end

      finch = "ruby mybot.rb #{self.data.join(" ")}"
      scores = []
      maps[0..2].each do |map|
        bots[1..3].each do |bot, command|
          s = self.create_score(bot, :finch, map)
          Resque.enque(GamePlayer, command, finch, map, s.id)
        end
      end

      self.enqueued = true
      self.save
    end


    def self.mutate(chromosome)
      if chromosome.normalized_fitness && rand < ((1 - chromosome.normalized_fitness) * 0.3)
        mutant = self.new
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
      return self.new(spawn)
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
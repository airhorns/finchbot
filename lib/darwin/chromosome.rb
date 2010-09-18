module Finch
  class Score
    include Mongoid::Document
    field :player_1
    field :player_2
    field :map
    field :rating, :type => Float
    embedded_in :chromosome, :inverse_of => :scores, :class_name => "Finch::Chromosome"
  end

  class Chromosome
    include Mongoid::Document
    Finch.parameters.each do |a|
      field a, :type => Float
    end
    field :deceased, :type => Boolean, :default => false
    field :fitness, :type => Float
    field :normalized_fitness, :type => Float
    field :enqueued, :type => Boolean, :default => false
    field :complete, :type => Boolean, :default => false
    embeds_many :scores, :class_name => "Finch::Score"

    class << self
      def mutate(chromosome)
        if chromosome.normalized_fitness && rand < ((1 - chromosome.normalized_fitness) * 0.3)
          data = chromosome.data
          index = rand(data.length-1)
          data[index] = data[index] + ((rand - 0.5) * data[index])
          mutant = self.new(data)
          mutant.fitness = nil
          chromosome.kill!
          mutant.save!
          return mutant
        end
        return chromosome
      end

      def reproduce(a, b)
        data_size = Finch.parameter_count-2
        crossover = rand(data_size)
        spawn = a.data[0..crossover] + b.data[crossover+1..-1]
        x = self.new(spawn)
        x.save!
        return x
      end

      # Initializes an individual solution (chromosome) for the initial
      # population. Usually the chromosome is generated randomly, but you can
      # use some problem domain knowledge, to generate a
      # (probably) better initial solution.
      def seed
        seed = Array.new(Finch.parameter_count) do |i|
          rand
        end
        return Chromosome.new(seed)
      end

      def alive
        criteria.where(:deceased => false)
      end

      def dead
        criteria.where(:deceased => true)
      end

      def without_calculated_fitness
        criteria.where(:fitness => nil)
      end
    end

    def initialize(data = nil)
      if data && data.is_a?(Array) && data.length == Finch.parameter_count
        hash = {}
        Finch.parameters.each do |p|
          hash[p] = data.pop
        end
        return super(hash)
      else
        super
      end
    end

    def data
      @data ||= Finch.parameters.collect do |p|
        self[p]
      end
      @data
    end
    # The fitness method quantifies the optimality of a solution
    # (that is, a chromosome) in a genetic algorithm so that that particular
    # chromosome may be ranked against all the other chromosomes.
    #
    # Optimal chromosomes, or at least chromosomes which are more optimal,
    # are allowed to breed and mix their datasets by any of several techniques,
    # producing a new generation that will (hopefully) be even better.
    # Fitness method is an attribute provided by Mongoid ORM

    def calculate_fitness!
      queue_fitness_games if self.fitness.nil?
    end

    # Method to enqueue the jobs needed to calculate this chromosome's fitness
    def queue_fitness_games
      maps = Array.new(99) do |i|
        "maps/map#{i+1}.txt"
      end

      bots = Hash[["BullyBot", "DualBot", "ProspectorBot", "RageBot"].collect do |s|
        [s.intern, "java -jar example_bots/#{s}.jar"]
      end]

      finch = "ruby mybot.rb #{self.data.join(" ")}"
      scores = []
      maps[0..4].each do |map|
        bots.each do |bot, command|
          Resque.enqueue(GamePlayer, command, finch, map, self.id.to_s)
        end
      end

      self.enqueued = true
      self.save
    end

    def queue_fitness_calculations
      Resque.enqueue(FitnessCalculator, self.id.to_s)
    end

    def kill!
      self.update_attributes!(:deceased => true)
    end
  end
end
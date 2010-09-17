require 'resque/tasks'

task :evolve do
  search = Ai4r::GeneticAlgorithm::GeneticSearch.new(2, 3)
  result = search.run
  puts result.inspect
  puts result.data
end

task :seed do
  Finch::Chromosome.delete_all
  search = Ai4r::GeneticAlgorithm::DistributedGeneticSearch.new
  search.generate_initial_population(100)
end

task :check_generation do
  if Resque.size("games") == 0
    # All games complete for this generation.
    Finch::Chromosome.alive.without_calculated_fitness.each do |c|
      c.complete = true
      c.queue_fitness_calculations
      c.save!
    end

    if Finch::Chromosome.alive.without_calculated_fitness.length == 0
      # All fitness calculations are complete! Do the next generation
      search = Ai4r::GeneticAlgorithm::DistributedGeneticSearch.new
      search.advance_generation
      # search.evaluate_generation
    end
  else
    return
  end
end
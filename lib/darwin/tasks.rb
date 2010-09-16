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
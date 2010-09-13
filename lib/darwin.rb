require 'ai4r'
require 'darwin/chromosome'
require 'darwin/game_player'

task :evolve do
  search = Ai4r::GeneticAlgorithm::GeneticSearch.new(2, 3)
  result = search.run
  puts result.inspect
  puts result.data
end
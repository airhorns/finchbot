require 'ai4r'
require 'mongoid'
require 'darwin/chromosome'
require 'darwin/genetic_search'
require 'darwin/game_player'
#require 'darwin/app'
require 'resque/tasks'

ENV['RACK_ENV'] ||= "development"
file_name = File.join(File.dirname(__FILE__), "darwin", "mongoid.yml")
settings = YAML.load(File.new(file_name).read)

Mongoid.configure do |config|
  config.from_hash(settings[ENV['RACK_ENV']])
end

task :evolve do
  search = Ai4r::GeneticAlgorithm::GeneticSearch.new(2, 3)
  result = search.run
  puts result.inspect
  puts result.data
end

task :seed do
  Finch::Chromosome.new.save!
end
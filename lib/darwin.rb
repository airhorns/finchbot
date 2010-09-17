require 'finchbot'
require 'ai4r'
require 'mongoid'
require 'darwin/chromosome'
require 'darwin/genetic_search'
require 'darwin/game_player'
require 'darwin/fitness_calculator'
require 'resque'

ENV['RACK_ENV'] ||= "development"
file_name = File.join(File.dirname(__FILE__), "darwin", "mongoid.yml")
settings = YAML.load(File.new(file_name).read)

Mongoid.configure do |config|
  config.from_hash(settings[ENV['RACK_ENV']])
end

Resque.redis = Redis.new(:host => "tarmac.skylightlabs.ca", :port => 6556, :password => "donthack")
# FINCHBOT

# Intialization
require 'logger'
logging_dir = File.join(File.dirname(__FILE__), "logs")
if File.directory?(logging_dir)
  # Development Logger
#  $log = Logger.new(File.join(logging_dir, "botlog#{Time.now.to_i}.txt"))
  $log = Logger.new(STDERR)
  $log.level = Logger::DEBUG
else
  # Production Logger
  $log = Logger.new(STDERR)
  $log.level = Logger::FATAL
end
$log.debug "Finchbot Started"

$log.debug "Requiring Rubygems"
require "rubygems"
$log.debug "Requiring Bundler"
require 'bundler'
Bundler.setup(:default)
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'lib'))

$log.debug "Requiring finchbot"
require 'finchbot'
$log.debug "Requiring yaml"
require 'yaml'
$log.debug "Requiring activesupport"
require 'active_support/core_ext/hash/indifferent_access'
$log.debug("Requires present.")

if ARGV.length == Finch.parameter_count
  $log.debug("Using arguments from command line.")
  params = ARGV.dup
  until ARGV.empty?
    ARGV.shift
  end
else
  $log.debug("Using YAML arguments.")
  params = YAML.load(File.read(File.join(File.dirname(__FILE__), 'parameters.yml'))).with_indifferent_access
end

$log.debug "Initiailizing Bot"
$bot = Finch::Bot.new(params)
map_data = ''
turn = 0

$log.debug "Entering Loop"
loop do
  x = gets
  if x
    current_line = x.strip
    if current_line.length >= 2 and current_line[0..1] == "go"
      turn += 1
      $log.debug("Doing turn #{turn}.")
      pw = PlanetWars.new(map_data)
      $bot.do_turn(pw)
      $log.debug("Finishing turn #{turn}.")
      pw.finish_turn
      map_data = ''
    else
      map_data += current_line + "\n"
    end
  end
end
#!/usr/bin/env ruby
$LOAD_PATH.unshift File.dirname(__FILE__) + '/../'
require 'darwin'
require 'resque/server'

use Rack::ShowExceptions

# Set the AUTH env variable to your basic auth password to protect Resque.
AUTH_PASSWORD = "donthack"
if AUTH_PASSWORD
  Resque::Server.use Rack::Auth::Basic do |username, password|
    password == AUTH_PASSWORD
  end
end

run Rack::URLMap.new \
  "/"       => Finch::App.new,
  "/resque" => Resque::Server.new

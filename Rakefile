require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "finchbot"
  gem.summary = %Q{Darwin would be proud.}
  gem.description = %Q{TODO: longer description of your gem}
  gem.email = "harry@skylightlabs.ca"
  gem.homepage = "http://github.com/hornairs/finchbot"
  gem.authors = ["Harry Brundage"]
  gem.add_development_dependency "rspec", ">= 2.0.0.beta.19"
  gem.add_development_dependency "bundler", "~> 1.0.0"
  gem.add_development_dependency "jeweler", "~> 1.5.0.pre3"
  gem.add_development_dependency "rcov", ">= 0"
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

RSpec::Core::RakeTask.new(:rcov) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :default => :spec

task :build_code do
  files = Dir.glob("lib/finchbot*") + Dir.glob("lib/planetwars*") + ["mybot.rb"]
  puts "Zipping..."
  system "zip package"+Time.now.to_i.to_s+".zip "+files.join(" ")
end

task :play do
  system 'java -jar tools/PlayGame.jar maps/map7.txt 1000 1000 log.txt "java -jar example_bots/RandomBot.jar" "ruby mybot.rb"'
end

task :show do
  system 'java -jar tools/PlayGame.jar maps/map7.txt 1000 1000 log.txt "java -jar example_bots/RandomBot.jar" "ruby mybot.rb" | java -jar tools/ShowGame.jar'
end
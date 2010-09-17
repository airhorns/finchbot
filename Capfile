set :application, "finchbot"
require 'bundler/capistrano'
load 'deploy' if respond_to?(:namespace)
require 'railsless-deploy'

set :scm, :git
set :deploy_via, :remote_cache
set :repository, "git@github.com:hornairs/finchbot.git"
set :deploy_to, "~/finchbot"
set :use_sudo, false
server "hornairs@tarmac.skylightlabs.ca:2234", :web, :workers
server "hornairs@scurvvy.info:2234", :workers
server "bitnami@ec2-184-72-210-109.compute-1.amazonaws.com", :web, :workers, {:brute => true}



after "deploy", "resque:restart"

namespace :resque do
  task :restart, :roles => [:workers]  do
    run "cd #{current_path} && rake kill_workers"
    run "cd #{current_path} && QUEUE=* nohup rake resque:work && true", :except => { :brute => true }
    run "cd #{current_path} && COUNT=4 QUEUE=* nohup rake resque:workers && true", :only => { :brute => true }
  end
end


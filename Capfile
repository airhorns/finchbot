require 'bundler/capistrano'
load 'deploy' if respond_to?(:namespace)

set :scm, :git
set :deploy_via, :remote_cache
set :repository, "git@github.com:hornairs/finchbot.git"
set :deploy_to, "~/finchbot"
set :use_sudo, false
role :workers, "hornairs@tarmac.skylightlabs.ca:2234", "hornairs@scurvvy.info:2234", "bitnami@ec2-184-72-210-109.compute-1.amazonaws.com"



task :restart_workers do
end
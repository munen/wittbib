require 'bundler/capistrano'
require 'capistrano/ext/multistage'

set :application, 'wittbib'
set :rails_env, 'production'

#set :deploy_via, :remote_cache
set :default_run_options, { :pty => true }

set :scm, :git
set :repository, 'git@github.com:munen/wittbib.git'
set :branch, 'master'
set :deploy_to, '/home/rails/app'

set :ssh_options, {:forward_agent => true}
set :user, 'rails'
set :use_sudo, false

task :update_config_links, :roles => [:app] do
  run "ln -sf #{shared_path}/config/* #{release_path}/config/"
  run "ln -sf #{shared_path}/uploads #{release_path}/public/uploads"
end
after "deploy:update_code", :update_config_links


# Overwrite deployment methods
# deploy:start and deploy:stop aren't needed as they're handled by passenger
# deploy:restart is realized though updating the timestamp in ./tmp/restart.txt'
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

after :deploy, 'deploy:cleanup'

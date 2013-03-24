require 'bundler/capistrano'
require 'capistrano/ext/multistage'
require 'capistrano-rbenv'

set :rbenv_ruby_version, "2.0.0-p0"
set :rbenv_install_dependencies, false

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

# Unicorn integration, Nico Schottelius, 2013-03-24
set :unicorn_binary, "bundle exec unicorn --listen #{current_path}/unicorn.sock --env #{rails_env} --daemonize"
set :unicorn_pid, "#{current_path}/tmp/pids/unicorn.pid"

namespace :deploy do
  task :start, :roles => :app, :except => { :no_release => true } do
    run "cd #{current_path} && #{unicorn_binary}"
  end

  task :stop, :roles => :app, :except => { :no_release => true } do
    run "if [ -f #{unicorn_pid} ]; then kill `cat #{unicorn_pid}`; fi"
  end

  task :graceful_stop, :roles => :app, :except => { :no_release => true } do
    run "if [ -f #{unicorn_pid} ]; then kill -s QUIT `cat #{unicorn_pid}`; fi"
  end

  task :reload, :roles => :app, :except => { :no_release => true } do
    run "if [ -f #{unicorn_pid} ]; then kill -s USR2 `cat #{unicorn_pid}`; fi"
  end

  task :restart, :roles => :app, :except => { :no_release => true } do
    stop
    start
  end
end

after :deploy, 'deploy:cleanup'

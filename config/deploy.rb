require 'bundler/capistrano'

server 'rails-19.panter.ch', :app, :web, :db, :primary => true
set :deploy_to, "/home/rails/app"
set :user, "rails"

set :application, "wittbib"
set :rails_env, 'production'

set :deploy_via, :remote_cache
set :scm, :git
set :default_run_options, { :pty => true }
set :repository, "git@github.com:munen/wittbib.git"
set :ssh_options, {:forward_agent => true}
set :use_sudo, false
set :branch, 'nico_1.9.3-p327'

after "deploy", "deploy:cleanup"

namespace :deploy do
  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end
end

task :update_config_links, :roles => [:app] do
  run "ln -sf #{shared_path}/config/* #{release_path}/config/"
end
after "deploy:update_code", :update_config_links

require 'capistrano-rbenv'
set :rbenv_ruby_version, "1.9.3-p327"
set :rbenv_install_dependencies, false

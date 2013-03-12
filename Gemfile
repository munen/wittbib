source 'http://rubygems.org'

gem 'rails', '3.2'

# Rails 3.2 - Asset Pipeline
gem 'json', '1.7.7'
gem 'haml', '3.1.4'
gem 'sass-rails', '3.2.3'
gem 'coffee-rails', '3.2.1'
gem 'uglifier', '1.0.3'
gem 'therubyracer'

# gems in alphabetic order
gem 'devise'
gem 'exception_notification_rails3', '1.2.0', :require => 'exception_notifier'
gem 'inherited_resources', '1.3.0'
gem 'jquery-rails', '2.0.2'
gem 'rake', '0.9.2.2'
gem 'unicorn'


gem 'formtastic-bootstrap',
  :git => 'git://github.com/cgunther/formtastic-bootstrap.git',
  :branch => 'bootstrap2-rails3-2-formtastic-2-1'
gem 'formtastic',
  :git => 'git://github.com/justinfrench/formtastic.git',
  :branch => '2.1-stable'
gem 'font-awesome-rails'

gem 'anjlab-bootstrap-rails', '>= 2.0', :require => 'bootstrap-rails'
gem "simple_datatables", :git => "git://github.com/munen/simple_datatables.git"
gem "will_paginate"
gem 'chosen-rails'
gem 'googlebooks'

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
group :development, :test do
  gem 'capistrano'
  gem 'capistrano-rbenv'
  gem 'capybara', '1.1.1'
  gem 'erb2haml'
  gem 'factory_girl'
  gem 'guard-rspec'
  gem 'guard-spork'
  gem 'rspec-rails', '2.8.1'
  gem 'ruby-debug19'
  gem 'spork', "0.9.0.rc9"
  gem 'sqlite3-ruby', :require => 'sqlite3'
  gem 'yard'
end

group :production do
  gem 'pg', '0.11.0'
end


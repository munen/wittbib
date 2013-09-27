source 'http://rubygems.org'

gem 'rails', '3.2.13'

# Rails 3.2 - Asset Pipeline
gem 'json', '1.7.7'
gem 'sass', '3.1.20'
gem 'haml', '3.1.4'
gem 'sass-rails', '3.2.6'
gem 'coffee-rails', '3.2.1'
gem 'uglifier', '1.0.3'
gem 'therubyracer'

# gems in alphabetic order
gem 'cancan'
gem 'devise'
gem 'exception_notification_rails3', '1.2.0', :require => 'exception_notifier'
gem 'inherited_resources', '1.3.0'
gem 'jquery-rails', '2.0.2'
gem 'rake', '0.9.2.2'

gem 'formtastic-bootstrap',
  :git => 'git://github.com/cgunther/formtastic-bootstrap.git',
  :branch => 'bootstrap2-rails3-2-formtastic-2-1'
gem 'formtastic',
  :git => 'git://github.com/justinfrench/formtastic.git',
  :branch => '2.1-stable'
gem 'font-awesome-rails'

gem 'anjlab-bootstrap-rails', '2.0.4.4', :require => 'bootstrap-rails'
gem "simple_datatables", :git => "git://github.com/munen/simple_datatables.git"
gem "will_paginate"
gem 'chosen-rails'
gem 'sqlite3-ruby', :require => 'sqlite3'

# ISBN apis
gem 'googlebooks'

# amazon product advertising api
# http://docs.aws.amazon.com/AWSECommerceService/latest/DG/EX_LookupbyISBN.html
gem 'vacuum'

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
group :development, :test do
  #gem 'ruby-debug19'
  gem 'debugger'
  gem 'capistrano', '2.8.0'
  gem 'capistrano-ext'
  gem 'capistrano-rbenv', '>= 1.0.0'
  gem 'capybara', '1.1.1'
  gem 'database_cleaner'
  gem 'erb2haml'
  gem 'factory_girl'
  gem 'guard-rspec'
  gem 'guard-spork'
  gem 'launchy'
  gem 'poltergeist'
  gem 'rspec-rails', '2.8.1'
  gem 'spork', "0.9.0.rc9"
  gem 'vcr', require: false
  gem 'webmock', require: false
  gem 'yard'
end

group :production do
  gem 'pg', '0.11.0'
  gem 'unicorn'
end

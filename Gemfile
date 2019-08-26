source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'
# Used to stylize datepickers
gem 'bootstrap-datepicker-rails', '1.8.0.1'
# Used to enable bootstrap in the application
gem 'bootstrap', '~> 4.3.1'
gem 'jquery-rails', '4.3.5'
gem 'faker', '1.6.6'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails',                      '~> 5.2.1'
# Used for pagination
gem 'will_paginate', '~> 3.1.0'
# adds secured password
gem 'bcrypt', '3.1.7'
# Used to show all the cities in Romania
gem 'city-state', '0.0.13'
# Used to calculate the distance between 2 cities
gem 'geocoder', '1.3.7'
# Used for filters, sorts
gem 'filterrific',                '5.1.0'
# Used for searches
gem 'ransack',                    '~> 2.1.1'
# Use Puma as the app server
gem 'puma',                       '3.12.0'
# Use SCSS for stylesheets
gem 'sass-rails',                 '5.0.7'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier',                   '4.1.19'
# Use execjs to run JavaScript code from ruby
gem 'execjs',                     '2.7.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails',               '4.2.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks',                 '5.2.0'
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap',                   '1.3.2', require: false
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data',                '1.2018.5', platforms: %i[mingw mswin x64_mingw jruby]
# Tame Rails' multi-line logging into a single line per request
gem 'lograge',                    '0.10.0'
# This gem embeddes the jQuery colorpicker in the Rails asset pipeline.
gem 'jquery-minicolors-rails',    '2.2.6.1'

group :test do
  # Used for testing (TDD, BDD), mocking, benchmarking
  gem 'minitest',                 '5.11.3'
  # Extend minitest through simple hooks
  gem 'minitest-reporters',       '1.3.4'
  # Extracting `assigns` and `assert_template` from ActionDispatch.
  gem 'rails-controller-testing', '1.0.2'
  # Provides information on test coverage
  gem 'simplecov',                '0.16.1'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug',                   '10.0.2', platforms: %i[mri mingw x64_mingw]
end

group :development do
  # This module allows Ruby to interface with the SQLite3 database engine
  gem 'sqlite3',                  '1.3.13'
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console',              '3.7.0'
  # The Listen gem listens to file modifications and notifies you about the changes.
  gem 'listen',                   '3.1.5'
  # Spring speeds up development by keeping your application running in the background.
  gem 'spring',                   '2.0.2'
  # Makes spring watch files using the listen gem.
  gem 'spring-watcher-listen',    '2.0.1'
end

group :development, :staging do
  gem 'letter_opener',            '1.6.0'
  gem 'letter_opener_web',        '1.3.4'
end

group :production, :staging do
  # Use postgresql as the database for Active Record
  gem 'pg',                       '1.1.3'
end

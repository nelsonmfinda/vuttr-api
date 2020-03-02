source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.6.0"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem "rails", "~> 5.2.2"
# Use postgresql as the database for Active Record
gem "pg", ">= 0.18", "< 2.0"
# Use Puma as the app server
gem "puma", "~> 3.12"
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
gem "bcrypt", "~> 3.1.7"

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", ">= 1.1.0", require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem "rack-cors", "~> 1.0"

# A rack middleware for throttling and blocking abusive requests
gem "rack-attack", "~> 5.4", ">= 5.4.2"

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  # BDD for Ruby
  gem "rspec", "~> 3.8"
  # RSpec testing framework to Ruby on Rails
  gem "rspec-rails", "~> 3.8"
  # A simple gem to generate all files needed in a project Mobile, Web and Api for Testing Automation
  gem "rubygene", "~> 0.4.0"
  # The instafailing RSpec progress bar formatter
  gem "fuubar", "~> 2.0"
  # A library for generating fake data such as names, addresses, and phone numbers
  gem "faker", git: "https://github.com/stympy/faker.git", branch: "master"
  # Code style checking for RSpec files. A plugin for the RuboCop code style enforcing & linting tool.
  gem "rubocop-rspec", "~> 1.33"
  # A collection of RuboCop cops to check for performance optimizations in Ruby code.
  gem "rubocop-performance", "~> 0.0.1"
  # Automatic Rails code style checking tool.
  # A RuboCop extension focused on enforcing Rails best practices and coding conventions.
  gem "rubocop-rails", "~> 2.0", ">= 2.0.1"
end

group :test do
  # database_cleaner is not required, but highly recommended
  gem "database_cleaner"
  # Shoulda Matchers provides RSpec- and Minitest-compatible one-liners that test common Rails functionality
  gem "shoulda-matchers"
  # A library for setting up Ruby objects as test data
  gem "factory_bot_rails", "~> 5.0", ">= 5.0.1"
  # Validate your Rails JSON API's JSON
  gem "json_matchers", "~> 0.11.0"
  # Automatically generate API documentation from RSpec
  gem "dox", require: false
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  # Use Pry as your rails console
  gem "pry-rails"
end

# Centralization of locale data collection for Ruby on Rails.
gem "rails-i18n"
# A pure ruby implementation of the RFC 7519 OAuth JSON Web Token (JWT) standard
gem "jwt", "~> 1.5", ">= 1.5.4"
# Making it easy to serialize models for client-side use
gem "active_model_serializers", "~> 0.10.9"
# will_paginate provides a simple API for performing paginated queries with Active Record,
# DataMapper and Sequel, and includes helpers for rendering pagination links
gem "will_paginate", "~> 3.1", ">= 3.1.7"
# A Ruby implementation of the Coveralls API.
gem 'coveralls', '~> 0.8.21', require: false
# Code coverage for Ruby 1.9+ with a powerful configuration
# library and automatic merging of coverage across test suites
gem 'simplecov', '~> 0.16.1'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]

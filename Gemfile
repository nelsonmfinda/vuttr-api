source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.2'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors', '~> 1.0', '>= 1.0.3'

# A rack middleware for throttling and blocking abusive requests
gem 'rack-attack', '~> 5.4', '>= 5.4.2'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # RSpec testing framework to Ruby on Rails
  gem 'rspec-rails', '~> 3.8'
  # Use your Rspec tests to build your API documentation
  # gem 'rspec-api-blueprint-formatter', '~> 0.2.2'
  # A simple gem to generate all files needed in a project Mobile, Web and Api for Testing Automation
  gem 'rubygene', '~> 0.4.0'
  # Guard is a command line tool to easily handle events on file system modifications
  # gem 'guard', '~> 2.14'
  # Guard::RSpec automatically run your specs
  gem 'guard-rspec', '~> 4.7', '>= 4.7.3', require: false
  # The instafailing RSpec progress bar formatter
  gem 'fuubar', '~> 2.0'
end

group :test do
  # database_cleaner is not required, but highly recommended
  gem 'database_cleaner'
  # Shoulda Matchers provides RSpec- and Minitest-compatible one-liners that test common Rails functionality
  gem 'shoulda-matchers'
  # A library for setting up Ruby objects as test data
  gem 'factory_bot_rails', '~> 5.0', '>= 5.0.1'
  # A library for generating fake data such as names, addresses, and phone numbers
  gem 'faker', :git => 'https://github.com/stympy/faker.git', :branch => 'master'
  # Makes http fun! Also, makes consuming restful web services dead easy
  gem 'httparty', '~> 0.16.4'
  # Validate the JSON returned by your Rails JSON APIs
  gem 'json_matchers', '~> 0.10.0'
  gem 'rails-controller-testing'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Centralization of locale data collection for Ruby on Rails.
# gem 'rails-i18n'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

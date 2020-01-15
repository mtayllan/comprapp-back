source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'bootsnap', '>= 1.4.2', require: false # Boot large ruby/rails apps faster
gem 'graphql' # Ruby implementation of GraphQL
gem 'graphql_devise' # GraphQL interface on top of the Devise Token Auth (DTA) gem.
gem 'pg', '>= 0.18', '< 2.0' # Pg is the Ruby interface to the PostgreSQL RDBMS
gem 'puma', '~> 4.1' # Puma is a simple, fast, threaded, and highly concurrent HTTP 1.1 server
gem 'rack-cors' # Rack Middleware for handling Cross-Origin Resource Sharing (CORS), which makes cross-origin AJAX possible.
gem 'rails', '~> 6.0.2', '>= 6.0.2.1' # Ruby on Rails
gem 'rolify' # Role management library with resource scoping
gem 'sprockets', '~> 3' # Rack-based asset packaging system

group :development, :test do
  gem 'awesome_print' # Great Ruby dubugging companion: pretty print Ruby objects to visualize their structure
  gem 'database_cleaner' # Strategies for cleaning databases in Ruby. Can be used to ensure a clean state for testing.
  gem 'faker' # A library for generating fake data such as names, addresses, and phone numbers
  gem 'pry-byebug' # Combine 'pry' with 'byebug'. Adds 'step', 'next', 'finish', 'continue' and 'break' commands to control execution
  gem 'rspec-graphql_matchers' # Collection of rspec matchers to test your graphQL api schema.
  gem 'rspec-rails' # rspec-rails is a testing framework for Rails 3+
  gem 'rubocop', require: false # Automatic Ruby code style checking tool
  gem 'rubocop-performance', require: false # A collection of RuboCop cops to check for performance optimizations in Ruby code
  gem 'rubocop-rails', require: false # Automatic Rails code style checking tool
  gem 'rubocop-rspec', require: false # Code style checking for RSpec files
end

group :development do
  gem 'better_errors' # Provides a better error page for Rails and other Rack apps
  gem 'graphiql-rails' # Mount the GraphiQL query editor in a Rails app
  gem 'listen', '>= 3.0.5', '< 3.2' # The Listen gem listens to file modifications and notifies you about the changes.
  gem 'pry', '~> 0.12' # An IRB alternative and runtime developer console
  gem 'pry-rails', '~> 0.3' # Use Pry as your rails console
  gem 'spring' # Preloads your application so things like console, rake and tests run faster
  gem 'spring-commands-rspec' # implements the rspec command for Spring.
  gem 'spring-watcher-listen', '~> 2.0.0' # This gem makes Spring watch the filesystem for changes using Listen rather than by polling the filesystem.
end

group :test do
  gem 'factory_bot_rails' # factory_bot is a fixtures replacement with a straightforward definition syntax, support for multiple build strategies
  gem 'shoulda-matchers' # Simple one-liner tests for common Rails functionality
  gem 'simplecov', require: false # Code coverage for Ruby 1.9+ with a powerful configuration library and automatic merging
end

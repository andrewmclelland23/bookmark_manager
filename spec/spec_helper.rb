require 'capybara/rspec'
require 'rspec'
require 'simplecov'
require 'simplecov-console'
require_relative './setup_test_database'
require_relative 'web_helpers'
require_relative 'database_helpers'
# require 'features/web_helpers.rb'

ENV['ENVIRONMENT'] = 'test'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([SimpleCov::Formatter::Console])
SimpleCov.start

RSpec.configure do |config|
  config.after(:suite) do
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end

  config.before(:each) do
    test_db_setup
  end

  ENV['RACK_ENV'] = 'test'

  # require our Sinatra app file
  require File.join(File.dirname(__FILE__), '..', 'app.rb')

  # tell Capybara about our app class
  Capybara.app = BookmarkManager
end

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

ActionDispatch::IntegrationTest.configure do |config|
  config.include Devise::Test::IntegrationHelpers, type: :system
  config.include Warden::Test::Helpers
end

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    # Add more helper methods to be used by all tests here...

    include FactoryBot::Syntax::Methods
    FactoryBot.definition_file_paths = [File.expand_path('../factories', __dir__)]
    FactoryBot.find_definitions
  end
end

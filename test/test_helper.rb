ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase
  fixtures :all

  # Enable stubbing in tests
  include ActiveSupport::Testing::Assertions
  include Minitest::Assertions
end

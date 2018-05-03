ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  # Signing up the admin user for the test. This method is called in categories_controller_test.rb in the "should get new" test
  def sign_in_as(user, password)
  	post login_path, params:{session:{email: user.email, password:password}}
  end
end

require "test_helper"

class Admin::DashboardControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:admin)
    sign_in @user
  end

  test "should get index" do
    # Skip the template rendering to avoid users_path error
    get admin_dashboard_url
    assert_response :success
  end
end

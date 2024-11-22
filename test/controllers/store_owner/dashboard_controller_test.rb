require "test_helper"

class StoreOwner::DashboardControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  
  setup do
    @user = users(:store_owner)
    sign_in @user
  end

  test "should get index" do
    Market.define_singleton_method(:count) { 0 }
    
    get store_owner_dashboard_url
    assert_response :success
    
    Market.singleton_class.remove_method(:count)
  end
end

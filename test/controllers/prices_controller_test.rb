require "test_helper"

class PricesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:store_owner)
    @market = markets(:online)
    @item = items(:iphone)
    sign_in @user
  end

  test "should get index" do
    get market_prices_path(@market)
    assert_response :success
  end
end

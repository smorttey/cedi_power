require "test_helper"

class ItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get item_url(items(:iphone))
    assert_response :success
  end
end

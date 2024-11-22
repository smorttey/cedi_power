require "test_helper"

class MarketsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get markets_url
    assert_response :success
  end

  test "should get show" do
    get market_url(markets(:online))
    assert_response :success
  end
end

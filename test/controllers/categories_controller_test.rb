require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category = categories(:electronics)
    @item = items(:iphone)
  end

  test "should get index" do
    get categories_url
    assert_response :success
  end

  test "should get show" do
    get category_url(@category)
    assert_response :success
  end
end

require "test_helper"

class PriceTest < ActiveSupport::TestCase
  test "price history should group by month" do
    item = items(:iphone)
    market = markets(:online)
    
    # Clear existing prices for this test
    item.prices.destroy_all
    
    Price.create!(
      item: item,
      market: market,
      price: 10.0,
      date_recorded: Date.new(2024, 1, 1)
    )

    Price.create!(
      item: item,
      market: market,
      price: 20.0,
      date_recorded: Date.new(2024, 1, 15)
    )

    history = item.prices.price_history
    assert_equal 15.0, history[Date.new(2024, 1, 1)]
  end
end

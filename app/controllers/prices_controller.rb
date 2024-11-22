class PricesController < ApplicationController
  def index
    @market = Market.friendly.find(params[:market_slug])
    @prices = policy_scope(@market.prices)
  end
end

class PricesController < ApplicationController
  def index
    @market = Market.find(params[:market_id])
    @prices = policy_scope(@market.prices) # Scope for index
  end
end

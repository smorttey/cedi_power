class PricesController < ApplicationController
  def index
    @market = Market.find(params[:market_id])
    @prices = @market.prices.includes(:item).order(date_recorded: :desc)
  end
end

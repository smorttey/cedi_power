class MarketsController < ApplicationController
  def index
    @markets = Market.all
  end

  def show
    @market = Market.friendly.find(params[:slug])
    @prices = @market.prices.includes(:item).order(date_recorded: :desc)
  end
end

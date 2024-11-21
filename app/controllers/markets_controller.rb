class MarketsController < ApplicationController
  def index
    @markets = Market.all
    prepare_meta_tags(
      title: "Markets and Stores in Ghana",
      description: "Explore markets and stores like Makola and Kejetia to discover price trends.",
      keywords: "markets, Ghana, Makola, Kejetia"
    )
  end

  def show
    @market = Market.friendly.find(params[:slug])
    @prices = @market.prices.includes(:item).order(date_recorded: :desc)
    prepare_meta_tags(
      title: @market.name,
      description: "Browse items and prices available in #{@market.name}.",
      keywords: @market.name
    )
  end
end

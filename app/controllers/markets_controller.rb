class MarketsController < ApplicationController
  def index
    @markets = policy_scope(Market) # Scope for index
    prepare_meta_tags(
      title: "Markets and Stores in Ghana",
      description: "Explore markets and stores like Makola and Kejetia to discover price trends.",
      keywords: "markets, Ghana, Makola, Kejetia"
    )
  end

  def show
    @market = Market.friendly.find(params[:slug])
    authorize @market
    @prices = @market.prices
      .includes(item: :category)
      .order(date_recorded: :desc)
    
    prepare_meta_tags(
      title: "Prices at #{@market.name}",
      description: "Current prices for items available at #{@market.name} in #{@market.location}.",
      keywords: [@market.name, @market.location, "prices", "market"].join(", ")
    )
  end
end

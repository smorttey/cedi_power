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
    authorize @market # Authorize action
    @prices = @market.prices.includes(:item).order(date_recorded: :desc)
    prepare_meta_tags(
      title: @market.name,
      description: "Browse items and prices available in #{@market.name}.",
      keywords: @market.name
    )
  end
end

class ItemsController < ApplicationController
  def index
    @items = policy_scope(Item)
    # Add any other index action logic here
  end

  def show
    @item = Item.friendly.find(params[:slug])
    authorize @item
    @prices = @item.prices
      .includes(:market)
      .where("date_recorded >= ?", 1.year.ago)
      .order(date_recorded: :desc)

    @price_history = @prices.price_history

    prepare_meta_tags(
      title: "Price of #{@item.name} in Ghana",
      description: "Check out the current and historical prices for #{@item.name} in Ghanaian markets.",
      keywords: [ @item.name, @item.category.name ].join(", ")
    )
  end
end

class ItemsController < ApplicationController
  def show
    @item = Item.friendly.find(params[:slug])
    authorize @item # Authorize action
    @prices = @item.prices.includes(:market).order(date_recorded: :desc)
    prepare_meta_tags(
      title: "What is the price of #{@item.name} in Ghana?",
      description: "Check out the current and historical prices for #{@item.name} in Ghanaian markets.",
      keywords: [@item.name, @item.category.name].join(", ")
    )
  end
end

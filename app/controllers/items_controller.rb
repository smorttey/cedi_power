class ItemsController < ApplicationController
  def show
    @item = Item.friendly.find(params[:slug])
    @prices = @item.prices.includes(:market).order(date_recorded: :desc)
  end
end

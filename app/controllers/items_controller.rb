class ItemsController < ApplicationController
  def show
    @item = Item.find_by!(slug: params[:slug])
    @prices = @item.prices.includes(:market).order(date_recorded: :desc)
  end
end

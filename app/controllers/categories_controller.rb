class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.friendly.find(params[:id])
    @items = @category.items
  end
end

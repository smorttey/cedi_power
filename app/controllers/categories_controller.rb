class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    prepare_meta_tags(
      title: "Browse All Categories",
      description: "Explore all categories of items in Ghanaian markets and stores.",
      keywords: "categories, Ghana, market prices"
    )
  end

  def show
    @category = Category.friendly.find(params[:id])
    @items = @category.items
    prepare_meta_tags(
      title: @category.name,
      description: "Find items under the #{@category.name} category in Ghanaian markets.",
      keywords: @category.name
    )
  end
end

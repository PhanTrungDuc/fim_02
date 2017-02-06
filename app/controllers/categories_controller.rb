class CategoriesController < ApplicationController
  load_resource

  def index
    @search = Category.search params[:q]
    @categories = @search.result
    @category = Category.all
  end
end

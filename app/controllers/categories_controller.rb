class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def list
    @recipes = Recipe.find_all_by_Category_id(params[:id])
  end
end

class RecipesController < ApplicationController
  def list
    @list = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
    if @recipe.blank?
      redirect_to '/'
    end
  end
end

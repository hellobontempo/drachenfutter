class RecipesController < ApplicationController


  def new
  end

  def create
  end

  def show
    @recipe = Recipe.find_by_id(params[:id])
  end

  def index
    if params[:q]
      @recipes = Recipe.search_by_ingredient(params[:q]) 
    else
      @recipes = Recipe.order(:title)
    end
  end

end

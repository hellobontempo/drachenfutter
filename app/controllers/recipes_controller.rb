class RecipesController < ApplicationController


  def new
  end

  def create
  end

  def show
    @recipe = Recipe.find_by_id(params[:id])
  end

  def index
    @recipes = Recipe.order(:title)
  end

end

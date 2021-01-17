class RecipesController < ApplicationController


  def new
  end

  def create
  end

  def show
    byebug
    @recipe = Recipe.find_by(params[:id])
  end

  def index
    @recipes = Recipe.order(:title)
  end

end

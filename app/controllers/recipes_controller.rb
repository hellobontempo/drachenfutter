class RecipesController < ApplicationController
  def new
  end

  def create
  end

  def show
  end

  def index
    @recipes = Recipe.order(:title)
  end

end

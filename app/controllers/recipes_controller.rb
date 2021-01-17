class RecipesController < ApplicationController
include RecipesHelper

  def new
  end

  def create
  end

  def show
    @recipe = Recipe.find_by(params[:id])
  end

  def index
    @recipes = Recipe.order(:title)
  end

end

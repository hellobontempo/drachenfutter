class RecipesController < ApplicationController


  def new
    @recipe = Recipe.new
    @ingredient = Ingredient.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
      if @recipe.save
        redirect_to recipe_path(@recipe)
      else
        render :new
      end
  end

  def show
    @recipe = Recipe.find_by_id(params[:id])
  end

  def index
    @ingredients = Ingredient.pluck(:name).sort
    if params[:q]
      @recipes = Recipe.search_by_ingredient(params[:q]) 
    else
      @recipes = Recipe.order(:title)
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :instructions, ingredient_ids:[])
  end

end

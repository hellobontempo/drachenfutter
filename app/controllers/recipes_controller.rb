class RecipesController < ApplicationController
  
  def index
    @recipes = Recipe.order(:title)
    if params[:q]
        @recipes = @recipes.search_by_ingredient(params[:q])
    end
  end

  def new
    @recipe = Recipe.new
    5.times do 
      @recipe.recipe_ingredients.build
    end
  end

  def create
    @recipe = Recipe.new(recipe_params)
      @recipe.titlecase_title
      if @recipe.save
        redirect_to @recipe, alert: "Successfully created recipe."
      else 
        render 'recipes/new'
      end
  end

  def show
    @recipe = Recipe.find_by_id(params[:id])
  end

  

  private

  def recipe_params
    params.require(:recipe).permit(
      :title, 
      :source, 
      :instructions, 
      ingredient_ids:[], 
      ingredients: [:name],
      recipe_ingredients_attributes: [
        :amount,
        ingredient_attributes: [:name]
      ]
      )
  end

end

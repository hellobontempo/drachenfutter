class RecipesController < ApplicationController
  
  def index
    #@ingredients = Ingredient.pluck(:name).sort
    if params[:q]
      @recipes = Recipe.search_by_ingredient(params[:q]) 
    else
      @recipes = Recipe.order(:title)
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
    #if params[:add_ingredient]
       byebug
      @recipe.recipe_ingredients.each do |ri|
        ri.find_or_create_ingredient
      end
      @recipe.titlecase_title
      @recipe.save
   
      redirect_to @recipe, alert: "Successfully created recipe."
    
    #end
    #render :new
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
        amount:[],
        ingredient_attributes: [:name]
      ]
      )
  end

end

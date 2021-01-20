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
    #@ingredient = Ingredient.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if params[:add_ingredient]
      @recipe.recipe_ingredients.each do |ri|
        ri.find_or_create_ingredient
      end
      @recipe.titlecase_title
      @recipe.save
      byebug
    # elsif params[:remove_ingredient]
    #   #nested model that have _destroy attribute = 1 auto deleted
    # else
    #   if @recipe.save
        redirect_to @recipe, alert: "Successfully created recipe."
      #end
    end
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
    #params.require(:recipe).permit(:title, :instructions, ingredient_ids:[])
  end

# amount =  recipe_params["recipe_ingredients_attributes"]["0"]["amount"]
# ingredient = recipe_params["recipe_ingredients_attributes"]["0"]["ingredient_attributes"]["name"]


end

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
    3.times do 
      @recipe.recipe_ingredients.build
    end
    #@ingredient = Ingredient.new
  end

  def create
    @recipe = Recipe.new(title: recipe_params[:title], instructions: recipe_params[:instructions], source: recipe_params[:source])
    byebug
    if params[:add_ingredient]
      # ing = Ingredient.find_or_create_by(name: recipe_params[:ingredients][:name].titlecase)
      # @recipe.recipe_ingredients << ing
      # @recipe.save
    elsif params[:remove_ingredient]
      #nested model that have _destroy attribute = 1 auto deleted
    else
      if @recipe.save
        redirect_to @recipe, alert: "Successfully created recipe."
      end
    end
    render :new
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
      recipe_ingredients_attributes: [:amount]
      )
    #params.require(:recipe).permit(:title, :instructions, ingredient_ids:[])
  end

end

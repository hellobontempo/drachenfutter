class RecipesController < ApplicationController
  
  def index
    @recipes = Recipe.order(:title)
    if params[:q]
        @recipes = @recipes.search_by_ingredient(params[:q])
    end
  end

  # def new
  #   @recipe = Recipe.new
  #   @recipe.recipe_ingredients.build #@recipe.ingredients.build # build ingredient attributes, nothing new here
  # end

  # def create
  #   @recipe = Recipe.new(recipe_params)
  #   if params[:add_ingredient]
  #     # add empty ingredient associated with @recipe
  #     @recipe.recipe_ingredients.build
  #   elsif params[:remove_ingredient]
  #     # nested model that have _destroy attribute = 1 automatically deleted by rails
  #   else
  #     @recipe.creator = current_user
  #     @recipe.titlecase_title
  #     if @recipe.save
  #       flash[:notice] = "Successfully created recipe."
  #       redirect_to @recipe and return
  #     end
  #   end
  #   render :action => 'new'
  # end
  
  def new
    redirect_if_not_logged_in
    @recipe = Recipe.new
    
    10.times do 
      @recipe.recipe_ingredients.build
    end
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.creator = current_user
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

  def edit
    @recipe = Recipe.find_by_id(params[:id])
    redirect_to recipe_path(@recipe) unless @recipe.creator ==  current_user
  end

  def update
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.update(recipe_params)
    redirect_to @recipe
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
        :id,
        :amount,
        ingredient_attributes: [
          :name, 
          :_destroy
        ]
      ]
      )
  end

end

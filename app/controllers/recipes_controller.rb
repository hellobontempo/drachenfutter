class RecipesController < ApplicationController
  
  def index
    @recipes = Recipe.order(:title)
    if params[:q]
        @recipes = @recipes.search_by_ingredient(params[:q])
    elsif params[:category]
      @recipes = @recipes.search_by_category(params[:category])
    end
  end

  def new
    redirect_if_not_logged_in
    @recipe = Recipe.new
    @recipe_ingredient = @recipe.recipe_ingredients.build 
    @ingredient = @recipe_ingredient.build_ingredient 
  end

  def create
    @recipe = Recipe.new(recipe_params)
    test = true
    @recipe.recipe_ingredients.each do |i|
      if i.ingredient_id.nil?
        test = false
        i.build_ingredient
      end
    end

    if params[:add_ingredient]
      if test
        @recipe_ingredient = @recipe.recipe_ingredients.build 
        @ingredient = @recipe_ingredient.build_ingredient
      end
    elsif params[:remove_ingredient]

    else
      @recipe.creator = current_user
      @recipe.titlecase_title
      if @recipe.save
        flash[:notice] = "Successfully created recipe."
        redirect_to @recipe and return
      end
    end
    render :action => 'new'
  end
  
  # def new
  #   redirect_if_not_logged_in
  #   @recipe = Recipe.new
    
  #   10.times do 
  #     @recipe.recipe_ingredients.build
  #   end
  # end

  # def create
  #   @recipe = Recipe.new(recipe_params)
  #   @recipe.creator = current_user
  #   @recipe.titlecase_title
  #     if @recipe.save
  #       redirect_to @recipe, alert: "Successfully created recipe."
  #     else 
  #       render 'recipes/new'
  #     end
  # end

  def show
    @recipe = Recipe.find_by_id(params[:id])
  end

  def edit
    @recipe = Recipe.find_by_id(params[:id])
    redirect_to recipe_path(@recipe) unless @recipe.creator ==  current_user
  end

  def update
    @recipe = Recipe.find(params[:id])
    test = true
    @recipe.recipe_ingredients.each do |i|
      if i.ingredient_id.nil?
        test = false
        i.build_ingredient
      end
    end
    if params[:add_ingredient]
    
      unless recipe_params[:recipe_ingredients_attributes].blank?
      for attribute in recipe_params[:recipe_ingredients_attributes]
        @recipe.recipe_ingredients.build(attribute.last.except(:_destroy)) unless attribute.last.has_key?(:recipe_ingredient_id)
        end
      end
      if test
        @recipe_ingredient = @recipe.recipe_ingredients.build 
        @ingredient = @recipe_ingredient.build_ingredient
      end
    # elsif params[:remove_ingredient]
    #   if !recipe_params[:recipe_ingredients_attributes].blank?
    #       recipe_params[:recipe_ingredients_attributes].values.each do |value|
    #         if value[:id]
    #           RecipeIngredient.find(value[:id]).update(value.except(:_destroy, :id))
    #           RecipeIngredient.find(value[:id]).destroy if value[:_destroy] == "1"
    #         else
    #           @recipe.recipe_ingredients.build(value.except(:_destroy)) unless value[:_destroy] == "1"
    #         end
    #       end
    #     end

    else
      if @recipe.update(recipe_params)
        byebug
        flash[:alert] = "Successfully updated recipe."
        redirect_to @recipe and return
      end
    end
    render :edit
  end

  # def update
  #   @recipe = Recipe.find_by_id(params[:id])
  #   @recipe.update(recipe_params)
  #   redirect_to @recipe
  # end
  

  private


  def recipe_params
    params.require(:recipe).permit(
      :title, 
      :source, 
      :instructions, 
      ingredient_ids:[], 
      recipe_ingredients_attributes: [
        :id,
        :amount,
        :_destroy,
        ingredient_attributes: [
          :name, 
          :id
        ]
      ]
      )
  end
  # def recipe_params
  #   params.require(:recipe).permit(
  #     :title, 
  #     :source, 
  #     :instructions, 
  #     ingredient_ids:[], 
  #     ingredients: [:name],
  #     recipe_ingredients_attributes: [
  #       :id,
  #       :amount,
  #       ingredient_attributes: [
  #         :name, 
  #         :_destroy
  #       ]
  #     ]
  #     )
  # end

end

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
    #byebug
    if params[:add_ingredient]
    
      unless recipe_params[:recipe_ingredients_attributes].blank?
      for attribute in recipe_params[:recipe_ingredients_attributes]
      @recipe.recipe_ingredients.build(attribute.last.except(:_destroy)) # unless attribute.last.has_key?(:ingredient_id)
      end
      end
      if test
        @recipe_ingredient = @recipe.recipe_ingredients.build 
        @ingredient = @recipe_ingredient.build_ingredient
      end
          # add one more empty ingredient attribute
      # @recipe.recipe_ingredients.build_ingredient
    elsif params[:remove_ingredient]
      # collect all marked for delete ingredient ids
      # removed_ingredients = params[:recipe][:ingredients_attributes].collect { |i, att| att[:id] if (att[:id] && att[:_destroy].to_i == 1) }
      # # physically delete the ingredients from database
      # Ingredient.delete(removed_ingredients)
      flash[:alert] = "Ingredients removed."
      for attribute in params[:recipe][:ingredients_attributes]
      	# rebuild ingredients attributes that doesn't have an id and its _destroy attribute is not 1
        @recipe.ingredients.build(attribute.last.except(:_destroy)) if (!attribute.last.has_key?(:id) && attribute.last[:_destroy].to_i == 0)
      end
    else
      # save goes like usual
      if @recipe.update(recipe_params)
        flash[:alert] = "Successfully updated recipe."
        redirect_to @recipe and return
      end
    end
    render :action => 'edit'
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

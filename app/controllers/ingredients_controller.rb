class IngredientsController < ApplicationController
  before_action :redirect_if_not_logged_in
  skip_before_action :redirect_if_not_logged_in, only: [:index, :show]

  def index
    @ingredients = Ingredient.order_by_name
    if params[:q]
      @ingredients = Ingredient.search_by_name(params[:q])
    end
  end

  # removed ability to create ingredients so must be done through new recipe form, saving code in case want to add back 
  # def new
  #   @ingredient = Ingredient.new
  # end

  # def create
  #   @ingredient = Ingredient.new(ingredient_params)
  #   @ingredient.name = @ingredient.name.titlecase
  #   if @ingredient.name.present? 
  #     if Ingredient.find_by(name: @ingredient.name).present?
  #       flash[:alert]= "That ingredient already exists"
  #       render :new
  #     else
  #       @ingredient.name = ingredient_params[:name].titlecase
  #       @ingredient.save
  #       redirect_to new_ingredient_path, alert: "Your Ingredient has been saved!"
  #     end
  #   else
  #     flash[:alert]= "That didn't work"
  #     render :new
  #   end
    
  # end


  private

    def ingredient_params
      params.require(:ingredient).permit(:name)
    end


end

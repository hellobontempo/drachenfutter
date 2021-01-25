class ReviewsController < ApplicationController


  def new
    redirect_if_not_logged_in
    @review = Review.new(recipe_id: params[:recipe_id])
    @recipe = @review.recipe
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    if @review.save
      redirect_to recipe_path(@review.recipe)
    else
      #flash[:message] = "All fields must be filled"
      redirect_to new_recipe_review_path(@review.recipe)
    end
  end

  def show
    @review = Review.find_by(params[:id])
  end

  def index
    if params[:user_id]
      @reviews = Review.where(user_id: params[:user_id]).order_by_date
    elsif params[:recipe_id]
      @reviews = Review.where(recipe_id: params[:recipe_id]).order_by_date
    else
      @reviews = Review.order_by_recipe
    end
  end

  private

  def review_params 
    params.require(:review).permit(:content, :rating, :recipe_id, :favorite)
  end

end
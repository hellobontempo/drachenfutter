class ReviewsController < ApplicationController
  def new
    @review = Review.new(recipe_id: params[:recipe_id])
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    if @review.save
      redirect_to recipe_path(@review.recipe)
    else
      flash[:message] = "All fields must be filled"
      redirect_to new_recipe_review_path(@review.recipe)
    end
  end

  def edit
  end

  def show
  end

  private

  def review_params 
    params.require(:review).permit(:content, :rating, :recipe_id, :favorite)
  end

end
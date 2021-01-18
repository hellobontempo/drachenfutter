class ReviewsController < ApplicationController
  def new
  end

  def create
    review = Review.create(review_params)
    byebug
    if review
      redirect_to recipe_path(review.recipe_id)
    else
      render recipe_path(params[:id])
    end
  end

  def edit
  end

  def show
  end

  private

  def review_params 
    params.require(:review).permit(:content, :rating, :user_id, :recipe_id, :favorite)
  end

end

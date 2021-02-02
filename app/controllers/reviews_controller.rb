class ReviewsController < ApplicationController
  before_action :redirect_if_not_logged_in
  skip_before_action :redirect_if_not_logged_in, only: [:index, :show]

  def new
    @review = Review.new(recipe_id: params[:recipe_id])
    @recipe = @review.recipe
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
    @review = Review.find(params[:id])
    redirect_to reviews_path unless @review.user ==  current_user
  end

  def update
    @review = Review.find(params[:id])
    @review.update(review_params) if @review.user ==  current_user
    redirect_to recipe_path(@review.recipe) 
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
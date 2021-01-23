class UsersController < ApplicationController
include UsersHelper

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    redirect_to @user if @user != current_user
  end

  def update
    @user = User.find(params[:id])
    @user.username = user_params[:username]
    @user.save
    redirect_to user_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :email, :password)
  end


    

end

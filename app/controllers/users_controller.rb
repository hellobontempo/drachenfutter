class UsersController < ApplicationController
  before_action :redirect_if_not_logged_in
  skip_before_action :redirect_if_not_logged_in, only: [:new, :create]


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
    redirect_to @user if @user != current_user
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

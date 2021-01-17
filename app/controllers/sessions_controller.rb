class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: params['user']['email'])
    if user && user.authenticate(params['user']['password'])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else 
      flash[:message] = "There was an error signing in."
      render :new
    end
  end

  def destroy
    session.delete :user_id
    flash[:message] = "See ya!"
    redirect_to :root    
  end


 
end

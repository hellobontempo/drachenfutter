class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: log_in_params["email"])
    if @user.nil?
      redirect_to '/signup'
      flash[:message] = "You don't have an account!"
    else @user.present?
      if @user.authenticate(log_in_params["password"])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        flash[:message] = "There was an error signing in."
        render :new
      end
    end
  end

  def omniauth
    user = User.from_omniauth(request.env['omniauth.auth'])
    if user.valid?
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      redirect_to '/', alert: "Hmm, something went wrong"
    end
  end

  def destroy
    session.delete :user_id
    flash[:message] = "See ya!"
    redirect_to :root    
  end

 private
  
  def log_in_params
    params.require(:user).permit(:email, :password)
  end

end

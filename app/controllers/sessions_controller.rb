class SessionsController < ApplicationController
  def new
  end
  
  def create
    @user = User.where(email: params[:email]).first
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Logged in"
    else
      redirect_to login_path, alert: "Invalid Email or Password"
    end
  end
  
  def destory
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out"
  end
end

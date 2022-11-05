class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.where(email: params[:email]).first
    if @user && @user.authenticate(params[:password])
      login(@user)
      page_to_redirect_to = session[:protected_page] || root_path
      session[:protected_page] = nil
      redirect_to page_to_redirect_to, notice: 'Logged in'
    else
      redirect_to login_path, alert: 'Invalid Email or Password'
    end
  end

  def destroy
    logout
    redirect_to root_path, notice: 'Logged out'
  end
end

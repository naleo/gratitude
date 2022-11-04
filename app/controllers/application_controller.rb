class ApplicationController < ActionController::Base
  private
  
  def authenticate
    if !current_user
      session[:protected_page] = request.url
      redirect_to login_path, alert: "User must be logged in to view page."
    end
  end

  def login(user)
    session[:user_id] = user.id
  end

  def logout
    session[:user_id] = nil
  end

  def current_user
    @current_user ||= User.find session[:user_id] if session[:user_id]
  end
  helper_method :current_user
end

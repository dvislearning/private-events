class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  include SessionsHelper
	
  helper_method :logged_in?, :current_user


  # Checks if #current_user returns false
  def logged_in?
    !current_user.nil?
  end

   # Retrieves current user from db when remember cookie matches remember_token
  def current_user
    @current_user ||= User.find_by(id: cookies[:user_id])
  end

  # Sets current user
  def current_user=(user)
    @current_user = user
  end

  def show_user_name
  	@user_name = @current_user.name
  end 

  # Redirects to login_url if not logged in
  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in"
      redirect_to login_url
    end
  end        
end

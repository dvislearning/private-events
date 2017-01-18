module SessionsHelper

  # Logs in user, assigns fresh token, updates table with fresh token, and assigns
  # remember token cookie
  def log_in(user)
    cookies.permanent[:user_id] = user.id 
    @current_user = user
  end 

  # Logs current user out of session
  def log_out
    @current_user = nil  	
    cookies.delete(:user_id)
  end 
end

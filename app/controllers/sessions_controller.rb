class SessionsController < ApplicationController

  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user
      log_in user
      flash[:success] = "Logged in User"
      redirect_to @current_user
  	else
  		flash.now[:danger] = 'Invalid Email'
  		render 'new'
  	end
  end 

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end  
end

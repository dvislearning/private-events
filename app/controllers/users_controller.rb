class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      flash[:info] = "You have been logged in"
      redirect_to about_url
  	else
  		render 'new'
  	end
  end

  def show
    @user = User.find(params[:id])
    @created_events = @user.created_events
  end

  private

  def user_params
  	params.require(:user).permit(:name, :email)
  end  
end

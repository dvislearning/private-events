class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show]

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
    @upcoming_events = current_user.upcoming_events
    @prev_events = current_user.previous_events
  end

  private

  def user_params
  	params.require(:user).permit(:name, :email)
  end  
end

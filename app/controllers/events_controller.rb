 class EventsController < ApplicationController
	before_action :logged_in_user

	def new
	end

	def show
		@event = Event.find(params[:id])
		@attendees = @event.attendees.all
	end	

	def create
		@event = @current_user.created_events.build(user_params)
		@event.date = Time.now
		if @event.save
			flash[:success] = "Event created successfully"
			redirect_to @current_user
		else
			flash.now[:danger] = 'Event failed to save'
			render :new
		end
	end

	def index
		@events = Event.all
	end

	private

	def user_params
		params.require(:event).permit(:name,:description)
	end

    # Redirects to login_url if not logged in
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in"
        redirect_to login_url
      end
    end	
end

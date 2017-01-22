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
		params.require(:event).permit(:name, :description. :date, :location)
	end	
end

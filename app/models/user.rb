class User < ApplicationRecord
	has_many :created_events, :foreign_key => :creator_id, :class_name => "Event"
	has_many :event_users, :foreign_key => :attendee_id
	has_many :attended_events, :through => :event_users	

	def upcoming_events
		self.attended_events.select do | event |
			event.date > Time.now
		end
	end

	def previous_events
		self.attended_events.select do | event |
			event.date < Time.now
		end
	end
end

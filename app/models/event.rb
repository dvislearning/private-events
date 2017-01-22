class Event < ApplicationRecord
	belongs_to :creator, :class_name => "User"
	has_many :event_users, :foreign_key => :attended_event_id
	has_many :attendees, :through => :event_users

	def self.past
		self.where('date < ?', Time.now)
	end

	def self.upcoming
		self.where('date >= ?', Time.now)
	end	
end

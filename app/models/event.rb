class Event < ActiveRecord::Base
	attr_accessible :name, :event_start_time, :event_end_time, :cost, :location, :description, :registration_deadline, :food
	validates_presence_of :name

	has_many :people
	has_many :teams
end

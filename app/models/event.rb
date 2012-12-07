class Event < ActiveRecord::Base
	attr_accessible :name, :event_start_time, :event_end_time, :cost, :location, :description, :registration_deadline, :food
	validates_presence_of :name#, :event_type, :location
	validates_uniqueness_of :name

	belongs_to :user
	has_many :myevents
	has_many :hosts
	has_many :speakers
	has_many :artists
	has_many :sponsors
end

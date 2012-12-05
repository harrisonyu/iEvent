class Event < ActiveRecord::Base
	attr_accessible :name, :event_start_time, :event_end_time, :cost, :location, :description, :registration_deadline, :food
	validates_presence_of :name, :event_type, :location

	belongs_to :user
	has_many :myevent
	has_many :hostedBy
	has_many :speaker
	has_many :artist
	has_many :sponsoredBy
end

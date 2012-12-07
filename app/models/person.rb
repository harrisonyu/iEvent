class Person < ActiveRecord::Base
	validates_presence_of :name
	validates_uniqueness_of :name
	
	has_many :hosts
	has_many :speakers
	has_many :artists
	has_many :sponsors

end

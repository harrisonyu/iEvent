class Person < ActiveRecord::Base
	validates_presence_of :name
	validates_uniqueness_of :name
	
	has_many :hostedBy
	has_many :speaker
	has_many :artist
	has_many :sponsoredBy

end

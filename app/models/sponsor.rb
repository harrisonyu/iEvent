class Sponsor < ActiveRecord::Base
	belongs_to :person
	belongs_to :events
end

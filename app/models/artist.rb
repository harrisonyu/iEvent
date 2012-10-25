class Artist < ActiveRecord::Base
	belongs_to :person
	belongs_to :events
end

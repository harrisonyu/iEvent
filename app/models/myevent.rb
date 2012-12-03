class Myevent < ActiveRecord::Base
	belongs_to :user
	belongs_to :events
end

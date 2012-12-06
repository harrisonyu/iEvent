class AddRegistrationdeadlineFromEvent < ActiveRecord::Migration
  def change
  	change_table :events do |t|
  		t.datetime :registration_deadline
  	end
  end
end

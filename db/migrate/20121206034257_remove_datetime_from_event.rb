class RemoveDatetimeFromEvent < ActiveRecord::Migration
  def up
  	remove_column :events, :event_start_time
  	add_column :events, :event_start_time, :date
  	remove_column :events, :event_end_time
  	add_column :events, :event_end_time, :date
  	remove_column :events, :registration_deadline
  	add_column :events, :registration_deadline, :date
  end

  def down
  end
end

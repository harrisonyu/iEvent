class RemoveEventTypeFromEvents < ActiveRecord::Migration
  def up
  	remove_column :events, :type
  	add_column :events, :event_type, :string
  end

  def down
  	add_column :events, :type
  	remove_column :events, :event_type, :string
  end
end

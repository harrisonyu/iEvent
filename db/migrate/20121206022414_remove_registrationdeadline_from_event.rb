class RemoveRegistrationdeadlineFromEvent < ActiveRecord::Migration
  def up
  	remove_column :events, :registration_deadline
  end

  def down
  end
end

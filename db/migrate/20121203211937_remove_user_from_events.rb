class RemoveUserFromEvents < ActiveRecord::Migration
  def up
  	remove_column :events, :user_id
  end

  def down
  end
end

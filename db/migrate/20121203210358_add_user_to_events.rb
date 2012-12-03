class AddUserToEvents < ActiveRecord::Migration
  def change
    change_table :events do |t|
      t.integer :user_id
    end
  end
end

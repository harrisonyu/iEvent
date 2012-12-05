class AddUsercreatedbyToEvents < ActiveRecord::Migration
  def change
    change_table :events do |t|
      t.integer :createdby_user_id
    end
  end
end

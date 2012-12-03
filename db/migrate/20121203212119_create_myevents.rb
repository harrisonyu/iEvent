class CreateMyevents < ActiveRecord::Migration
  def up
  	create_table :myevents do |t|
      t.integer :event_id
      t.integer :user_id

      t.timestamps
    end
  end

  def down
  end
end

class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :event_id
      t.string :name
      t.datetime :event_start_time
      t.datetime :event_end_time
      t.float :cost
      t.string :location
      t.text :description
      t.datetime :registration_deadline
      t.boolean :food

      t.timestamps
    end
  end
end

class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.integer :people_id
      t.string :email
      t.integer :phone
      t.string :address
      t.integer :event_id

      t.timestamps
    end
  end
end

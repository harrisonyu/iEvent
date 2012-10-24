class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.integer :team_id
      t.string :team_name
      t.string :home
      t.string :sport
      t.integer :event_id
      
      t.timestamps
    end
  end
end

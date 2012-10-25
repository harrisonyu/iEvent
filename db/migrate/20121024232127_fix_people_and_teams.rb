class FixPeopleAndTeams < ActiveRecord::Migration
  def up
  	remove_column :people, :people_id
  	remove_column :people, :event_id
  	remove_column :teams, :team_id
  	remove_column :teams, :event_id
  	add_column :people, :name, :string
  end

  def down
  	add_column :people, :people_id, :integer
  	add_column :people, :event_id, :intger
  	add_column :teams, :team_id, :integer
  	add_column :teams, :event_id, :integer
  	remove_column :people, :name
  end
end

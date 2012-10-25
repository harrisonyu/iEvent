class DropTeams < ActiveRecord::Migration
  def up
  	drop_table :teamPlaying
  	drop_table :teams
  end

  def down
  end
end

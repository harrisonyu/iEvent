class ChangeFoodToTypeString < ActiveRecord::Migration
  def up
  	remove_column :events, :food
  	add_column :events, :food, :string
  end

  def down
  	remove_column :events, :food, :string
  	add_column :events, :food

  end
end

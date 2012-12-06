class RemoveCostFromEvent < ActiveRecord::Migration
  def up
  	remove_column :events, :cost
  	add_column :events, :cost, :string
  end

  def down
  end
end

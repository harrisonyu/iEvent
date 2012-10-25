class FixHosts < ActiveRecord::Migration
  def up
  	drop_table :hostedBys
  	create_table :hosts do |t|
  		t.integer :event_id
  		t.string :hostName

  		t.timestamps
  	end
  end

  def down
  end
end

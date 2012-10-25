class FixHostedBy < ActiveRecord::Migration
  def up
  	drop_table :hostedBy
  	create_table :hostedBys do |t|
  		t.integer :event_id
  		t.string :hostName

  		t.timestamps
  	end
  end

  def down
  end
end

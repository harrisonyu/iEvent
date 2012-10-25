class FixRelationships < ActiveRecord::Migration
  def up
  	drop_table :sponsoredBy
  	create_table :sponsors do |t|
  		t.integer :event_id
  		t.string :sponsorName

  		t.timestamps
  	end
  	drop_table :artist
  	create_table :artists do |t|
  		t.integer :event_id
  		t.string :artistName

  		t.timestamps
  	end
  	drop_table :speaker
  	create_table :speakers do |t|
  		t.integer :event_id
  		t.string :speakerName

  		t.timestamps
  	end
  end

  def down
  end
end

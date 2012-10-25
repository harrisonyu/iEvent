class CreateHostedBy < ActiveRecord::Migration
  def change
  	create_table :hostedBy do |t|
  		t.integer :event_id
  		t.string :hostName

  		t.timestamps
  	end
  	create_table :sponsoredBy do |t|
  		t.integer :event_id
  		t.string :sponsorName

  		t.timestamps
  	end
  	create_table :artist do |t|
  		t.integer :event_id
  		t.string :artistName

  		t.timestamps
  	end
  	create_table :speaker do |t|
  		t.integer :event_id
  		t.string :speakerName

  		t.timestamps
  	end
  	create_table :teamPlaying do |t|
  		t.integer :event_id
  		t.string :teamName

  		t.timestamps
  	end
  end
end
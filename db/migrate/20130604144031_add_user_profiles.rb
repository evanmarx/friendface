class AddUserProfiles < ActiveRecord::Migration
  def change
  	create_table :profiles do |t|
  		t.integer :user_id
  		t.string :sex
  		t.date :birthday
  		t.string :location

  		t.timestamps
  	end

  	add_index :profiles, :user_id
  end
end

class FixFriendshipsTable < ActiveRecord::Migration
  def change
  	drop_table :friendships 

  	create_table :friendships do |t|
  		t.integer :friend_id
  		t.string  :friend_type
  		t.boolean :still_friends, :boolean, default: true
  	end

  	add_index :friendships, :friend_id
  end
end

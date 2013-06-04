class FixFriendshipsAgain < ActiveRecord::Migration
  def change
  	drop_table :friendships 

  	create_table :friendships do |t|
  		t.integer :user_id
  		t.integer :friend_id
  		t.boolean :still_friends, default: true
  	end

  	add_index :friendships, :user_id
  	add_index :friendships, :friend_id
  end
end

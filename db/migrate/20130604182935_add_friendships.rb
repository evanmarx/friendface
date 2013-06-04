class AddFriendships < ActiveRecord::Migration
  def change
  	create_table :friendships do |t|
  		t.integer :friend_id_1
  		t.integer :friend_id_2
  		t.boolean :still_friends
  	end

  	add_index :friendships, :friend_id_1
  	add_index :friendships, :friend_id_2
  end
end

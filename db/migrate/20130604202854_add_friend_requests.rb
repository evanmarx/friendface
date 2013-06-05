class AddFriendRequests < ActiveRecord::Migration
  def change
  	create_table :friend_requests do |t|
  		t.integer :user_id
  		t.integer :requestee_id
  		t.boolean :accepted, default: false
  		t.boolean :rejected, default: false
  	end

  	add_index :friend_requests, :user_id
  	add_index :friend_requests, :requestee_id
  end
end

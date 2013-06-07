class AddTimestampsToFriendshipsAndRequests < ActiveRecord::Migration
  def change
  	add_column :friendships, :created_at, :datetime
  	add_column :friendships, :updated_at, :datetime
  	add_column :friend_requests, :created_at, :datetime
  	add_column :friend_requests, :updated_at, :datetime
  end
end

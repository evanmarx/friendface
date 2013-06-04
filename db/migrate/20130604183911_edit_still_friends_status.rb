class EditStillFriendsStatus < ActiveRecord::Migration
  def change
  	remove_column :friendships, :still_friends
  	add_column :friendships, :still_friends, :boolean, default: true
  end
end

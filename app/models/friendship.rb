class Friendship < ActiveRecord::Base
	attr_accessible :user_id, :friend_id, :still_friends

	validates :still_friends, inclusion: {in: [true, false]}
	validates :friend_id, uniqueness: {scope: :user_id}

	belongs_to :user
	belongs_to :friend, class_name: "User", foreign_key: :friend_id
end
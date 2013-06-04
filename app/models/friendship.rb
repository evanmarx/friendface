class Friendship < ActiveRecord::Base
	attr_accessible :user_id, :friend_id, :still_friends

	validates :still_friends, inclusion: {in: [true, false]}

	belongs_to :user
	belongs_to :friend, class_name: "User", foreign_key: "friend_id"
end
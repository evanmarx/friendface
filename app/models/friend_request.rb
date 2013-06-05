class FriendRequest < ActiveRecord::Base
	attr_accessible :user_id, :requestee_id, :accepted, :rejected

	belongs_to :user
	belongs_to :requestee, class_name: "User", foreign_key: :requestee_id

end
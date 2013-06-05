class FriendRequestsController < ApplicationController
	before_filter :authenticate_user!

	def create 
		@friend_request = FriendRequest.new(user_id: current_user.id)
	end 
end
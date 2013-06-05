class FriendRequestsController < ApplicationController
	before_filter :authenticate_user!

	def create 
		p params
		@friend_request = FriendRequest.new(user_id: current_user.id, requestee_id: params[:id]) 

		if @friend_request.save
			render partial: "friend_requests/request"
		else 
			puts "NOT SUCCESSFUL!"
		end
	end 
end
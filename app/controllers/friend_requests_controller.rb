class FriendRequestsController < ApplicationController
	before_filter :authenticate_user!

	def create 
		@friend_request = FriendRequest.new(params[:friend_request])

		if @friend_request.save
			render partial: "friend_requests/request"
		else 
			puts "NOT SUCCESSFUL!"
		end
	end 
end
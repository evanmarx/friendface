class FriendRequestsController < ApplicationController
	before_filter :authenticate_user!

	def create 
		@friend_request = FriendRequest.new(user_id: current_user.id, requestee_id: params[:id]) 

		if @friend_request.save
			render partial: "friend_requests/request"
		else 
			puts "NOT SUCCESSFUL!"
		end
	end 


	def update
		@friend_request = FriendRequest.find(params[:request_id])
		@friend_request.rejected = params[:rejected] if params[:rejected]

		@friend_request.save!

		# this doesn't actually render anywhere right now!!!!
		render partial: "friend_requests/rejected" if params[:rejected]
	end
end
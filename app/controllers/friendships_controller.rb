class FriendshipsController < ApplicationController 
	before_filter :authenticate_user!

	def index
		@friends = current_user.friends
	end

	def create 
		@friendship = Friendship.new(user_id: current_user.id, friend_id: params[:friend_id])

		if @friendship.save
			fr = FriendRequest.find(params[:request_id])
			fr.accepted = true
			fr.save!
			@friend = User.find(@friendship.friend_id)
			render partial: "friendships/new_friend", locals: {friend: @friend}
		else 
			puts "NOT SUCCESSFUL!"
		end

	end
end 
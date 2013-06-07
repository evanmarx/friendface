class FriendshipsController < ApplicationController 
	before_filter :authenticate_user!

	def index
		@friends = current_user.friends
	end

	def create 
		@friendship = Friendship.new(user_id: current_user.id, friend_id: params[:friend_id])
		@reciporical_friendship = Friendship.new(user_id: params[:friend_id], friend_id: current_user.id)

		if @friendship.save && @reciporical_friendship.save
			fr = FriendRequest.find(params[:request_id])
			fr.accepted = true
			fr.save!
			@friend = User.find(@friendship.friend_id)
			render partial: "friendships/new_friend", locals: {friend: @friend}
		else 
			puts "NOT SUCCESSFUL!"
		end
	end

	def destroy
		@friendship = Friendship.where(user_id: current_user.id, friend_id: params[:friend_id])[0]
		@reciporical_friendship = Friendship.where(user_id: params[:friend_id], friend_id: current_user.id)[0]

		@friendship.destroy
		@reciporical_friendship.destroy
		# this doesn't actually render anywhere right now!!!!
		render partial: "friend_requests/rejected"
	end



end 
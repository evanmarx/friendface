class UsersController < ApplicationController
	before_filter :authenticate_user!
	skip_before_filter :authenticate_user!, only: [:new, :create]

	def new
		@user = User.new
	end

	def create
		@user = User.new(params[:user])

		if @user.save 
			@profile = Profile.create!(user_id: @user.id)

			#need to figure how to sign-in user upon creation/edit
			redirect_to user_path(@user)
		else
			render :new
		end
	end

	def show
		@user = current_user
	end

	def edit
		@user = current_user
	end

	def update
		@user = current_user

		if @user.update_with_password(params[:user])

			#need to figure how to sign-in user upon creation/edit
			redirect_to user_path(@user)
		else
			render :edit
		end
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to :root
	end

end
class ProfilesController < ApplicationController 
	before_filter :authenticate_user!

	def edit
		@profile = current_user.profile
	end

	def update
		@profile = current_user.profile

		if @profile.update_attributes(params[:profile])
			#need to figure how to sign-in user upon creation/edit
			redirect_to user_path(current_user)
		else
			render :edit
		end
	end

	def destroy
		@profile = current_user.profile
		@profile.destroy
		redirect_to :root
	end

end





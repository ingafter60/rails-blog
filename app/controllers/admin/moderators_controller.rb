class Admin::ModeratorsController < ApplicationController
	def index
		@moderators = Moderator.all
	end

	def edit
		@moderator = Moderator.find(params[:id])
	end

	def update
		@moderator = Moderator.find(params[:id])
		#success
		if @moderator.update(moderator_params)
			#success flash
			flash[:notice] = "Moderator was successfully updated"
			redirect_to admin_moderators_url
		#failed	
		else
			#failure flash
			flash[:alert] = "There was a problem updating moderator"
			render 'edit'
		end
	end

	# Define strong parameter
	private

	def moderator_params
		params.require(:moderator).permit(:id, :fullname, :username, :password)
	end
end
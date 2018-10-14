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
			redirect_to :back
		#failed	
		else
			render 'edit'
		end
	end

	# Define strong parameter
	private

	def moderator_params
		params.require(:moderator).permit(:id, :fullname, :username, :password)
	end
end
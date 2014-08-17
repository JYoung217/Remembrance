include ApplicationHelper

class MemorialsController < ApplicationController
	def index
		@photo = Photo.new
		@photo_last = Photo.last
	end

	def show
		current_user
		@memorial = Memorial.find(params[:id])
	end


	def created
		@current_user = current_user
		@moderator = User.find(@current_user.id)
		@created_memorials = @moderator.created_memorials
	end

	def attended
		@attended_memorials = @current_user.attended_memorials
	end

end

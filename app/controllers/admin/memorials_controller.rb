class Admin::MemorialsController < ApplicationController
include ApplicationHelper
	def new
		@memorial = Memorial.new
	end

	def create
		current_user
		@moderator = @current_user
		@memorial = @moderator.created_memorials.new(memorial_params)
		if @memorial.save
			redirect_to @memorial
		else
			render 'newmemorial'
		end
	end

	def show

	end

	def edit
		@memorial = Memorial.find params[:id]
	end

	def update
		@memorial = Memorial.find params[:id]
		if @memorial.update_attributes(memorial_params)
			redirect_to @memorial
		else
			redirect_to edit_admin_memorial_path
		end
	end

	def destroy
		@memorial = Memorial.find params[:id]
		@memorial.destroy
		redirect_to memorials_path
	end


	private
		def memorial_params
			params.require(:memorial).permit(:deceased_name, :date_of_birth, :date_of_death, :obituary_description, :service_description)
		end
	# def show
	# 	@memorial = Memorial.find(params[:id])
	# end


end

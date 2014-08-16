class SessionsController < ApplicationController
	include ApplicationHelper
	
	def index
		current_user
		if @current_user
			redirect_to memorials_path
		end
	end

	def new
	end

	def create
    data = params[:user]
    user = User.find_by(email_address: data[:email_address]).try(:authenticate, data[:password])
    if user
      session[:user_id] = user.id
      redirect_to memorials_path
    else
      @errors = "Invalid email/password. Please try again!"
      @user = User.new
      render :new
    end
	end

	def destroy
		session.clear
		redirect_to root_path
	end

	def backdoor
		session[:user_id] = params[:user_id]
		redirect_to memorials_path
	end
end
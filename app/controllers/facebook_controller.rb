class FacebookController < ApplicationController
	include UsersHelper
	def create
		user = User.from_omniauth(request.env["omniauth.auth"])
    session[:user_id] = user.id
    check_attended_memorials(user)
    redirect_to memorials_path
	end
end

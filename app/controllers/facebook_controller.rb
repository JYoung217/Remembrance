class FacebookController < ApplicationController
	def create
		user = User.from_omniauth(request.env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to memorials_path
	end
end

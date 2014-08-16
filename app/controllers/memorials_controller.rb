include ApplicationHelper

class MemorialsController < ApplicationController
	def index

	end


	def contacts_callback
		@contacts = request.env['omnicontacts.contacts']
		@user = request.env['omnicontacts.user']
		puts "List of contacts of #{user[:name]} obtained from #{params['gmail']}:"
		@contacts.each do |contact|
			puts "Contact found: name => #{contact[:name]}, email => #{contact[:email]}"
		end
	end


	def show
		@memorial = Memorial.find(params[:id])
	end


	def created
		@moderator = User.find_by(id: current_user)
		@created_memorials = @moderator.created_memorials
	end

	def attended
		@attended_memorials = @current_user.attended_memorials
	end

end

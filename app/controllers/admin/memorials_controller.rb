class Admin::MemorialsController < ApplicationController

	def new
		@memorial = Memorial.new
	end

	def create
		@moderator = User.find_by(id: current_user)
		@memorial = @moderator.created_memorials.new(memorial_params)
		if @memorial.save
			redirect_to @memorial
		else
			render 'newmemorial'
		end
	end

	def show
		redirect_to '/contacts/gmail'
	end

	def contacts_callback
	  @contacts = request.env['omnicontacts.contacts']
	  @user = request.env['omnicontacts.user']
	  puts "List of contacts of #{user[:name]} obtained from #{params['gmail']}:"
	  @contacts.each do |contact|
	    puts "Contact found: name => #{contact[:name]}, email => #{contact[:email]}"
	  end
	end


	def edit
		@memorial = Memorial.find params[:id]
	end

	def update

	end

	def destroy

	end


	private
		def memorial_params
			params.require(:memorial).permit(:deceased_name, :date_of_birth, :date_of_death, :obituary_description, :service_description)
		end


end

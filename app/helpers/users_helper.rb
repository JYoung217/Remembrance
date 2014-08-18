module UsersHelper
	def check_attended_memorials(user)
		Invite.all.each do |invite|
			if invite.email == user.email_address
				@memorial = Memorial.find(invite.memorial_id)
				@memorial.guests << user
			end
		end
	end
end

require 'rails_helper'

RSpec.describe ApplicationHelper, :type => :helper do
	describe '#current_user' do
  	it 'should return the current user if the current user holds a session' do
  		@user = User.create(name: "Joe Blo", email_address: "me@example.com", password: "12345", password_confirmation: "12345")
  		session[:user_id] = @user.id
  		expect(current_user).to eq(@current_user)
  	end
  end
end



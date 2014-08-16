require 'rails_helper'

RSpec.describe FacebookController, :type => :controller do
	describe '#create' do
		before do
		  request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:facebook]
		end

		it 'should create a new user via Facebook' do
			expect(request.env['omniauth.auth']).to be_kind_of(Hash)
			request.env['omniauth.auth']['credentials']['expires_at'] = Time.now + 1.week
	    post :create
			expect(User.last.email_address).to eq("jeremy_rhvuhfx_wongwong@tfbnw.net")
		end
	end
end

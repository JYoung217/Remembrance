require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do
	describe '#index' do
		it 'should render the homepage' do
			get :index
			expect(response).to be_success
			expect(response.code).to eq("200")
		end

		it 'should redirect to memorials path if a user session exists' do
			@user = User.create(name: "Frank", email_address: "frank@example.com", password: "123456", password_confirmation: "123456")
			session[:user_id] = @user.id
			get :index
			expect(response).to be_redirect
			expect(response.code).to eq("302")
		end
	end

	describe '#create' do
		it 'should allow a user to log in' do
			@user = User.create(name: "Frank", email_address: "frank@example.com", password: "123456", password_confirmation: "123456")
			post :create, user: {email_address: @user.email_address, password: @user.password}
			expect(response).to be_redirect
			expect(response.code).to eq("302")
			expect(session[:user_id]).to eq(@user.id)
		end

		it 'should not allow a user to log in with false credentials' do
			post :create, user: {email_address: "notauser@email.com", password: "12345"}
			expect(response).to be_success
			expect(response.code).to eq("200")
			expect(session[:user_id]).to be_nil
		end

	end	

	describe '#destroy' do
		it 'should log out a user' do
			user = User.create(name: "Frank", email_address: "frank@example.com", password: "123456", password_confirmation: "123456")
			session[:user_id] = user.id
			expect(session[:user_id]).to_not be_nil
	    delete :destroy
			expect(session[:user_id]).to be_nil
		end
	end

end

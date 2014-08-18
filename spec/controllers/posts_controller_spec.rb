require 'rails_helper'

RSpec.describe PostsController, :type => :controller do
	before do
		@user = User.create(name: "Frank", email_address: "frank@example.com", password: "123456", password_confirmation: "123456")
		@memorial = Memorial.create(moderator: @user, deceased_name: "Nanners")
	end

	describe 'GET #new' do
		it 'should render a new form for posts' do
			get :new, :memorial_id => @memorial.id
			expect(response).to be_success
			expect(response.code).to eq("200")
		end
	end

	describe 'POST #create' do
		it 'should save a new post' do
			post :create, :memorial_id => @memorial.id, :post => { author: @user, memorial: @memorial, approved: true, text: "What a loss" }
			expect(response.code).to eq("302")
  		expect(Post.last.text).to eq("What a loss")
		end
	end

	describe 'GET #edit' do
		it 'should render a form to edit the post' do
			@post = Post.create(author: @user, memorial: @memorial, approved: true, text: "Sorry about loss")
			get :edit, :memorial_id => @memorial.id, :id => @post.id
			expect(response).to be_success
			expect(response.code).to eq("200")
		end
	end

	describe 'PUT #update' do
		it 'should edit the post' do
			@post = Post.create(author: @user, memorial: @memorial, approved: true, text: "Sorry about loss")
			post :update, :memorial_id => @memorial.id, id: @post.id, :post => { text: "Sorry" }
			expect(response.code).to eq("302")
			expect(Post.last.text).to eq("Sorry")
		end
	end

	describe 'DELETE #destroy' do
		it "destroys the requested post" do
			@post = Post.create(author: @user, memorial: @memorial, approved: true, text: "Sorry about loss")
			expect {
        delete :destroy, {memorial_id: @memorial.id, :id => @post.id}
      }.to change(Post, :count).by(-1)
    end

    it "redirects to the memorial page" do
			@post = Post.create(author: @user, memorial: @memorial, approved: true, text: "Sorry about loss")
      delete :destroy, {memorial_id: @memorial.id, :id => @post.id}
      expect(response.code).to eq("302")
    end
	end

end
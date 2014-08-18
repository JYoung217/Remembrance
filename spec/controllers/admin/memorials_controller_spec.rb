require 'rails_helper'

RSpec.describe Admin::MemorialsController, :type => :controller do
  before do
    @user = User.create(name: "Jon", email_address: "jon@example.com", password: "123456", password_confirmation: "123456")
    @memorial = Memorial.create(moderator: @user, deceased_name: "Father")
  end

  describe 'GET #new' do
    it 'should render the page' do
      get :new
      expect(response).to be_success
      expect(response.code).to eq("200")
    end
  end

  describe 'GET #edit' do
    it 'should render the page' do
      session[:user_id] = @user.id
      get :edit, id: @memorial.id 
      expect(response).to be_success
      expect(response.code).to eq("200")
    end
  end

  describe 'POST #create' do
    it 'should save a new memorial' do
    	session[:user_id] = @user.id
    	post :create, :memorial_id => @memorial.id, :memorial => { moderator: @user, deceased_name: "Father"}
			expect(response.code).to eq("302")
      expect(Memorial.last.deceased_name).to eq("Father")
    end
  end



  describe 'PUT #update' do
    it 'should edit the memorial' do
      session[:user_id] = @user.id
      post :update, :memorial_id => @memorial.id, id: @memorial.id, :memorial => { deceased_name: "Mother" }
      expect(response.code).to eq("302")
      expect(Memorial.last.deceased_name).to eq("Mother")
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the memorial' do
      session[:user_id] = @user.id
      post :create, :memorial_id => @memorial.id, :memorial => { moderator: @user, deceased_name: "Father"}
      expect {
      	delete :destroy, {memorial_id: @memorial.id, id: @memorial.id}
      	}.to change(Memorial, :count).by(-1)
    end
  end


end
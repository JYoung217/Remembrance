require 'rails_helper'

RSpec.describe MemorialsController, :type => :controller do
  before do
    @user = User.create(name: "Jon", email_address: "jon@example.com", password: "123456", password_confirmation: "123456")
    @memorial = Memorial.create(moderator: @user, deceased_name: "Father")
  end

  describe 'GET #index' do
    it 'should render the page' do
      get :index
      expect(response).to be_success
      expect(response.code).to eq("200")
    end
  end

  describe 'GET #show' do
    it 'should render the page' do
      get :show, id: @memorial.id
      expect(response).to be_success
      expect(response.code).to eq("200")
    end
  end

  describe 'GET #created' do
    it 'should render the page' do
      session[:user_id] = @user.id
      get :created 
      expect(response).to be_success
      expect(response.code).to eq("200")
    end
  end

  describe 'GET #attended' do
    it 'should render the page' do
      session[:user_id] = @user.id
      get :attended
      expect(response).to be_success
      expect(response.code).to eq("200")
    end
  end
end
require 'rails_helper'

RSpec.describe Admin::GuestsController, :type => :controller do
  before do
    @user = User.create(name: "Jon", email_address: "jon@example.com", password: "123456", password_confirmation: "123456")
    @memorial = Memorial.create(moderator: @user, deceased_name: "Father")
  end

  describe 'GET #new' do
    it 'should render the form page' do
      get :new, :memorial_id => @memorial.id
      expect(response).to be_success
      expect(response.code).to eq("200")
    end
  end

  describe 'GET #invite_new_with_email' do
    it 'should render the email form page' do
      get :invite_new_with_email, :memorial_id => @memorial.id
      expect(response).to be_success
      expect(response.code).to eq("200")
    end
  end

  describe 'POST #create' do
    it 'should add an attendee' do
      @attendee = User.create!(name: "Fran", email_address: "franz@example.com", password: "123456", password_confirmation: "123456")
      id = @attendee.id
      post :create, :memorial_id => @memorial.id, :memorial_guest => { :guest => ["#{id}", ""] }
      expect(@memorial.guests.last).to eq(@attendee)
    end
  end

  describe 'POST #invite_create_with_email' do
    it 'should email a person who is not an attendee' do
      ActionMailer::Base.delivery_method = :test
      ActionMailer::Base.perform_deliveries = true
      ActionMailer::Base.deliveries = []
      @attendee = User.create!(name: "Fran", email_address: "franz@example.com", password: "123456", password_confirmation: "123456")
      post :invite_create_with_email, :memorial_id => @memorial.id, :email => { :email => "one@example.com, two@example.com, franz@example.com" }
      expect(response.code).to eq("302")
      expect(ActionMailer::Base.deliveries.count).to eq(3)
      ActionMailer::Base.deliveries.clear
    end
  end
end
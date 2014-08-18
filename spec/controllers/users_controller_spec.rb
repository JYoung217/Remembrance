require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

	describe "GET #new" do
    it "should render the template and return http success" do
      get :new
      expect(response).to render_template("new")
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end

  describe 'POST #create' do

  	it 'should create a new user' do
  		post :create, :user => {name: "Frank", email_address: "frank@example.com", password: "123456", password_confirmation: "123456"}
  		expect(response).to redirect_to(memorials_path)
  		expect(User.last.name).to eq("Frank")
  	end

  	it "does not save the user to the db if the form is invalid" do
      post :create, user: { name: "Frank", email_address: "", password: "123456", password_confirmation: "123456"}
    	expect(response).to render_template :new
    	expect(session[:user_id]).to be_nil
    end

    it 'adds you to an attended list if you have been invited' do
      user_creator = User.create(name: "Jon", email_address: "jon@example.com", password: "123456", password_confirmation: "123456")
      @memorial = Memorial.create(moderator: user_creator, deceased_name: "Father")
      @invite = Invite.create(email: "frankie@example.com", memorial: @memorial)
      post :create, user: { name: "Frank", email_address: "frankie@example.com", password: "123456", password_confirmation: "123456"}
      expect(User.last.attended_memorials.first).to eq(@memorial)
    end

  end

end
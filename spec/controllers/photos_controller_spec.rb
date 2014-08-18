require 'rails_helper'

RSpec.describe PhotosController, :type => :controller do

  before do
    @user = User.create(name: "Frank", email_address: "frank@example.com", password: "123456", password_confirmation: "123456")
    @memorial = Memorial.create(moderator: @user, deceased_name: "Nanners")
  end

  describe 'GET #new' do
    it 'should render a new form for photos' do
      get :new, :memorial_id => @memorial.id
      expect(response).to be_success
      expect(response.code).to eq("200")
    end
  end

  describe 'POST #create' do
    it 'should save and create a new photo' do
      session[:user_id] = @user.id
      post :create, :memorial_id => @memorial.id, :photo => { memorial: @memorial, approved: true, caption: "sample" }
      expect(response.code).to eq("302")
      expect(Photo.last.caption).to eq("sample")
    end
  end


  describe 'DELETE #destroy' do
    it "destroys the requested photo" do
      @photo = Photo.create(uploader: @user, memorial: @memorial, approved: true, caption: "sample")
      expect {
        delete :destroy, {memorial_id: @memorial.id, :id => @photo.id}
      }.to change(Photo, :count).by(-1)
    end

    it "redirects to the memorial page" do
      @photo = Photo.create(uploader: @user, memorial: @memorial, approved: true, caption: "sample")
      delete :destroy, {memorial_id: @memorial.id, :id => @photo.id}
      expect(response.code).to eq("302")
    end
  end
end

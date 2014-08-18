require 'rails_helper'

RSpec.describe CommentsController, :type => :controller do
  before do
    @user = User.create(name: "Frank", email_address: "frank@example.com", password: "123456", password_confirmation: "123456")
    @memorial = Memorial.create(moderator: @user, deceased_name: "Nanners")
    @post = Post.create(author: @user, memorial: @memorial, approved: true, text: "Sorry about loss")
    @photo = Photo.create(approved: true, url: "http://blog.jimdo.com/wp-content/uploads/2014/01/tree-247122.jpg", caption: "This is a test picture", profile: false)
  end

  describe 'GET #new' do
    it 'should render a new form for comments' do
      get :new, :memorial_id => @memorial.id, :post_id => @post.id
      expect(response).to be_success
      expect(response.code).to eq("200")
    end
  end

  describe 'POST #create' do
    it 'should save a new comment from a post' do
      post :create, :memorial_id => @memorial.id, :post_id => @post.id, :comment => { commenter_id: @user.id, post: @post, text: "Sample comment" }
      expect(response.code).to eq("302")
      expect(Comment.last.text).to eq("Sample comment")
    end

    it 'should save a new comment from a photo' do
      post :create, :memorial_id => @memorial.id, :photo_id => @photo.id, :comment => { commenter_id: @user.id, post: @post, text: "Sample comment" }
      expect(response.code).to eq("302")
      expect(Comment.last.text).to eq("Sample comment")
    end
  end

  describe 'Modifying comment' do
    before(:each) do
      @user = User.create(name: "Frank", email_address: "frank@example.com", password: "123456", password_confirmation: "123456")
      @memorial = Memorial.create(moderator: @user, deceased_name: "Peters")
      @post = Post.create(author: @user, memorial: @memorial, approved: true, text: "Sorry about loss")
      @comment = Comment.create(commenter: @user, commentable_id: @post.id, commentable_type: 'Post', text: "Sample comment")
    end

    context 'GET #edit' do
      it 'should render a form to edit the comment' do
        get :edit, :memorial_id => @memorial.id, :post_id => @post.id, :id => @comment.id
        expect(response).to be_success
        expect(response.code).to eq("200")
      end
    end

    context 'PUT #update' do
      it 'should edit the comment' do
        post :update, :memorial_id => @memorial.id, :post_id => @post.id, :id => @comment.id, :comment => { text: "Sorry" }
        expect(response.code).to eq("302")
        expect(Comment.last.text).to eq("Sorry")
      end
    end

    context 'DELETE #destroy' do
      it "destroys the requested comment" do
        expect {
          delete :destroy, {memorial_id: @memorial.id, :post_id => @post.id, :id => @comment.id}
        }.to change(Comment, :count).by(-1)
      end

      it "redirects to the memorial page" do
        delete :destroy, {memorial_id: @memorial.id, :post_id => @post.id, :id => @comment.id}
        expect(response.code).to eq("302")
      end
    end
  end

end
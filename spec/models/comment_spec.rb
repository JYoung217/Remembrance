require 'rails_helper' 

RSpec.describe Comment, :type => :model do
  before do
  	@comment = Comment.create(commenter_id: 1,commentable_id: 1, commentable_type: "photo", text: "comment")
  	@user = User.create(name: "Jonathan", email_address: "jonyoungg@gmail.com", password: "123456", password_confirmation: "123456")
  	@post = Post.create(approved: true, text: "text")
  	@photo = Photo.create(approved: true, url: "www.google.com", caption: "caption", profile: false)
  end

  it 'a users comments should all be comments' do
  	@user.comments << Comment.new(commentable_id: 1, commentable_type: "photo", text: "comment")
  	expect(@user.comments.first).to be_a(Comment)
  end

  it 'should belong to a user' do
  	@user.comments << @comment
  	expect(@comment.commenter).to be_a(User)
  end

  it 'post should be able to add a comment as a commentable' do
      @comment.commentable = @post
      @comment.save
      expect(@comment.commentable).to be_a(Post)
    end

  it 'photo should be able to add a coment as a commentable' do
    @comment.commentable = @photo
      @comment.save
      expect(@comment.commentable).to be_a(Photo)
  end
end


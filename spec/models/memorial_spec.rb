require 'rails_helper'

RSpec.describe Memorial, :type => :model do
  before do
  	@user = User.new(name: "Jonathan", email_address: "jonyoungg@gmail.com")
  	@user2 = User.new(name: "Simon", email_address: "simon@gmail.com")
  	@memorial = Memorial.new
  	@memorial.posts << Post.new(author_id: @user2.id, memorial_id: @memorial.id, approved: true, text: "This is a test post")
  end

	it 'a memorial should belong to a moderator' do
		@memorial.moderator = @user2
  	expect(@memorial.moderator).to be_a(User)
  end

  it 'should have photos associated with a memorial' do
  	@memorial.photos << Photo.new
  	expect(@memorial.photos.first).to be_a(Photo)
  end

  it 'should have photos associated with a memorial' do
  	@memorial.posts << Post.new
  	expect(@memorial.posts.first).to be_a(Post)
  end

end


require 'rails_helper'

RSpec.describe Post, :type => :model do
  before do
    @post = Post.new(approved: true, text: "This guy had lots of fun")
  end

  subject(:post) { @post }

  it { is_expected.to respond_to(:approved) }
  it { is_expected.to respond_to(:text) }

  it { is_expected.to be_valid }

  describe "when post is not approved" do
    before { @post.approved = false }
    it { is_expected.to be_valid }
  end

  describe "when text is not present" do
    before { @post.text = '' }
    it { is_expected.to_not be_valid }
  end

  describe "should have many comments" do
    before { @post.comments << Comment.new(commentable: @post) }
    it { is_expected.to be_valid }
  end

  describe "should belong to an uploader" do
    before { @post.author = User.new(name: "Frank", email_address: "frank@example.com") }
    it { is_expected.to be_valid }
  end

  describe "should belong to a memorial" do
    before { @post.memorial = Memorial.new }
    it { is_expected.to be_valid }
  end

end


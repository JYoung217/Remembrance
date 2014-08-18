require 'rails_helper'

RSpec.describe Photo, :type => :model do
  before do
    @photo = Photo.new(approved: true, url: "http://blog.jimdo.com/wp-content/uploads/2014/01/tree-247122.jpg", caption: "This is a test picture", profile: false)
  end

  subject(:photo) { @photo }

  it { is_expected.to respond_to(:approved) }
  it { is_expected.to respond_to(:url) }
  it { is_expected.to respond_to(:caption) }
  it { is_expected.to respond_to(:profile) }

  it { is_expected.to be_valid }

  describe "when photo is not approved" do
    before { @photo.approved = false }
    it { is_expected.to be_valid }
  end

	describe "when caption is not present" do
    before { @photo.caption = '' }
    it { is_expected.to_not be_valid }
  end
  
  describe "when photo is a profile picture" do
    before { @photo.profile = true }
    it { is_expected.to be_valid }
  end
  
	describe "photo by default shouldn't be a profile picture" do
    before { @photo = Photo.new(approved: true, url: "http://blog.jimdo.com/wp-content/uploads/2014/01/tree-247122.jpg", caption: "This is a test picture") }
    it { expect(@photo.profile).to eq(false) }
  end

  describe "should have many comments" do
    before { @photo.comments << Comment.new(commentable: @photo) }
    it { is_expected.to be_valid }
  end

  describe "should belong to an uploader" do
    before { @photo.uploader = User.new }
    it { is_expected.to be_valid }
  end

  describe "should belong to a memorial" do
    before { @photo.memorial = Memorial.new }
    it { is_expected.to be_valid }
  end

end


  






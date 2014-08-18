require 'rails_helper'
#this one
RSpec.describe MemorialGuest, :type => :model do
  before do
    @user = User.new(name: "Jonathan", email_address: "jonyoungg@gmail.com")
    @memorial = Memorial.new(moderator_id: @user.id)
    @memorial_guest = MemorialGuest.new(guest_id: 1, memorial_id: 1)
  end

  describe "associations" do

      it 'should join Memorial and Guest(aka Users) table' do
        @memorial_guest.guest = @user
        @memorial_guest.memorial = @memorial
        @memorial_guest.save
        expect(@memorial_guest.memorial).to be_a(Memorial)
        expect(@memorial_guest.guest).to be_a(User)
      end

  end

end

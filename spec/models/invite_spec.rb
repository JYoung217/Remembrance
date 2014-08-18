require 'rails_helper'

RSpec.describe Invite, :type => :model do
  describe '#memorials' do
  	it 'should show me the memorial it belongs to' do
  		@memorial = Memorial.create(deceased_name: "John Jacob")
  		@invite = Invite.create(email: "ev@example.com", memorial: @memorial)
  		expect(@invite.memorial).to eq(@memorial)
  	end
  end
end

require 'simplecov'
SimpleCov.start

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

OmniAuth.config.test_mode = true
omniauth_hash =
    { provider: 'facebook',
	    uid: '100006598157037',
			info: {
				email: 'jeremy_rhvuhfx_wongwong@tfbnw.net',
				name: 'Jeremy Wongwong'
				},
			credentials: {
        token: 'CAAGrm0zGx0UBADjUS1pHLOvIZCyerrkFrRr8E04sIs8gwEH8ZBvZCEhZCePCc7ucZCuppfZAHWBBOYsd2FwRx1T0Qf5E4rAHZBMV4WWB4BDeOwJbpen4nZAVnMjXDUcO67jZBPeDr70rMzDFGVEinA19oaSuoGtywZCBVVLwz5F0HSVeyBD147JVD6xITzpUozZAOqzbJXeeTX75lfMqNifZCi3SScwe0uyMX7gZD',
        expires_at: Time.now + 1.week,
        expires: true
      }
	  }
OmniAuth.config.add_mock(:facebook, omniauth_hash)


class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

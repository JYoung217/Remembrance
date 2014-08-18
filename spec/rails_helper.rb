# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require 'spec_helper'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # Capybara.default\_wait\_time = 10
  # Capybara.app_host = 'http://' + Settings.host

  config.before :each do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.start
  end

  config.after do
    DatabaseCleaner.clean
  end

  OmniAuth.config.test_mode = true
  omniauth_hash =
      { provider: 'facebook',
        uid: '100006598157037',
        info: {
          email: 'jeremy_rhvuhfx_wongwong@tfbnw.net'
          },
        credentials: {
          token: 'CAAGrm0zGx0UBADjUS1pHLOvIZCyerrkFrRr8E04sIs8gwEH8ZBvZCEhZCePCc7ucZCuppfZAHWBBOYsd2FwRx1T0Qf5E4rAHZBMV4WWB4BDeOwJbpen4nZAVnMjXDUcO67jZBPeDr70rMzDFGVEinA19oaSuoGtywZCBVVLwz5F0HSVeyBD147JVD6xITzpUozZAOqzbJXeeTX75lfMqNifZCi3SScwe0uyMX7gZD'
        }
      }
  OmniAuth.config.add_mock(:facebook, omniauth_hash)

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, :type => :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!
end

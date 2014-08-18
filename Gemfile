source 'https://rubygems.org'
ruby "2.0.0"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.4'

group :development, :test do
  gem 'database_cleaner', '~> 1.3.0'
  gem 'rspec-rails', '~> 3.0.0'
  gem 'capybara', '~> 2.4.1'
  gem 'launchy', '~> 2.4.2'
  gem 'factory_girl_rails', '~> 4.4.1'
end

# Assets-pipeline for Heroku
gem 'rails_12factor', group: :production

# Use postgresql as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'bcrypt', '~> 3.1.0'
gem 'sass-rails', '~> 4.0.3'
gem 'less-rails'
gem 'therubyracer'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

#facebook oauth
gem 'omniauth'
gem 'omniauth-facebook', '1.4.0'

#simplecov
gem 'simplecov', '~> 0.9.0', :require => false, :group => :test

group :development, :test, :production do
	# Images
	gem 'carrierwave'
	# for aws cloud storage
	gem 'fog'
	# photo resizing
	gem "mini_magick"
end

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
# gem 'spring',        group: :development

gem 'annotate', '~> 2.6.5'

# Use ActiveModel has_secure_password


gem 'pry-rails'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

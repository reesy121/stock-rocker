source 'https://rubygems.org'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.3'
# Use postgresql as the database for Active Record
gem 'pg', '0.19.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use bootstrap
gem 'bootstrap-sass'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'#
# Use Devise for login system
gem 'devise'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# For HTML Editor
gem "paperclip", "~> 5.0.0.beta1"
gem 'ckeditor', github: 'galetahub/ckeditor'
# Simple to help integrate with caccon
gem 'simple_form'
# Cocoon to make child records in parent form
gem "cocoon"
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
# Measure Blogs Views 
# Version 1.5.2 bugs out see https://github.com/charlotte-ruby/impressionist/issues/220
# Can fix but for now just go back to 1.5.1
gem 'impressionist', '1.5.1'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
group :development do
  gem 'rails_layout'
  #gem 'rails_real_favicon' can't use need to fix mime types
  gem 'capistrano', '~> 3.4.0'
  gem 'capistrano-rails', '~> 1.1.1'
  # Add this if you're using rbenv
  gem 'capistrano-rbenv', github: "capistrano/rbenv"
  # Add this if you're using rvm
  # gem 'capistrano-rvm', github: "capistrano/rvm"
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
end

group :test do
	gem "factory_bot_rails"
	gem 'shoulda-matchers'
  gem 'database_cleaner'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'rspec-rails'
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'launchy'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end


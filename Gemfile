source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

# Use to style devise views
gem 'jquery-rails'
gem 'coffee-rails', '~> 5.0.0'
gem 'twitter-bootstrap-rails'
gem 'devise-bootstrap-views'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.2', '>= 6.0.2.1'
# Use pg as the database for Active Record
gem 'pg', '~> 0.18.4'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use bug tracker tool
gem "sentry-raven"
# Run background processes
gem 'sidekiq'
# Run scheduled jobs
gem 'sidekiq-scheduler'
# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0'
# Use http protocol to consume services
gem 'httparty'
# Use Active Model has_secure_password
gem 'bcrypt', '~> 3.1.7'
# Use the following gems to create an admin interface
gem 'remotipart', github: 'mshibuya/remotipart'
gem 'rails_admin', github: 'sferik/rails_admin'
gem 'rails_admin_rollincode', '~> 1.0'
gem "devise"
# Use twilio to send whatsapp messages
gem 'twilio-ruby'
# Use CanCanCan to manage different access levels
gem 'cancancan'
# Use swagger to document endpoints
gem 'rswag-api'
gem 'rswag-ui'
# Use to generate pdfs
gem 'prawn-rails'
# Use to generate graphics
gem 'rmagick', '~> 4.1.2'
gem 'gruff'
# Use Active Storage variant
# gem 'image_processing', '~> 1.2'
# Use to present dynamic charts
gem 'rails_admin_charts'
gem "highcharts-rails"
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false
# Use to validate the status of our services
gem 'status-page'
# Use to run all third-party services
gem 'foreman'
# Adding gem for telegram bot
gem 'telegram-bot-ruby'
# Use to save requests to third party apps
gem 'vcr', '~> 3.0', '>= 3.0.1'
# Used to mock requests
gem 'webmock'
gem 'listen', '>= 3.0.5', '< 3.2'
group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'irb'
  gem 'rspec-rails'
  gem 'rswag-specs'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
  gem 'timecop', '~> 0.8.1'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

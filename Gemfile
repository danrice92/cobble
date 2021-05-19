source 'https://rubygems.org'
git_source(:github) { |repo| 'https://github.com/#{repo}.git' }

# Ruby on Rails
ruby '2.6.3'
gem 'rails', '~> 5.2.1', '>= 5.2.1.1'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.3'

# Styles
gem 'sass-rails', '~> 5.0'
gem 'semantic-ui-sass'

# JavaScript
gem 'webpacker'
gem 'webpacker-react', '~> 0.3.2'
gem 'jquery-rails'

# Authentication
gem 'pundit'

# Emails
gem 'sendgrid-ruby'

# Forms
gem 'invisible_captcha'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'
# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails', '~> 3.8'
  gem 'pry'
  gem 'pry-nav'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'letter_opener'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'launchy'
  gem 'database_cleaner'
  gem 'selenium-webdriver'
  gem 'webdrivers'
  gem 'factory_bot_rails', '~> 4.0'
  gem 'faker'
  gem 'rack_session_access'
  gem 'capybara-email'
  gem 'timecop'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
# gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

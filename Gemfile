source 'https://rubygems.org'

# the following gems are already included when a new rails app is created (removed the initial comments)
gem 'rails', '4.2.3'

# personally added BCrypt below
gem 'bcrypt', '~> 3.1.7'

gem 'sqlite3'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc

group :development, :test do
  gem 'byebug'
  gem 'web-console', '~> 2.0'
  gem 'spring'
end

# personally added RSpec below for dev/test environments
group :development, :test do
    gem 'rspec-rails', '~> 2.0' # we want a version greater than 2.0
end

# personally added Capybara below for test environment
group :test do
    gem 'capybara', '~> 2.1.0' # we want a version greater than 2.1.0
    gem 'shoulda-matchers', '~> 2.8.0' # we want a version greater than 2.8.0 to ensure compatibility
end
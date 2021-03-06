source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.4'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Bootstrap for easy styling
gem 'bootstrap', '~> 4.0.0.beta'
# Add jQuery 
gem 'jquery-rails', '4.3.1'
# Use AWS
gem 'aws-sdk', '~> 3'
# Allow MIME detection in PORO
gem 'mimemagic'
# Recaptcha support
gem 'recaptcha', require: 'recaptcha/rails'

group :production do
  #Use Phusion Passenger in prod
  gem 'passenger'
end

group :development, :test do
  # Use Puma as the app server
  gem 'puma', '~> 3.7'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Add rspec-rails
  gem 'rspec-rails', '~> 3.6'
  # Add Shoulda-Matchers
  gem 'shoulda-matchers', '~> 3.0'
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  # Add Faker for easier seeding
  gem 'faker'
  # Add Factory Bot
  gem 'factory_bot_rails'
  # Clean that DB!
  gem 'database_cleaner'
  # .env Support in non-Prod
  gem 'dotenv-rails'
  # Missing rails controller testing in 5.1.X
  gem 'rails-controller-testing'
  # Add VCR / Webmock for S3 performance
  gem 'webmock', '3.1.1'
  gem 'vcr', '4.0.0'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
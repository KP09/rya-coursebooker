# Ruby version
ruby '2.4.1'

# Source for ruby gems
source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.3'

# Use Puma as the app server
gem 'puma', '~> 3.7'

# Use PostgreSQL as database
gem 'pg'

# Figaro to set production environment settings
gem 'figaro'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'

# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'

# Bootstrap SASS stylesheets
gem 'bootstrap-sass'

# Font-awesome SASS stylesheets
gem 'font-awesome-sass'

# Simple form for forms
gem 'simple_form'

# Autprefixer for browser-compatibility
gem 'autoprefixer-rails'

# jQuery for rails
gem 'jquery-rails'

# Devise for User authentication
gem 'devise'

# Pundit for User authorization
gem 'pundit'

# Geocoder to geocode addresses
gem 'geocoder'

# For dynamic google maps
gem "gmaps4rails"
source 'https://rails-assets.org' do
  gem "rails-assets-underscore"
end

# Facebook login
gem 'omniauth-facebook'

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Active Admin for back-end administration
gem 'activeadmin', github: 'activeadmin/activeadmin'
gem 'inherited_resources', github: 'activeadmin/inherited_resources'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
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

source 'https://rubygems.org'

ruby '1.9.3'
gem 'rails', '3.2.16'
gem 'figaro'
gem 'jquery-rails'
gem 'haml'
gem 'paperclip', '~> 4.2'
gem 'bootstrap-sass', '~> 3.2'
gem 'sass-rails', '>= 3.2'
gem 'sprockets'
gem 'autoprefixer-rails'
gem 'pg'
gem 'activerecord-postgresql-adapter'

# Interface with AuthCAS
gem 'rubycas-client'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

group :production, :staging do
  gem 'rails_12factor'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'coffee-rails', '~> 3.2.1'
  gem 'therubyracer'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'

group :test, :development do
    gem 'cucumber-rails', :require => false
    gem 'database_cleaner'
    gem 'erb2haml'
    gem 'rake'
    gem 'sqlite3'
    gem 'rspec-rails', '~> 2.14.0'
    gem 'simplecov'
    gem 'selenium-webdriver'
end

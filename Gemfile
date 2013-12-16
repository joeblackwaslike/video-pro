source 'https://rubygems.org'

ruby '2.0.0'

gem 'rails', '4.0.0'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

group :production do
  gem 'pg'
  gem 'dm-postgres-adapter'
#  gem 'mysql'
#  gem 'mysql2'
  gem 'rails_12factor'
end

group :development do
  gem 'rake'
  gem 'sqlite3'
end

group :development, :test do
  gem 'rspec-rails'
end


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 4.0.0'
  gem 'coffee-rails', '~> 4.0.0'
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby
  gem 'uglifier', '>= 1.0.3'
  gem 'anjlab-bootstrap-rails', :require => 'bootstrap-rails', :git => 'git://github.com/anjlab/bootstrap-rails.git', :branch => '3.0.0'
end

# Renderering engines
gem 'haml-rails'
gem 'maruku'
gem 'nokogiri'
gem 'redcarpet'
gem 'rouge'
#gem 'pygments.rb'

# Presentation related
gem 'jquery-rails'
gem 'turbolinks'

# API's
gem 'bitsontherun'

# Server Related
gem 'thin'
# Use unicorn as the app server
gem 'unicorn'

# Monitoring by New Relic
#gem 'newrelic-rpm',   '~> 3.7.0'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.0.1'

# To use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.0.0'



# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
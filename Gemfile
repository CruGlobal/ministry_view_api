source 'https://rubygems.org'

gem 'rails', '4.2.10'
gem 'rails-api'
gem 'active_model_serializers', git: 'https://github.com/rails-api/active_model_serializers.git'
gem 'puma'
gem 'bcrypt', '~> 3.1.7'
gem 'versionist'
gem 'redis-namespace'
gem 'redis-rails'
gem 'oj'
gem 'oj_mimic_json'
gem 'newrelic_rpm'
gem 'rails-api-newrelic'
gem 'rubycas-client-rails'
gem 'cru-auth-lib', '~> 0.1.0'
gem 'rollbar'
gem 'girl_friday'
gem 'savon', '~> 2.11.0'
gem 'rack-cors', require: 'rack/cors'

group :development do
  gem 'better_errors'
  gem 'spring'
end

group :development, :test do
  gem 'awesome_print'
  gem 'dotenv-rails'
  gem 'guard-rubocop'
  gem 'guard-rspec'
  gem 'rspec-rails'
  gem 'pry-rails'
  gem 'rubocop'
end

group :test do
  gem 'webmock'
  gem 'simplecov', require: false
  gem 'factory_girl_rails'
  gem 'fakeredis', :require => 'fakeredis/rspec'
  gem 'coveralls', require: false
end

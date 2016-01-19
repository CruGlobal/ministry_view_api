source 'https://rubygems.org'

# gem 'rails'
gem 'rails-api'
gem 'active_model_serializers', git: 'git@github.com:rails-api/active_model_serializers.git'
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
gem 'cru_lib', git: 'https://github.com/CruGlobal/cru_lib.git'
gem 'rollbar', '~> 2.2.1'
gem 'girl_friday'
gem 'savon', '~> 2.11.0'
gem 'rack-cors', require: 'rack/cors'

group :development do
  gem 'better_errors'
  gem 'awesome_print'
  gem 'spring'
end

group :development, :test do
  gem 'dotenv-rails'
  gem 'guard-rubocop'
  gem 'guard-rspec'
  gem 'rspec-rails'
  gem 'pry-rails'
end

group :test do
  gem 'webmock'
  gem 'test_after_commit'
  gem 'simplecov', require: false
  gem 'factory_girl_rails'
  gem 'fakeredis', :require => 'fakeredis/rspec'
  gem 'rubocop'
  gem 'coveralls', require: false
end

source 'https://rubygems.org'

gem 'rails', '4.2.4'
gem 'rails-api'
gem 'spring', :group => :development
gem 'active_model_serializers', git: 'git@github.com:rails-api/active_model_serializers.git'
gem 'bcrypt', '~> 3.1.7'
gem 'puma'
gem 'silencer'
gem 'versionist'
gem 'redis-namespace'
gem 'redis-rails'
gem 'oj'
gem 'rubycas-client-rails', git: 'git://github.com/rubycas/rubycas-client-rails.git'
gem 'newrelic_rpm'
gem 'rollbar', '~> 2.2.1'
gem 'girl_friday'
gem 'savon', '~> 2.11.0'

group :development do
  gem 'better_errors'
  gem 'dotenv-rails'
  gem 'awesome_print'
end

group :development, :test do
  gem 'guard-rubocop'
  gem 'guard-rspec'
  gem 'rspec-rails'#, '~> 3.3.2'
end

group :test do
  gem 'mock_redis'
  gem 'webmock'#, '~> 1.21.0'
  gem 'test_after_commit'
  gem 'simplecov', require: false
  gem 'factory_girl_rails'
end
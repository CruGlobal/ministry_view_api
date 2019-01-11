source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '5.0.7'
gem 'active_model_serializers', git: 'https://github.com/rails-api/active_model_serializers.git'
gem 'puma', '~> 3.0'
gem 'bcrypt', '~> 3.1.7'
gem 'versionist'
gem 'redis-namespace'
gem 'redis-rails'
gem 'oj'
gem 'oj_mimic_json'
gem 'newrelic_rpm'
gem 'rubycas-client-rails'
gem 'cru-auth-lib', '~> 0.1.0'
gem 'rollbar'
gem 'girl_friday'
gem 'savon', '~> 2.11.0'
gem 'rack-cors', require: 'rack/cors'
gem 'ddtrace'

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

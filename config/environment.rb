# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
begin
  Rails.application.initialize!
rescue StandardError => e
  Rollbar.error(e)
  raise
end

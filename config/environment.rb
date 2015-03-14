# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Jortal::Application.initialize!

require 'casclient'
require 'casclient/frameworks/rails/filter'

CASClient::Frameworks::Rails::Filter.configure(
  :cas_base_url => "https://auth.berkeley.edu/cas"
)

ENV['RACK_ENV'] = 'development'

require File.join(File.dirname(__FILE__), '../app/', 'app.rb')
require 'rack/test'

def app
  App
end

ActiveRecord::Base.logger = nil

app.set :logging, false
app.set :run, false
app.set :raise_errors, true

RSpec.configure do |config|
  config.include Rack::Test::Methods
end
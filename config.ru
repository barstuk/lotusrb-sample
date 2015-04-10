require './config/environment'
require 'rack-session-sequel'

run Lotus::Container.new

use Rack::Session::Sequel, :db_uri => ENV['SAMPLEAPP_DATABASE_URL'], :expire_after => 60000
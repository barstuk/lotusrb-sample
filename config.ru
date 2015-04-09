require './config/environment'
require 'rack-session-sequel'

run Lotus::Container.new

use Rack::Session::Sequel, :db_uri => DATABASE_URL, :expire_after => 600
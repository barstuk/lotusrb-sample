require 'pg'
require 'lotus/model'
require 'lotus/model/adapters/sql_adapter'

Dir["#{ __dir__ }/sampleapp/**/*.rb"].each { |file| require_relative file }
DATABASE_URL = 'postgres://adam:nowe@localhost/sampleapp_development'

Lotus::Model.configure do
  # Database adapter
  #
  # Available options:
  #
  #  * Memory adapter
  #    adapter type: :memory, uri: 'memory://localhost/sampleapp_development'
  #
  #  * SQL adapter
  #    adapter type: :sql, uri: 'sqlite://db/sampleapp_development.sqlite3'
  #    adapter type: :sql, uri: 'postgres://localhost/sampleapp_development'
  #    adapter type: :sql, uri: 'mysql://localhost/sampleapp_development'
  #
  adapter type: :sql, uri: DATABASE_URL

  ##
  # Database mapping
  #
  # Intended for specifying application wide mappings.
  #
  # You can specify mapping file to load with:
  #
  mapping "#{__dir__}/config/mapping"
  #
  # Alternatively, you can use a block syntax like the following:
  #
end.load!

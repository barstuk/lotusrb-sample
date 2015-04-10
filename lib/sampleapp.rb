require 'pg'
require 'lotus/model'
require 'lotus/model/adapters/sql_adapter'

Dir["#{ __dir__ }/sampleapp/**/*.rb"].each { |file| require_relative file }

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
  adapter type: :sql, uri:  ENV['SAMPLEAPP_DATABASE_URL']


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

module SampleApp
  module Authenticable
    def self.included(base)
      base.class_eval do
    include Lotus::Action::Session
        # before :authenticate!

        def current_user
          @current_user ||=  UserRepository.find_by_remember_token(session[:user]) if session[:user]
        end

        def user_signed_in
          @user_signed_in = !!current_user if @user_signed_in.nil?
          @user_signed_in
        end

        private
        def authenticate!
          halt 401 unless user_signed_in
        end
      end
    end
  end
end

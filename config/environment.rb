require 'rubygems'
require 'bundler/setup'
require 'lotus/setup'
require 'pry'

require_relative '../lib/sampleapp'
require_relative '../apps/web/application'
require_relative '../apps/another/application'

Lotus::Container.configure do
  mount Web::Application, at: '/web'
  mount Another::Application, at: '/another'
end

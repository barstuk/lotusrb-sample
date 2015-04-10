require 'rubygems'
require 'bundler/setup'
require 'lotus/setup'
require 'pry'

require_relative '../lib/sampleapp'
require_relative '../apps/todos_app/application'
require_relative '../apps/posts_app/application'
require_relative '../apps/web/application'
require_relative '../apps/api/v1/application'

Lotus::Container.configure do
  mount ApiV1::Application, at: '/api/v1'
  mount TodosApp::Application, at: '/todos_app'
  mount PostsApp::Application, at: '/posts_app'
  mount Web::Application, at: '/'
end

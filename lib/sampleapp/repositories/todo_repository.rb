require 'lotus/model'
require_relative 'timestamps'

class TodoRepository
  include Lotus::Repository
  extend Timestamps
end

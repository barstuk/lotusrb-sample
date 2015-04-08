require 'lotus/model'
require_relative 'timestamps'

class PostRepository
  include Lotus::Repository
  extend Timestamps
end

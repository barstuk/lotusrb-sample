require 'lotus/model'
require_relative 'timestamps'

class TodoRepository
  include Lotus::Repository
  extend Timestamps

  def self.find_by_user_id(user_id)
    query do
      where(user_id: user_id)
    end
  end


end

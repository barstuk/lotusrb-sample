require 'lotus/model'
require_relative 'timestamps'

class TodoRepository
  include Lotus::Repository
  extend Timestamps

  def self.find_by_user_id_and_todo(user_id)
    query do
      where(user_id: user_id, done: false)
    end
  end

  def self.find_by_user_id_and_done(user_id)
    query do
      where(user_id: user_id, done: false)
    end
  end


end

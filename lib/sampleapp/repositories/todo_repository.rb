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

  def self.find_by_todo
    query do
      where(done: false)
    end
  end

  def self.find_by_done
    query do
      where(done: true)
    end
  end

  def self.find_by_category(category)
    query do
      where(category: category)
    end
  end

  def self.find_by_name(name)
    query do
      where(name: name)
    end
  end
end

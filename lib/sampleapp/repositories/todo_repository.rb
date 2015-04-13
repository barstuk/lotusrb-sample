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

  def self.find_by_user_id_todo(user_id)
    query do
      where(user_id: user_id, done: false)
    end
  end

  def self.find_by_user_id_done(user_id)
    query do
      where(user_id: user_id, done: true)
    end
  end

  def self.find_by_user_id_done_category(user_id, category)
    query do
      where(user_id: user_id, done: true, category: category)
    end
  end

  def self.find_by_user_id_todo_category(user_id, category)
    query do
      where(user_id: user_id, done: false, category: category)
    end
  end

  def self.find_by_user_id_todo_category_name(user_id, category)
    query do
      where(user_id: user_id, done: false, category: category)
    end
  end

  def self.find_by_user_id_todo_category_name_name(user_id, category, name)
    query do
      where(user_id: user_id, done: false, category: category, name: name)
    end
  end
end

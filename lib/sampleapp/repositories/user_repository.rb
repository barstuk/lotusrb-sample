require 'lotus/model'
require_relative 'timestamps'

class UserRepository
  include Lotus::Repository
  extend Timestamps

  def self.create(user)
    user.generate_token
    super(user)
  end

  def self.find_by_email(email)
    query do
      where(email: email)
    end.first
  end

  def self.find_by_remember_token(remember_token)
    query do
      where(remember_token: remember_token)
    end.first
  end

end

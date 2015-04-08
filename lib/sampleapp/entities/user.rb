require 'lotus/validations'

class User
  include Lotus::Entity
  include Lotus::Validations

  attribute :name, presence: true
  attribute :email, presence: true
  attributes :admin, :created_at, :updated_at, :password_digest, :remember_token

  def admin?
    admin == true
  end

  def generate_token
    token = SecureRandom.urlsafe_base64
    @remember_token = Digest::SHA1.hexdigest(token.to_s)
  end
end
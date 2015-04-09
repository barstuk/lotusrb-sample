# require 'lotus/validations'
require 'bcrypt'

class User
  include Lotus::Entity
  include BCrypt
  include Lotus::Validations

  attribute :admin
  attribute :created_at
  attribute :updated_at
  attribute :password_digest, presence: true, size: 4..64
  attribute :remember_token
  validates :name, presence: true
  validates :email, presence: true, format: /\A(.*)@(.*)\.(.*)\z/

  def password
    @password ||= Password.new(password_digest)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = @password
  end

  def admin?
    admin == true
  end

  def generate_token
    token = SecureRandom.urlsafe_base64
    self.remember_token = Digest::SHA1.hexdigest(token.to_s)
  end
end

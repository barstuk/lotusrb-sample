class User
  include Lotus::Entity

  attribute :name, :email, presence: true
  attribute :admin, :created_at, :updated_at

  def admin?
    admin == true
  end

  def generate_token
    token = SecureRandom.urlsafe_base64
    @remember_token = Digest::SHA1.hexdigest(token.to_s)
  end
end

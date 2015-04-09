collection :users do
  entity     User
  repository UserRepository

  attribute :id,   Integer
  attribute :name, String
  attribute :email, String
  attribute :created_at, DateTime
  attribute :updated_at, DateTime
  attribute :remember_token, String
  attribute :password_digest, String
  attribute :admin, Boolean
end
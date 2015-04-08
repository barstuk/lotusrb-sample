collection :posts do
  entity     Post
  repository PostRepository

  attribute :id,   Integer
  attribute :title, String
  attribute :content, String
  attribute :created_at, DateTime
  attribute :updated_at, DateTime
end
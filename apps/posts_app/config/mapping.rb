collection :posts do
  entity     Post
  repository PostRepository

  attribute :id,   Integer
  attribute :title, String
  attribute :content, String
end
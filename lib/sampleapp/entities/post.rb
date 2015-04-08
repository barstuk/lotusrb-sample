require 'lotus/validations'

class Post
  include Lotus::Entity
  include Lotus::Validations
  attribute :title, presence: true
  attributes :content, :created_at, :updated_at
end

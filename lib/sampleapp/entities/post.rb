require 'lotus/validations'

class Post
  include Lotus::Entity
  include Lotus::Validations
  attribute :title, presence: true
  attribute :user_id
  attribute :updated_at
  attribute :created_at
  attribute :content
end

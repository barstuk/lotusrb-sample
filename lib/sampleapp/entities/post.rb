require 'lotus/validations'

class Post
  include Lotus::Entity
  include Lotus::Validations
  attribute :title, presence: true
  attribute :content
end

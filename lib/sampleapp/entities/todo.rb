require 'lotus/validations'

class Todo
  include Lotus::Entity
  include Lotus::Validations
  attribute :name, presence: :true
  attribute :done
  attribute :created_at
  attribute :updated_at
  attribute :user_id
  attribute :category
end

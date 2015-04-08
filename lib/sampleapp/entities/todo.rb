require 'lotus/validations'

class Todo
  include Lotus::Entity
  include Lotus::Validations
  attribute :name, presence: :true
  attributes :done, :created_at, :updated_at
end

class Todo
  include Lotus::Entity
  attributes :name, presence: true
  attributes :done, :created_at, :updated_at
end

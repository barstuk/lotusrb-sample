collection :todos do
  entity     Todo
  repository TodoRepository

  attribute :id,   Integer
  attribute :name, String
  attribute :done, Boolean
  attribute :created_at, DateTime
  attribute :updated_at, DateTime
end
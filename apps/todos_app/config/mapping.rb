collection :todos do
  entity     Todo
  repository TodoRepository

  attribute :id,   Integer
  attribute :name, String
  attribute :done, Boolean, :default => true
end
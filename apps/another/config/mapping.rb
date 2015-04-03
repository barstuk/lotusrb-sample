collection :tasks do
  entity     Task
  repository TaskRepository

  attribute :id,   Integer
  attribute :name, String
end
collection :users do
  entity     User
  repository UserRepository

  attribute :id,   Integer
  attribute :name, String
end

collection :tasks do
  entity     Task
  repository TaskRepository

  attribute :id,   Integer
  attribute :name, String
end
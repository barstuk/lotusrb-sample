Sequel.migration do
  change do
    add_index :users, :email, unique: true
  end
end

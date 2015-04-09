Sequel.migration do
  change do
    add_column :todos, :user_id, Integer
    add_index :todos, :user_id
  end
end

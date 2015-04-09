Sequel.migration do
  change do
    add_column :posts, :user_id, Integer
    add_index :posts, :user_id
  end
end
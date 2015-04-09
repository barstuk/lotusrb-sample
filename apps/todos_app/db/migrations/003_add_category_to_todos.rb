Sequel.migration do
  change do
    add_column :todos, :category, String
  end
end

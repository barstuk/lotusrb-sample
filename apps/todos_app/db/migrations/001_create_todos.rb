Sequel.migration do
  change do
    create_table(:todos) do
      primary_key :id
      String   :name, null: false
      Boolean  :done, null: false, default: false
      DateTime :created_at
      DateTime :updated_at
    end
  end
end
Sequel.migration do
  change do
    create_table(:posts) do
      primary_key :id
      String   :title, null: false
      String   :content
      DateTime :created_at
      DateTime :updated_at
    end
  end
end
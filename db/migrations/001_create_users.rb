Sequel.migration do
  change do
    create_table(:users) do
      primary_key :id
      String   :name, null: false
      String   :email, null: false
      String   :password_digest
      String   :remember_token
      Boolean  :admin, null: false, default: false
      DateTime :created_at
      DateTime :updated_at
    end
  end
end
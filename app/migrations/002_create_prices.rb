Sequel.migration do
  transaction
  change do
    create_table(:prices) do
      primary_key :id
      Integer :price, null: false
      DateTime :price_at

      DateTime :created_at
      DateTime :updated_at

      foreign_key :user_id, :users, null: false, key: [:id]
      unique [:user_id, :price_at]
    end
  end
end

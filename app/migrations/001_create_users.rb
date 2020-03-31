Sequel.migration do
  transaction
  change do
    create_table(:users) do
      primary_key :id
      String :username, size: 255, null: false, unqiue: true
      String :password, size: 255, null: false
      String :nickname, null: false
      String :avatar, null: true

      # Nintendo Switch Infomation
      String :sw, null: true
      Integer :timezone, null: false
      
      # Crossing Animal Information
      String :island_name, null: false
      String :passcode, null: true
      Integer :island_open, null: false, default: 0 # 0: Closed, 1: Open with Shared SW, 2: Open with Shared Passcode, 3: Open with Group Management

      DateTime :created_at
      DateTime :updated_at
    end
  end
end

class Token < Ohm::Model
  attribute :token
  attribute :user_id
  attribute :role

  index :token

  def user
    User.find(self.user_id)
  end
end

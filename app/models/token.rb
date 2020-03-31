class Token < Ohm::Model
  include Ohm::Expire
  TTL = 30 * 24 * 3600 # 30 days

  attribute :token
  attribute :user_id

  expire Token::TTL
  index :token

  def user
    User.find(self.user_id)
  end
end

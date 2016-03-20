class User < ActiveRecord::Base
  validates :email, uniqueness: true
  
  def generate_auth_token
    payload = { user_id: id }
    AuthToken.encode(payload)
  end
  
  def self.find_by_credentials(email, password)
    User.find_by(email: email, password: password)
  end
  
  def self.find_by_token(decoded_auth_token)
    User.find(decoded_auth_token[:user_id])
  end
  
end

class User < ActiveRecord::Base
  validates :email, uniqueness: true
  # Add numericality budget
  has_many :categories
  
  def generate_auth_token
    payload = { user_id: id }
    AuthToken.encode(payload)
  end
  
  def self.find_by_credentials(email, password)
    User.find_by(email: email, password: password)
  end
  
  def self.find_by_token(token)
    User.find(token[:user_id])
  end
  
end

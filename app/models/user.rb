class User < ActiveRecord::Base
  validates :first_name, :last_name, :email, :password, :budget, presence: true
  validates :email, uniqueness: true
  validates :budget, numericality: { greater_than_or_equal_to: 0 }
  
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

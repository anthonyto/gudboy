class Category < ActiveRecord::Base
  belongs_to :user
  has_many :transactions
  
  def set_user_id(user)
    self.user_id = user.id
  end
  
end
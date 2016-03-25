class Category < ActiveRecord::Base
  belongs_to :user
  
  def set_user_id(user)
    self.user_id = user.id
  end
  
end
class Category < ActiveRecord::Base
  belongs_to :user
  
  def set_user_id(decoded_auth_token)
    self.user_id = decoded_auth_token[:user_id]
  end
  
end
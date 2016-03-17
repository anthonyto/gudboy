class User < ActiveRecord::Base
  
  def generate_auth_token
    payload = { user_id: id }
    AuthToken.encode(payload)
  end
  
  def find_by_credentials(email, password)
    User.find_by(email: email, password: password)
  end
  
  def find_by_token(decoded_auth_token)
    USer.find(decoded_auth_token[:user_id])
  end
  
end

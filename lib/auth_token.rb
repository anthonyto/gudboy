require 'jwt'
require 'decoded_auth_token'

class AuthToken
  def self.encode(payload)
    JWT.encode(payload, Rails.application.secrets.secret_key_base)
  end
  
  def self.decode(token)
    payload = JWT.decode(token, Rails.application.secrets.secret_key_base)[0]
    DecodedAuthToken.new(payload)
  rescue
    nil
  end
end
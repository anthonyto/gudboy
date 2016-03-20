require 'jwt'

class AuthToken
  def self.encode(payload)
    JWT.encode(payload, Rails.application.secrets.secret_key_base)
  end
  
  def self.decode(token)
    JWT.decode(token, Rails.application.secrets.secret_key_base)
    DecodedAuthToken.new(payload)
  rescue
    nil
  end
end
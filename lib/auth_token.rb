require 'jwt'

class AuthToken
  def self.encode(payload, exp=24.hours.from_now)
    payload[:exp] = exp
    JWT.encode(payload, Rails.application.secrets.secret_key_base)
  end
  
  def self.decode(auth_token)
    JWT.decode(token, Rails.application.secrets.secret_key_base)
    DecodedAuthToken.new(payload)
  rescue
    nil
  end
end
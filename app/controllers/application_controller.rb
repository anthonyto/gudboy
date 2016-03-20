require 'exceptions'
require 'auth_token'

class ApplicationController < ActionController::API
  before_action :set_user, :authenticate_request
  
  rescue_from NotAuthenticatedError do 
    render json: { error: 'Not Authorized' }, status: :unauthorized
  end
  
  private
  
  def authenticate_request
    if !@user
      fail NotAuthenticatedError
    end
  end
  
  def auth_token_expired?
    decoded_auth_token && decoded_auth_token.expired?
  end
  
  def decoded_auth_token
    @decoded_auth_token || AuthToken.decode(http_auth_header_content)
  end
  
  def http_auth_header_content
    @http_auth_header_content = begin
      if request.headers['Authorization'].present?
       request.headers['Authorization'].split(' ').last
     else
       nil
     end
   end
  end
  
  def set_user
    byebug
    if decoded_auth_token
      @user ||= User.find_by_token(decoded_auth_token)
    end
  end
  
end
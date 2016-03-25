module SkipAuthenticateRequest
  def authenticate
    controller.stub(authenticate_request: true)
  end
end

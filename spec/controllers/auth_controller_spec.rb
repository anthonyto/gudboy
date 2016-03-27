require 'rails_helper'

describe AuthController do
  let(:user){ FactoryGirl.create(:user) }
  
  describe '#authenticate' do
    context 'with valid credentials' do
      before { post :authenticate, { email: user.email, password: user.password } }
      # it should return the user's auth token
    end
    
    context 'with invalid credentials' do
      before { post :authenticate, { email: user.email, password: "foo" } }
      # it should return "Invalid email etc."
      # it should have status unauthorized
    end
  end
end
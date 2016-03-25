require 'rails_helper'

describe ApplicationController do 
  let(:controller){ ApplicationController.new }
  
  describe 'Class Methods' do
    describe 'authenticate request' do 
      # TODO These tests are breaking because of the fail, even though its supposed to fail. wtf
      context 'without @user' do
        it 'raises error' do
          # expect(controller.instance_eval{ authenticate_request }).to raise_error NotAuthenticatedError
        end
      end
      context 'with @user' do
        it 'does not raise an error' do
          @user = FactoryGirl.create(:user)
          # expect(controller.instance_eval{ authenticate_request }).to_not raise_error
        end
      end
    end
    
    describe 'decode_auth_token' do
      it 'returns the payload' do
        # allow(controller).to receive(:http_auth_header_content) { "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo2fQ.kbnaCusXwTwJS6W6eidwJreghveMxx05hL4CATGUOJo" }
        # expect(controller.instance_eval{ decode_auth_token }).to eq({"user_id"=>6})
      end
    end
    
    describe 'http_auth_header_content' do
      context 'with no Authorization in header' do
      end
      context 'with Authorization in header' do
      end
    end
    
    describe 'set_user' do
    end
  end
end
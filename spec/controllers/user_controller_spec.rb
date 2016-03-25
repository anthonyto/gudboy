require 'rails_helper'

describe UserController do 
  describe '#show' do
    let(:user) { FactoryGirl.create(:user) }
    it 'should send user' do
      get :show
    end
  end
  
  describe '#create' do
  end
  
  describe '#update' do
  end
end
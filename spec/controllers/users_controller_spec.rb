require 'rails_helper'

describe UsersController do 
  describe '#show', auth: :skip do
    let(:user){ FactoryGirl.create(:user) }
    it 'should send user' do
      get :show, id: user
      byebug
      expect(assigns(:user)).to eq user
    end
  end
  
  describe '#create' do
  end
  
  describe '#update' do
  end
end
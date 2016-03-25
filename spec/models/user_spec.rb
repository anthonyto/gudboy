require 'rails_helper'

describe User do
  let(:user){ FactoryGirl.create(:user) }
  
  describe "Validators" do
    it { is_expected.to validate_uniqueness_of(:email) }
  end
  
  describe "Class Methods" do
    describe "find_by_credentials" do
      it "returns the right user" do
        expect(User.find_by_credentials(email: user.email, password: user.password)).to eq user
      end
    end
    describe "find_by_token" do
      it "returns the right user" do
        expect(User.find_by_token(user.generate_auth_token).to eq user
      end
    end
  end
  
  describe "Instance Methods" do
    describe "generate_auth_token" do
      it "returns an instance of AuthToken" do
      end
    end
  end
end
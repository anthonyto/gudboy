require 'rails_helper'

describe User do
  let(:user){ FactoryGirl.create(:user) }
  
  describe "Validators" do
    it { is_expected.to validate_presence_of :first_name }
    it { is_expected.to validate_presence_of :last_name }
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_presence_of :password }
    it { is_expected.to validate_presence_of :budget }
    it { is_expected.to validate_uniqueness_of :email }
    it { is_expected.to validate_numericality_of(:budget).is_greater_than_or_equal_to(0) }
  end

  describe "Class Methods" do
    describe "find_by_credentials" do
      it "returns the right user" do
        # expect(User.find_by_credentials(email: user.email, password: user.password)).to eq user
      end
    end
    describe "find_by_token" do
      it "returns the right user" do
        # expect(User.find_by_token(user.generate_auth_token)).to eq user
      end
    end
  end
  
  describe "Instance Methods" do
    describe "generate_auth_token" do
    end
  end
  
end
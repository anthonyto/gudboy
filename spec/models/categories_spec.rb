require 'rails_helper'

describe Category do 
  let(:category){ FactoryGirl.create(:category) }
  
  describe "Instance Methods" do
    describe "set_user_id" do
      let(:user){ FactoryGirl.create(:user) }
      it "assigns the corret user_id" do
        category.set_user_id(user)
        category.save
        expect(category.user_id).to eq user.id
      end
    end
  end
end
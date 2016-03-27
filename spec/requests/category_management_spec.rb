require "rails_helper"

describe "Category management" do
  let(:user) { FactoryGirl.create(:user) }
  let!(:category) { FactoryGirl.create(:category_with_user, user: user) }
  let!(:category_two) { FactoryGirl.create(:category_with_user, user: user) }
  describe "show all categories" do
    before do 
      get "/categories", nil, { "Authorization" => retrieve_token(user) }
    end
    it { expect(response.content_type).to eq "application/json" }
    it { expect(response).to have_http_status :ok }
    it { expect(response.body).to include "id", "#{category.id}", "#{category_two.id}" }
  end
  
  describe "show one category" do
    
  end
  
  describe "create a category" do
    
  end
  
  describe "update a category" do
    
  end
end
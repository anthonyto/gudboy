require "rails_helper"

describe "Sign in" do
  before do 
    user = FactoryGirl.create(:user)
    post "/auth", { email: user.email, password: user.password }
  end
  it { expect(response.content_type).to eq "application/json" }
  it { expect(response).to have_http_status :ok }
  it { expect(response.body).to include "auth_token" }
end
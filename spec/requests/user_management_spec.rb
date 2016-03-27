require "rails_helper"

describe "User management" do 
  let(:user) { FactoryGirl.create(:user) }
  
  describe "show a user" do
    context "with a token" do
      before do 
        get "/user", nil, { "Authorization" => retrieve_token(user) }
      end
      it { expect(response.content_type).to eq "application/json" }
      it { expect(response).to have_http_status :ok }
      it { expect(response.body).to include "id", "#{user.id}"}
    end
    context "without a token" do
      before { get "/user" }
      it { expect(response.content_type).to eq "application/json" }
      it { expect(response).to have_http_status :unauthorized }
      it { expect(response.body).to include "Not Authorized" }
    end
  end
  
  describe "create user" do
    user_params = {
      user: {
        first_name: "Anthony",
        last_name: "To",
        email: "foo@bar.com",
        password: "test123",
        budget: "1500"
        }
      }
    context "with unique email" do
      before { post "/user", user_params }
      it { expect(response.content_type).to eq "application/json" }
      it { expect(response).to have_http_status :created  }
      it { expect(response.body).to include "id" }
    end
    context "with non-unique email" do
      before do 
        user_params[:user][:email] = user.email
        post "/user", user_params
      end
      it { expect(response.content_type).to eq "application/json" }
      it { expect(response).to have_http_status :unprocessable_entity }
      it { expect(response.body).to include "email", "has already been taken" }
    end
  end
  
  describe "update a user" do
    user_params = {
      user: {
        first_name: "updated_first_name",
        last_name: "updated_last_name",
        email: "updated_email@bar.com",
        password: "updated_password",
        budget: "100"
        }
      }
    context "with valid params" do
      before { patch "/user", user_params, { "Authorization" => retrieve_token(user) } }
      it { expect(response.content_type).to eq "application/json" }
      it { expect(response).to have_http_status :ok }
      it { expect(response.body).to include "updated_first_name", "updated_last_name", "updated_email@bar.com", "updated_password", "100" }
    end
    context "with invalid params" do
      # Do we need these cases or are they properly captured in user_spec?
      context "with existing email" do
        before do
          other_user = FactoryGirl.create(:user, email: Faker::Internet.email)
          user_params[:user][:email] = other_user.email
          patch "/user", user_params, { "Authorization" => retrieve_token(user) }
        end
        it { expect(response.content_type).to eq "application/json" }
        it { expect(response).to have_http_status :unprocessable_entity }
        it { expect(response.body).to include "email", "has already been taken" }
      end
      context "with non-integer budget" do
        before do
          user_params[:user][:budget] = "foo"
          patch "/user", user_params, { "Authorization" => retrieve_token(user) }
        end
        it { expect(response.content_type).to eq "application/json" }
        it { expect(response).to have_http_status :unprocessable_entity }
        it { expect(response.body).to include "budget", "is not a number" }
      end
    end
  end
end
require 'rails_helper'

describe 'encode' do
  before do
    payload = { foo: 'bar' }
    token = AuthToken.encode(payload)
  end
  it { expect(token).to eq JWT.encode(payload, Rails.application.secrets.secret_key_base) }
end

describe 'decode' do
end
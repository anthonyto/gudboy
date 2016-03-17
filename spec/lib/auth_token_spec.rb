require 'rails_helper'

describe 'encode' do
  payload = { foo: 'bar' }
  token = AuthToken.encode(payload)
  expect(token).to eq JWT.encode(payload, Rails.application.secrets.secret_key_base)
end

describe 'decode'
end
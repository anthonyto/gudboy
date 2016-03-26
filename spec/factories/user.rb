FactoryGirl.define do 
  factory :user do 
    first_name 'Anthony'
    last_name 'To'
    email 'foo@bar.com'
    password 'foo'
    budget 1000
  end
end
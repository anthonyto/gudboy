FactoryGirl.define do
  factory :category do
    name "Restaurants"
    
    factory :category_with_user do
      user
    end
  end
end
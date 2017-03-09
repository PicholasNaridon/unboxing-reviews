FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "person#{n}@example.com" }
    sequence(:username) { |n| "username#{n}" }
    password "password"
    password_confirmation "password"
  end

  factory :item do
    sequence(:name) { |n| "item#{n}" }
    description 'item description'

  end
end

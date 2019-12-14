FactoryBot.define do
  factory :user do
    password { 'myPass145' }
    email { generate(:email) }
  end
end

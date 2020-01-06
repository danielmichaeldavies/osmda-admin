FactoryBot.define do
  factory :article do
    name { generate(:string) }
    risk { 'negligible' }

    trait :with_description do
      description { generate(:string) }
    end
  end
end

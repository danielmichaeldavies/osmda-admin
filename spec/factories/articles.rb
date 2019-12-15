FactoryBot.define do
  factory :article do
    name { generate(:string) }
    risk { 'negligible' }
  end
end

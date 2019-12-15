FactoryBot.define do
  sequence :string do |n|
    "string#{n}"
  end

  sequence :email do |n|
    "person#{n}@example.com"
  end

  sequence :date do |n|
    Time.current.to_date + n.days
  end
end

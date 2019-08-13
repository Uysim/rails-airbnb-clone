FactoryBot.define do
  factory :property do
    user
    name { Faker::Address.community }
    address { Faker::Address.full_address }
  end
end

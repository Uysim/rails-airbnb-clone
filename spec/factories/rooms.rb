FactoryBot.define do
  factory :room do
    property
    name { Faker::FunnyName.name }

    image { "" }
  end
end

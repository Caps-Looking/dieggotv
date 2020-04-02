FactoryBot.define do
  factory :package do
    name { Faker::FunnyName.name }
    price { 55.0 }
  end
end

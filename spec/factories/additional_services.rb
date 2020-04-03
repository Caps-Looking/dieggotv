FactoryBot.define do
  factory :additional_service do
    name { Faker::FunnyName.name }
    price { 150.0 }
  end
end

FactoryBot.define do
  factory :customers_additional_service do
    price { 150.0 }
    customer
    additional_service
  end
end

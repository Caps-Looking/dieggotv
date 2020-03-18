FactoryBot.define do
  factory :customers_package do
    price { 55.0 }
    package
    customer
  end
end

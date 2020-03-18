FactoryBot.define do
  factory :customer do
    name { 'John' }
    cpf { '12213323312' }

    trait :with_package do
      after(:create) do |customer|
        create(:customers_package, customer: customer)
      end
    end

    trait :with_package_and_additional_services do
      after(:create) do |customer|
        create(:customers_package, customer: customer)
      end

      transient do
        customers_additional_service_count { 2 }
      end

      after(:create) do |customer, evaluator|
        create_list(:customers_additional_service, evaluator.customers_additional_service_count, customer: customer)
      end
    end
  end
end

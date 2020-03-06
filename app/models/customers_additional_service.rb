class CustomersAdditionalService < ApplicationRecord
  belongs_to :customer, optional: true
  belongs_to :additional_service

  validates :additional_service_id, uniqueness: { scope: :customer_id }
end

class CustomersPackage < ApplicationRecord
  belongs_to :customer, optional: true
  belongs_to :package

  validates :package_id, uniqueness: { scope: :customer_id }
end
class Bill < ApplicationRecord
  belongs_to :customers_package, optional: true
  belongs_to :customers_additional_service, optional: true
  belongs_to :month_bill, optional: true
end

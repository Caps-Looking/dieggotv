class Bill < ApplicationRecord
  belongs_to :customers_package, optional: true
  belongs_to :customers_additional_service, optional: true
end

class YearBill < ApplicationRecord
  belongs_to :customer, optional: true, dependent: :delete
end

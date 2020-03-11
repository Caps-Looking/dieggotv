class MonthBill < ApplicationRecord
  belongs_to :year_bill, optional: true, dependent: :delete
end

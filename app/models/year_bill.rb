class YearBill < ApplicationRecord
  belongs_to :customer, optional: true, dependent: :delete
  has_many :month_bills
end

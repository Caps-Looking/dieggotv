class YearBill < ApplicationRecord
  belongs_to :customer, optional: true
  has_many :month_bills, dependent: :destroy
end

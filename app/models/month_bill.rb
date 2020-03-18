class MonthBill < ApplicationRecord
  belongs_to :year_bill, optional: true
  has_many :bills, dependent: :destroy
end

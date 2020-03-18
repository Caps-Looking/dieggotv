class Customer < ApplicationRecord
  has_many :bills
  has_many :year_bills, dependent: :destroy
  has_many :customers_additional_services, dependent: :destroy
  has_one :customers_package, dependent: :destroy

  accepts_nested_attributes_for :customers_additional_services
  accepts_nested_attributes_for :customers_package

  validates :name, :cpf, presence: true
end

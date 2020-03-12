class Customer < ApplicationRecord
  has_many :customers_additional_services, dependent: :delete_all
  has_many :year_bills
  has_one :customers_package

  accepts_nested_attributes_for :customers_additional_services
  accepts_nested_attributes_for :customers_package

  validates :name, :cpf, presence: true
end

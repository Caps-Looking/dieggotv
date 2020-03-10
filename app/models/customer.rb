class Customer < ApplicationRecord
  has_many :customers_additional_services, dependent: :delete_all
  has_many :customers_packages, dependent: :delete_all

  accepts_nested_attributes_for :customers_additional_services
  accepts_nested_attributes_for :customers_packages

  validates :name, :cpf, presence: true
end

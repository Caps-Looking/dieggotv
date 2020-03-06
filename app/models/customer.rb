class Customer < ApplicationRecord
  belongs_to :package
  has_many :customers_additional_services

  accepts_nested_attributes_for :customers_additional_services

  validates :name, :cpf, presence: true
end

class AdditionalService < ApplicationRecord
  has_many :customers_additional_services

  validates :name, :price, presence: true
end

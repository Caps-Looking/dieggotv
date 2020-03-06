class AdditionalService < ApplicationRecord
  has_many :customers_additional_services

  validates :name, :price, presence: true

  def to_s
    "#{name} - $#{price}"
  end
end

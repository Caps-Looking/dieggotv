class Package < ApplicationRecord
  validates :name, :price, presence: true
end

class Package < ApplicationRecord
  validates :name, :price, presence: true

  def to_s
    "#{name} - $#{price}"
  end
end

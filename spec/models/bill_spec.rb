require 'rails_helper'

describe Bill do
  describe 'Associations' do
    it { is_expected.to belong_to(:customers_package).optional(true) }
    it { is_expected.to belong_to(:customers_additional_service).optional(true) }
    it { is_expected.to belong_to(:month_bill).optional(true) }
  end
end

require 'rails_helper'

describe CustomersAdditionalService do
  describe 'Associations' do
    it { is_expected.to belong_to(:customer).optional(true) }
    it { is_expected.to belong_to(:additional_service) }
  end

  describe 'Validations' do
    subject { create(:customers_additional_service) }
    it { is_expected.to validate_uniqueness_of(:additional_service_id).scoped_to(:customer_id) }
  end
end

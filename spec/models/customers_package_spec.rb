require 'rails_helper'

describe CustomersPackage do
  describe 'Associations' do
    it { is_expected.to belong_to(:customer).optional(true) }
    it { is_expected.to belong_to(:package) }
  end

  describe 'Validations' do
    subject { create(:customers_package) }
    it { is_expected.to validate_uniqueness_of(:package_id).scoped_to(:customer_id) }
  end
end

require 'rails_helper'

describe Customer do
  describe 'Associations' do
    it { is_expected.to have_many(:customers_additional_services) }
    it { is_expected.to have_many(:year_bills) }
    it { is_expected.to have_one(:customers_package) }
  end

  describe 'Nested Attributes' do
    it { is_expected.to accept_nested_attributes_for(:customers_additional_services) }
    it { is_expected.to accept_nested_attributes_for(:customers_package) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:cpf) }
  end
end

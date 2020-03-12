require 'rails_helper'

describe AdditionalService do
  describe 'Associations' do
    it { is_expected.to have_many(:customers_additional_services) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:price) }
  end
end

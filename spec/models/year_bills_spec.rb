require 'rails_helper'

describe YearBill do
  describe 'Associations' do
    it { is_expected.to belong_to(:customer).optional(true) }
    it { is_expected.to have_many(:month_bills) }
  end
end

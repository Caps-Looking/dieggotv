require 'rails_helper'

describe MonthBill do
  describe 'Associations' do
    it { is_expected.to belong_to(:year_bill).optional(true) }
    it { is_expected.to have_many(:bills) }
  end
end

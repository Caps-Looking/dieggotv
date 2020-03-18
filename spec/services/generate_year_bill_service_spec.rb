require 'rails_helper'

describe 'Create year bill', type: :service do
  let!(:customer) { create(:customer, :with_package_and_additional_services) }
  let!(:month_bills) { create_list(:month_bill, 12) }

  it { expect { GenerateYearBillService.perform(month_bills, customer) }.to change(YearBill, :count).by(1) }
  it 'Verify saved YearBill' do
    date = 1.year.from_now
    expect(GenerateYearBillService.perform(month_bills, customer)).to be_a(YearBill) &
      have_attributes(
          init_date: Date.current,
          end_date: Date.new(date.year, date.month, date.day),
          total_sum: 4260.0
      )
  end
end

require 'rails_helper'

describe 'Create month bill', type: :service do
  let!(:bills) { create_list(:bill, 2, price: 150.0) }
  let!(:package_bill) { create(:bill, price: 55.0) }

  it { expect { GenerateMonthBillService.perform(bills, 1.month.from_now) }.to change(MonthBill, :count).by(1) }
  it 'Verify saved MonthBill' do
    bills << package_bill
    date = 1.month.from_now
    expect(GenerateMonthBillService.perform(bills, 1.month.from_now)).to be_a(MonthBill) &
     have_attributes(
       total_sum: 355.0,
       due_date_for: Date.new(date.year, date.month, date.day)
     )
  end
end

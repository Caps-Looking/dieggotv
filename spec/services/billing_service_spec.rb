require 'rails_helper'

describe 'Create billings', type: :service do
  let!(:customer) { create(:customer, :with_package_and_additional_services) }

  it { expect { BillingService.perform(customer) }.to change(YearBill, :count).by(1) }
  it { expect { BillingService.perform(customer) }.to change(MonthBill, :count).by(12) }
  it { expect { BillingService.perform(customer) }.to change(Bill, :count).by(36) }
end

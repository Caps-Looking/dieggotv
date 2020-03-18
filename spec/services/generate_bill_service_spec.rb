require 'rails_helper'

describe 'Create bills', type: :service do
  let!(:customer) { create(:customer, :with_package_and_additional_services) }
  it { expect { GenerateBillService.perform(customer, 1.month.from_now) }.to change(Bill, :count).by(3) }
end

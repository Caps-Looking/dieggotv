require 'rails_helper'

feature 'Customer Deleting' do
  given!(:customer) { create(:customer, :with_package_and_additional_services) }

  background { visit customers_path }

  scenario 'Deleting a customer' do
    within 'table tbody' do
      within(page.find('tr', text: customer.name)) { find('a[data-title="Delete"]').click }
      expect(page).not_to have_selector('tr', text: customer.name)
    end
  end
end

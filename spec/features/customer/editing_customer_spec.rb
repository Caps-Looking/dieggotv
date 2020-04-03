require 'rails_helper'

feature 'Customer Creating' do
  given!(:package) { create(:package) }
  given!(:additional_service) { create(:additional_service) }
  given!(:customer) { create(:customer, :with_package_and_additional_services) }

  background do
    visit customers_path
    within 'table tbody' do
      within(page.find('tr', text: customer.name)) { find('a[data-title="Edit"]').click }
    end
  end

  context 'with valid params' do
    scenario 'edits a customer' do
      fill_in 'Cpf', with: '12312312313'
      click_button 'Save'

      expect(page).to have_text(customer.name) &&
                      have_text('123.123.123-13') &&
                      have_text(customer.customers_package.package.name)
    end
  end

  context 'with invalid params' do
    scenario 'shows error message' do
      fill_in 'Name', with: ''
      click_button 'Save'

      expect(page).to have_text("can't be blank")
    end
  end
end


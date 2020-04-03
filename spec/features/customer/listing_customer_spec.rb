require 'rails_helper'

feature 'Customer Listing' do
  given!(:customers) { create_list(:customer, 2, :with_package_and_additional_services) }
  given(:customer) { customers.first }

  background { visit customers_path }

  scenario 'Listing customers' do
    expect(page).to have_link('new')

    within 'table tbody' do
      expect(page).to have_selector('tr', count: 2)

      within(page.find('tr', text: customer.name)) do
        within('td:nth-child(1)') { expect(page).to have_text(customer.id) }
        within('td:nth-child(2)') { expect(page).to have_text(customer.name) }
        within('td:nth-child(3)') { expect(page).to have_text(CPF.new(customer.cpf).formatted) }
        within('td:nth-child(4)') { expect(page).to have_text(customer.customers_package.package.name) }

        within('td:nth-child(5)') do
          expect(page).to have_selector('a[data-title="Show"]') &&
                              have_selector('a[data-title="Edit"]') &&
                              have_selector('a[data-title="Delete"]')
        end
      end
    end
  end
end

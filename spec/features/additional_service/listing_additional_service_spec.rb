require 'rails_helper'

feature 'Additional Service Listing' do
  given!(:additional_services) { create_list(:additional_service, 2) }
  given(:additional_service) { additional_services.first }

  background { visit additional_services_path }

  scenario 'Listing Additional Services' do
    expect(page).to have_link('new')

    within 'table tbody' do
      expect(page).to have_selector('tr', count: 2)

      within(page.find('tr', text: additional_service.name)) do
        within('td:nth-child(1)') { expect(page).to have_text(additional_service.id) }
        within('td:nth-child(2)') { expect(page).to have_text(additional_service.name) }
        within('td:nth-child(3)') { expect(page).to have_text(additional_service.price) }

        within('td:nth-child(4)') do
          expect(page).to have_selector('a[data-title="Show"]') &&
                              have_selector('a[data-title="Edit"]') &&
                              have_selector('a[data-title="Delete"]')
        end
      end
    end
  end
end


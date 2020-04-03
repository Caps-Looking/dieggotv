require 'rails_helper'

feature 'Package Listing' do
  given!(:packages) { create_list(:package, 2) }
  given(:package) { packages.first }

  background { visit packages_path }

  scenario 'Listing packages' do
    expect(page).to have_link('new')

    within 'table tbody' do
      expect(page).to have_selector('tr', count: 2)

      within(page.find('tr', text: package.name)) do
        within('td:nth-child(1)') { expect(page).to have_text(package.id) }
        within('td:nth-child(2)') { expect(page).to have_text(package.name) }
        within('td:nth-child(3)') { expect(page).to have_text(package.price) }

        within('td:nth-child(4)') do
          expect(page).to have_selector('a[data-title="Show"]') &&
                          have_selector('a[data-title="Edit"]') &&
                          have_selector('a[data-title="Delete"]')
        end
      end
    end
  end
end

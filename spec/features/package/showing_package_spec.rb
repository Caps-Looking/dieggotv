require 'rails_helper'

feature 'Package Showing' do
  given!(:package) { create(:package) }

  background { visit packages_path }

  scenario 'Showing a package' do
    within 'table tbody' do
      within(page.find('tr', text: package.name)) { find('a[data-title="Show"]').click }
    end

    expect(page).to have_link('edit') &&
                    have_text(package.id) &&
                    have_text(package.name) &&
                    have_text(package.price)
  end
end

require 'rails_helper'

feature 'Package Deleting' do
  given!(:package) { create(:package) }

  background { visit packages_path }

  scenario 'Deleting a package' do
    within 'table tbody' do
      within(page.find('tr', text: package.name)) { find('a[data-title="Delete"]').click }
      expect(page).not_to have_selector('tr', text: package.name)
    end
  end
end

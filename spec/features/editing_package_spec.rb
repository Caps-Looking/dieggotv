require 'rails_helper'

feature 'Package Editing' do
  given!(:package) { create(:package) }

  background do
    visit packages_path
    within 'table tbody' do
      within(page.find('tr', text: package.name)) { find('a[data-title="Edit"]').click }
    end
  end

  context 'with valid params' do
    scenario 'edits a package' do
      fill_in 'Price', with: 65.0
      click_button 'Save'

      expect(page).to have_text(package.name) && have_text('65.0')
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

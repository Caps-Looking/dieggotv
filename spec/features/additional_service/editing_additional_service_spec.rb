require 'rails_helper'

feature 'Additional Service Editing' do
  given!(:additional_service) { create(:additional_service) }

  background do
    visit additional_services_path
    within 'table tbody' do
      within(page.find('tr', text: additional_service.name)) { find('a[data-title="Edit"]').click }
    end
  end

  context 'with valid params' do
    scenario 'edits an additional service' do
      fill_in 'Price', with: 165.0
      click_button 'Save'

      expect(page).to have_text(additional_service.name) && have_text('165.0')
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

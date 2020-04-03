require 'rails_helper'

feature 'Additional Service Creating' do
  background do
    visit additional_services_path
    click_link 'new'
  end

  context 'with valid params' do
    scenario 'creates an additional service' do
      fill_in 'Name', with: 'Premiere FC'
      fill_in 'Price', with: 150.0
      click_button 'Save'

      expect(page).to have_text('Premiere FC') && have_text('150.0')
    end
  end

  context 'with invalid params' do
    scenario 'shows error message' do
      fill_in 'Name', with: 'Premiere FC'
      click_button 'Save'

      expect(page).to have_text("can't be blank")
    end
  end
end

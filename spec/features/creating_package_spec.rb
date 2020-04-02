require 'rails_helper'

feature 'Package Creating' do
  background do
    visit packages_path
    click_link 'new'
  end

  context 'with valid params' do
    scenario 'creates a package' do
      fill_in 'Name', with: 'Basic'
      fill_in 'Price', with: 55.0
      click_button 'Save'

      expect(page).to have_text('Basic') && have_text('55.0')
    end
  end

  context 'with invalid params' do
    scenario 'shows error message' do
      fill_in 'Name', with: 'Basic'
      click_button 'Save'

      expect(page).to have_text("can't be blank")
    end
  end
end

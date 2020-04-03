require 'rails_helper'

feature 'Customer Creating' do
  given!(:package) { create(:package) }
  given!(:additional_service) { create(:additional_service) }

  background do
    visit customers_path
    click_link 'new'
  end

  context 'with valid params' do
    scenario 'creates a customer' do
      fill_in 'Name', with: 'John Doe'
      fill_in 'Cpf', with: '12312312312'
      select package.name, from: 'customer_customers_package_attributes_package_id'

      click_button 'Save'

      expect(page).to have_text('John Doe') &&
                      have_text('123.123.123-12') &&
                      have_text(package.name)
    end
  end

  context 'with invalid params' do
    scenario 'shows error message' do
      fill_in 'Name', with: 'John Doe'
      click_button 'Save'

      expect(page).to have_text("can't be blank")
    end
  end
end

require 'rails_helper'

feature 'Additional Service Deleting' do
  given!(:additional_service) { create(:additional_service) }

  background { visit additional_services_path }

  scenario 'Deleting an additional service' do
    within 'table tbody' do
      within(page.find('tr', text: additional_service.name)) { find('a[data-title="Delete"]').click }
      expect(page).not_to have_selector('tr', text: additional_service.name)
    end
  end
end


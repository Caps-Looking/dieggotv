require 'rails_helper'

feature 'Additional Service Showing' do
  given!(:additional_service) { create(:additional_service) }

  background { visit additional_services_path }

  scenario 'Showing an additional service' do
    within 'table tbody' do
      within(page.find('tr', text: additional_service.name)) { find('a[data-title="Show"]').click }
    end

    expect(page).to have_link('edit') &&
                    have_text(additional_service.id) &&
                    have_text(additional_service.name) &&
                    have_text(additional_service.price)
  end
end


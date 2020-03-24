require 'rails_helper'

describe 'Package Listing', :js, type: :feature do
  packages = []
  before(:all) do
    packages = FactoryBot.create_list(:package, 5)
  end

  before(:each) do
    visit packages_path
  end

  scenario 'Accessing index page' do
    expect(page).to have_link('new', href: new_package_path) &&
      have_table &&
      have_xpath('.//tr', count: 6)

    within 'table' do
      within 'tr:nth-child(2)' do
        expect(page).to have_link('eye', href: package_path(packages[0].id)) &&
          have_link('edit', href: edit_package_path(packages[0].id)) &&
          have_link('trash', href: package_path(packages[0].id))
      end
    end
  end

  scenario 'Deleting a package' do
    expect(page).to have_xpath('.//tr', count: 6)
    within 'table' do
      within 'tr:nth-child(2)' do
        click_link('trash')
      end
    end
    accept_alert
    expect(page).to have_xpath('.//tr', count: 5)
  end
end

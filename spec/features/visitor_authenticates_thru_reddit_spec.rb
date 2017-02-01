require 'rails_helper'

RSpec.feature 'Authentication through Reddit', :type => :feature do
  scenario 'Visitor visits root path and authenticates through reddit' do
    visit root_path

    click_link "Login through Reddit"
    click_on "Allow"

    expect(page).to have_content("Successfully logged in")
  end
end

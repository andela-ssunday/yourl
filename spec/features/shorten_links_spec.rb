require 'rails_helper'
require 'pry'

RSpec.feature "ShortenLinks", type: :feature do
  Capybara.default_driver = :selenium

  scenario "User can shorten links" do
    visit root_path

    fill_in "link[long_url]", with: "www.google.com"

    click_button "Create Link"
    expect(page).to have_selector(".short_url")

    expect(response).to redirect_to("http://www.google.com")

    expect(response).to redirect_to "www.google.com"

  end

end

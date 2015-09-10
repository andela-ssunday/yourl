require 'rails_helper'
require 'pry'

RSpec.feature "ShortenLinks", type: :feature do
  Capybara.default_driver = :selenium
  Capybara.server_port = 31337

  scenario "User can shorten links" do
    visit root_path

    expect(page).to have_content("YouRL")

    fill_in "link[long_url]", with: "www.google.com"

    click_button "Create Link"

    expect(page).to have_selector(".short_url")


    link = (find(:xpath, "//input[@class='short_url']").value).gsub("/", ":31337/")


    visit "http://"+link

    expect(page).to have_content("Google")

    expect(page).not_to have_content("YouRL")


  end

end
